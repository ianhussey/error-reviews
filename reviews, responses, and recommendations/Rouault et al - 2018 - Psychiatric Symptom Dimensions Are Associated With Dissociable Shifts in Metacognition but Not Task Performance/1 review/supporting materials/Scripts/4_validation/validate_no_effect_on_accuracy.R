validate_no_effect_on_accuracy <- function(reproduced_dat_exp_1,
                                           reproduced_dat_exp_2)
{
  get_regression_coefficients(reproduced_dat_exp_1,
                              regressor  = c("z_AD", "z_Compul", "z_SW", "z_zung", "z_anxiety", "z_ocir", "z_liebowitz"),
                              regressand = c("accuracy"))
  get_regression_coefficients(reproduced_dat_exp_2,
                              regressor  = c("z_AD", "z_Compul", "z_SW", "z_zung", "z_anxiety", "z_ocir", "z_liebowitz"),
                              regressand = c("accuracy"))


  cat("Effect of Symptoms on Accuracy

  None of the factors and none of the raw questionnaire scores had a large
  effect on accuracy: We can exclude effect sizes larger than 1% per standard
  deviation on any of the independent variables.
  
  ")
}