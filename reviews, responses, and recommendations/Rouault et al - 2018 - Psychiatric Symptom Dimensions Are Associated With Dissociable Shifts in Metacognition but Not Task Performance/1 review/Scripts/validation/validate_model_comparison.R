# I validated model comparisons
validate_model_comparison <- function(reproduced_dat_exp_2)
{  
  library(gmgm)

  model_1 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  model_1 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  model_1 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  invisible()
}