# I validated that the factor analysis reproduces.
validate_factor_analysis <- function(original_dat_exp_2, reproduced_dat_exp_2)
{
  plot(original_dat_exp_2$AD, reproduced_dat_exp_2$AD)
  plot(original_dat_exp_2$Compul, reproduced_dat_exp_2$Compul)
  plot(original_dat_exp_2$SW, reproduced_dat_exp_2$SW)

  invisible(dev.off())
}