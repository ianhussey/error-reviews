validate_model_comparison <- function(reproduced_dat_exp_2,
                                      original_dat_exp_2)
{  
  library(gmgm)

  # Accuracy
  model_1 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, accuracy ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  # Non-decision time
  model_1 <- lm(data = original_dat_exp_2, t.sc ~ gender)
  summary(model_1)
  model_2 <- lm(data = original_dat_exp_2, t.sc ~ gender + age.sc + iq.sc)
  summary(model_2)
  model_3 <- lm(data = original_dat_exp_2, t.sc ~ gender + age.sc + iq.sc + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)
  
  BIC(model_1) - BIC(model_2)
  BIC(model_2) - BIC(model_3)

  # Mean confidence
  model_1 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, mean_confidence ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  # M-Ratio
  model_1 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender)
  summary(model_1)
  model_2 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender + age + iq)
  summary(model_2)
  model_3 <- lm(data = reproduced_dat_exp_2, m_ratio ~ gender + age + iq + AD + Compul + SW)
  summary(model_3)
  anova(model_1, model_2, model_3)

  BIC(model_2) - BIC(model_3)

  invisible()

  cat("Model Fits with Bayesian Information Criterion

  Although I do not get exactly the same BIC values in my reanalyses, the
  qualitative pattern of results is very consistent with what the authors
  report.

  \n")
}