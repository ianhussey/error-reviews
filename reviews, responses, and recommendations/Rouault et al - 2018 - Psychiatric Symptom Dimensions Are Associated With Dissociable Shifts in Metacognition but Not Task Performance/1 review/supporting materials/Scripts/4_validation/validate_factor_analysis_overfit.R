validate_factor_analysis_overfit <- function(reproduced_dat,
                                             reference_loadings)
{ 
  # We perform K-fold crossvalidation to determine factors on the training set
  # and evaluate the regression coefficients in the test set.
  K_fold  <- 10
  indices <- rep(1:K_fold, ceiling(nrow(reproduced_dat)/K_fold))
  indices <- indices[1:nrow(reproduced_dat)]
  set.seed(2024-08-07-1103)
  indices <- sample(indices)
  coefficient_results <- data.frame()
  for (k in 1:K_fold)
  {
    train_dat = reproduced_dat[indices != k, ]
    test_dat  = reproduced_dat[indices == k, ]
    coefficient_result <- evaluate_crossvalidated_regression(train_dat,
                                                             test_dat,
                                                             reference_loadings)
    coefficient_result$fold <- k
    coefficient_results <- rbind(coefficient_results, coefficient_result)
  }
  coefficient_results

  M   <- aggregate(data = coefficient_results, 
                   coefficient ~ regressor * regressand,
                   mean)
  SEM <- aggregate(data = coefficient_results, 
                   coefficient ~ regressor * regressand,
                   get_sem)
  M$sem <- SEM$coefficient

  M
}

evaluate_crossvalidated_regression <- function(train_dat, 
                                               test_dat,
                                               reference_loadings)
{
  nrow(train_dat)
  nrow(test_dat)

  loadings <- reproduce_factor_analysis_results(train_dat, 
                                                should_return_loadings = TRUE)
  
  # Determine scores for the participants in the test set
  relevant_variables <- get_factor_analysis_dat(reproduced_dat = test_dat)
  relevant_variables <- as.matrix(relevant_variables)
  test_factor_scores <- relevant_variables %*% loadings

  # Associate the factors with the symptom clusters
  items_in_both <- intersect(rownames(loadings),
                             rownames(reference_loadings))
  s_1 <- rownames(loadings)           %in% items_in_both
  s_2 <- rownames(reference_loadings) %in% items_in_both

  reference_correlation <- cor(loadings[s_1, ],
                               reference_loadings[s_2, ])
  # print(reference_correlation)

  AD_idx     <- which.max(reference_correlation[, 1])
  Compul_idx <- which.max(reference_correlation[, 2])
  SW_idx     <- which.max(reference_correlation[, 3])

  if ( !all(sort(c(AD_idx, Compul_idx, SW_idx)) == 1:3) )
    stop("Factor association unclear")
    
  test_dat$AD     <- test_factor_scores[, AD_idx]
  test_dat$Compul <- test_factor_scores[, Compul_idx]
  test_dat$SW     <- test_factor_scores[, SW_idx]

  coef_dat <- get_regression_coefficients(test_dat)
  coef_dat
}

