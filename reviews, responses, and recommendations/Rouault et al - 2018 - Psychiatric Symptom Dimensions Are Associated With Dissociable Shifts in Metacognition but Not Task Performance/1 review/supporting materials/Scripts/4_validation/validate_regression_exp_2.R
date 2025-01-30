validate_regression <- function(reproduced_dat_exp_1,
                                reproduced_dat_exp_2)
{
  # In Experiment 1, we do not find pattern reported from Experiment 2:
  # Although Anxious-Depression (AD) is also associated with lower mean
  # confidences, two things are different. First, Compulsivness (C) is not
  # positively associated with mean confidences. Second, Social Withdrawal
  # (SW) is also negatively associated with mean confidences.
  get_regression_coefficients(reproduced_dat_exp_1)

  # Individual correlation tests yield the same picture.

  # zung (Depression) & anxiety (Social Anxiety) - Anxious-Depression (AD)
  # ocir (Obsessive-Compulsive Inventory-Revised) - Compulsivness (C)
  # liebowitz (Social Anxiety) - Social Withdrawal (SW)
  get_regression_coefficients(reproduced_dat_exp_1, 
                              regressor  = c("z_zung", "z_anxiety", "z_ocir", "z_liebowitz"),
                              regressand = c("z_accuracy", "z_mean_confidence", "z_m_ratio"))


  # In Experiment 2, we indeed find the reported pattern. AD is associated
  # with lower mean confidences and C with higher confidences.
  get_regression_coefficients(reproduced_dat_exp_2)

  get_regression_coefficients(reproduced_dat_exp_2, 
                              regressor  = c("z_zung", "z_anxiety", "z_ocir", "z_liebowitz"),
                              regressand = c("z_accuracy", "z_mean_confidence", "z_m_ratio"))

  # There may also be a problem with regard to the factor solution, which
  # could be less stable than the authors assumed. I perform a
  # crossvalidation analysis in which part of the data serves for
  # constructing the factors and another part for evaluating the regression.
  # We find the same results as before: Experiment 1 points towards a
  # negative association between AD and mean confidence, SW and confidence,
  # and if anything a negative trend for C and mean confidence. Experiment 2
  # reflects the original results: negative association between AD and mean
  # confidence as well as a positive association between C and mean
  # confidence.
  reference_loadings <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2,
                                                          should_return_loadings = TRUE)
  validate_factor_analysis_overfit(reproduced_dat = reproduced_dat_exp_2,
                                   reference_loadings)


  cat("Factor Analysis and Regression 

  For Experiment 2, the results seem stable even after applying cross
  validation (compute factors from a training set, then compute factor scores
  and regression coefficients from a separate test set).

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  However for Experiment 1, the results look different. Even after matching
  the factors to those of Experiment 2, we only find partially the same
  results. Consistently, factor Anxious-Depression (AD) has a negative
  association with mean confidence. But there is no positive association
  between factor Compulsivity (C) and mean confidence. Moreover,
  Social-Withdrawal (SW) also has a clear negative association with mean
  confidence. This also shows up in the cross validation analysis.

  Additionally, correlation analyses based on single questionnaires seem to
  support these findings. (But note that the regression analyses controlled
  for covariates gender, age, and IQ which is not reflected in these
  correlations.)
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  \n")
}
