reproduce_factor_analysis_results <- function(reproduced_dat,
                                              should_return_loadings = FALSE)
{
  # Subselect all raw scores on questionnaires
  factor_analysis_dat <- get_factor_analysis_dat(reproduced_dat)

  # Conduct factor analysis  
  set.seed(2024-06-19-1306)
  correlation_matrix <- cor(factor_analysis_dat)
  factor_analysis_result <- fa(r        = correlation_matrix  ,
                               nfactors = 3                   ,
                               n.obs    = nrow(reproduced_dat),
                               rotate   = "oblimin"           ,
                               fm       = "ml"                , 
                               scores   = "regression"        )
  # Different fitting methdos yield similar results

  loadings <- factor_analysis_result$loadings
  if (should_return_loadings) return(loadings)

  # The second and third factor names are only appropriate for Experiment 2
  scores <- factor.scores(x=factor_analysis_dat, f=factor_analysis_result)$scores
  scores_dat <- data.frame(scores)
  names(scores_dat) <- c("F1", "F2", "F3")

  reproduced_dat <- cbind(reproduced_dat, scores_dat)
  reproduced_dat
}
