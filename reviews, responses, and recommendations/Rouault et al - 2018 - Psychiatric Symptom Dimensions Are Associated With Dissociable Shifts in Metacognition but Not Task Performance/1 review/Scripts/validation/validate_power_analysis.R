validate_power_analysis <- function(reproduced_dat_exp_1)
{
  rep_dat <- reproduced_dat_exp_1
  rep_dat$gender          <- z_transform(rep_dat$gender)
  rep_dat$age             <- z_transform(rep_dat$age)
  rep_dat$iq              <- z_transform(rep_dat$iq)
  rep_dat$AD              <- z_transform(rep_dat$AD)
  rep_dat$accuracy        <- z_transform(rep_dat$accuracy)
  rep_dat$mean_confidence <- z_transform(rep_dat$mean_confidence)
  rep_dat$m_ratio         <- z_transform(rep_dat$m_ratio)

  # The regression coefficient they used for their power analysis is from
  # predicting mean confidence based on the Zung depression scale. I get a
  # slight deviation (r = -0.127 instead of r = -0.129), which I think is
  # acceptable for a reproduction.
  summary( model_accuracy_zung <- lm(data = rep_dat, accuracy ~ gender + age + iq + zung) )
  summary( model_mean_confidence_zung <- lm(data = rep_dat, mean_confidence ~ gender + age + iq + zung) )
  summary( model_m_ratio_zung <- lm(data = rep_dat, m_ratio ~ gender + age + iq + zung) )

  # install.packages("pwr")
  library(pwr)
  pwr.r.test(n = NULL, r = .13 , power = .8)
  pwr.r.test(n = NULL, r = .125, power = .8)

  invisible()
}
