validate_exp_2_factors_in_exp_1 <- function(reproduced_dat_exp_1,
                                            reproduced_dat_exp_2)
{
  # Get loadings from both experiments and determine questionnaire items that
  # were used in both
  loadings_1 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_1,
                                                   should_return_loadings = TRUE)

  loadings_2 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2,
                                                   should_return_loadings = TRUE)

  items_in_both_experiments <- intersect(rownames(loadings_1),
                                         rownames(loadings_2))
  s_1 <- rownames(loadings_1) %in% items_in_both_experiments
  s_2 <- rownames(loadings_2) %in% items_in_both_experiments


  # Compute scores for Experiment 1 based on loadings of Experiment 2
  fa_dat_exp_1 <- get_factor_analysis_dat(reproduced_dat_exp_1)

  dim(loadings_2[s_2, ])
  dim(as.matrix(fa_dat_exp_1)[, s_1])
  scores_exp_1_with_factors_from_exp_1 <- as.matrix(fa_dat_exp_1)[, s_1] %*% loadings_2[s_2, ]

  reproduced_dat_exp_1$AD     <- scores_exp_1_with_factors_from_exp_1[, 1]
  reproduced_dat_exp_1$Compul <- scores_exp_1_with_factors_from_exp_1[, 2]
  reproduced_dat_exp_1$SW     <- scores_exp_1_with_factors_from_exp_1[, 3]

  # Some sanity checks
  cor.test(reproduced_dat_exp_1$zung     , reproduced_dat_exp_1$AD)
  cor.test(reproduced_dat_exp_1$anxiety  , reproduced_dat_exp_1$AD)
  cor.test(reproduced_dat_exp_1$ocir     , reproduced_dat_exp_1$Compul)
  cor.test(reproduced_dat_exp_1$liebowitz, reproduced_dat_exp_1$SW)

  get_regression_coefficients(reproduced_dat_exp_1)

  cat("Evaluate Factors of Experiment 2 in Experiment 1

  When computing the scores for participants in Experiment 1 based on the
  factor loadings from Experiment 2, we find deviations again. The factors
  Anxious-Depression (AD) and Social Withdrawl (SW) are negatively related to
  the mean confidences. But Compulsivity (C) does not seem to have an effect
  anymore and rather points towards the negative direction contrary to the
  reported results.
  
  \n")
}