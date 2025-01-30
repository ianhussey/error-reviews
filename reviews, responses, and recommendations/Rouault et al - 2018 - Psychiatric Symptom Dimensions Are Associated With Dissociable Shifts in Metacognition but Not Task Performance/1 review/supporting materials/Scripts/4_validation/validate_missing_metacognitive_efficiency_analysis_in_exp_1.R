validate_missing_metacognitive_efficiency_analysis_in_exp_1 <- function(reproduced_dat_exp_1)
{
  summary( lm(data = reproduced_dat_exp_1, m_ratio ~ gender + age) )
  summary( lm(data = reproduced_dat_exp_1, m_ratio ~ gender + iq ) )
}