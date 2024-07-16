reproduce_factor_analysis_results <- function(reproduced_dat)
{
  # Subselect all raw scores on questionnaires
  names(reproduced_dat)
  s <- grepl("raw", names(reproduced_dat)) & !grepl("iq", names(reproduced_dat))
  names(reproduced_dat)[s]
  factor_analysis_dat <- reproduced_dat[, s]

  # Conduct factor analysis
  library(psych)
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

  o_fig3 <- c(grep("alcohol", rownames(loadings)),
              grep("apathy", rownames(loadings)),
              grep("zung", rownames(loadings)),
              grep("eat", rownames(loadings)),
              grep("anxiety", rownames(loadings)),
              grep("impulsiveness", rownames(loadings)),
              grep("ocir", rownames(loadings)),
              grep("schizo", rownames(loadings)),
              grep("liebowitz", rownames(loadings)))

  length(grep("alcohol", rownames(loadings)))
  length(grep("apathy", rownames(loadings)))
  length(grep("zung", rownames(loadings)))
  length(grep("eat", rownames(loadings)))
  length(grep("anxiety", rownames(loadings)))
  length(grep("impulsiveness", rownames(loadings)))
  length(grep("ocir", rownames(loadings)))
  length(grep("schizo", rownames(loadings)))
  length(grep("liebowitz", rownames(loadings)))

  length(o_fig3)

  plot(loadings[o_fig3, 1], type = "h")
  plot(loadings[o_fig3, 2], type = "h")
  plot(loadings[o_fig3, 3], type = "h")
  dev.off()

  # The second and third factor names are only appropriate for Experiment 2
  scores <- factor.scores(x=factor_analysis_dat, f=factor_analysis_result)$scores
  scores_dat <- data.frame(scores)
  names(scores_dat) <- c("AD", "Compul", "SW")

  reproduced_dat <- cbind(reproduced_dat, scores_dat)
  reproduced_dat
}
