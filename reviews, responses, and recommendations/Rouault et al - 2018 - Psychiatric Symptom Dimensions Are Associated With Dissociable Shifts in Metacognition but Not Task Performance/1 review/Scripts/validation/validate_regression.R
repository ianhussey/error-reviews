# I validated the regression results.
validate_regression <- function(reproduced_dat_exp_2)
{
  rep_dat <- reproduced_dat_exp_2
  rep_dat$gender          <- z_transform(rep_dat$gender)
  rep_dat$age             <- z_transform(rep_dat$age)
  rep_dat$iq              <- z_transform(rep_dat$iq)
  rep_dat$AD              <- z_transform(rep_dat$AD)
  rep_dat$Compul          <- z_transform(rep_dat$Compul)
  rep_dat$SW              <- z_transform(rep_dat$SW)
  rep_dat$accuracy        <- z_transform(rep_dat$accuracy)
  rep_dat$mean_confidence <- z_transform(rep_dat$mean_confidence)

  # Correlations are roughly in the same rage. I did not use the log transform
  # here because it seems unjustified. I wanted to check if the results
  # reproduce when dropping it and, yes, that seems to be the case.
  summary( model_accuracy_AD     <- lm(data = rep_dat, accuracy ~ gender + age + iq + AD)     )
  summary( model_accuracy_Compul <- lm(data = rep_dat, accuracy ~ gender + age + iq + Compul) )
  summary( model_accuracy_SW     <- lm(data = rep_dat, accuracy ~ gender + age + iq + SW)     )

  summary( model_mean_confidence_AD     <- lm(data = rep_dat, mean_confidence ~ gender + age + iq + AD)     )
  summary( model_mean_confidence_Compul <- lm(data = rep_dat, mean_confidence ~ gender + age + iq + Compul) )
  summary( model_mean_confidence_SW     <- lm(data = rep_dat, mean_confidence ~ gender + age + iq + SW)     )

  summary( model_m_ratio_AD     <- lm(data = rep_dat, m_ratio ~ gender + age + iq + AD)     )
  summary( model_m_ratio_Compul <- lm(data = rep_dat, m_ratio ~ gender + age + iq + Compul) )
  summary( model_m_ratio_SW     <- lm(data = rep_dat, m_ratio ~ gender + age + iq + SW)     )

  # Predictive model of symptom clusters
  summary( model_AD_mean_confidence    <- lm(data = rep_dat, AD ~ gender + age + iq + mean_confidence)     )
  summary( model_Compulmean_confidence <- lm(data = rep_dat, Compul ~ gender + age + iq + mean_confidence) )
  summary( model_SW_mean_confidence    <- lm(data = rep_dat, SW ~ gender + age + iq + mean_confidence)     )
  # R^2 scores fit to the regression coefficients the authors suggest. So
  # there is no problem with the interpretation of their regression
  # coefficients in terms of effect size.

  invisible()
}
