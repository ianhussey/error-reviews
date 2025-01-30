validate_loading_similarity_exp_1_vs_2 <- function(reproduced_dat_exp_1,
                                                   reproduced_dat_exp_2)
{
  loadings_1 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_1,
                                                  should_return_loadings = TRUE)
  loadings_2 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2,
                                                  should_return_loadings = TRUE)

  items_in_both_experiments <- intersect(rownames(loadings_1),
                                         rownames(loadings_2))
  s_1 <- rownames(loadings_1) %in% items_in_both_experiments
  s_2 <- rownames(loadings_2) %in% items_in_both_experiments

  # Rows are Experiment 1, Columns are Experiment 2
  cor(loadings_1[s_1,], loadings_2[s_2,])
}
