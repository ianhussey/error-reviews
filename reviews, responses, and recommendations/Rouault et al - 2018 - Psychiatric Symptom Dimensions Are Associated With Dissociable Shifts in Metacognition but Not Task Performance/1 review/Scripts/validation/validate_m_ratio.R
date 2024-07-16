# I validated whether the M-Ratio fits are reasonably reproducible.
validate_m_ratio <- function(original_dat_exp_2, reproduced_dat_exp_2)
{
  # Their M-Ratio values deviate from my reproduction. This is due to the
  # fitting method they used, which they did in Matlab. I have used a
  # different implementation. I assume that the problem comes from too many
  # confidence bins which are not fully used by the participants.
  plot(original_dat_exp_2$mRatio, reproduced_dat_exp_2$m_ratio)
  cor(original_dat_exp_2$mRatio, reproduced_dat_exp_2$m_ratio)

  hist(original_dat_exp_2$mRatio)
  hist(reproduced_dat_exp_2$m_ratio)

  # Excluding outliers, I at least get a somewhat decent correlation between
  # their fits an mine.
  s <- reproduced_dat_exp_2$m_ratio > -2.5 & reproduced_dat_exp_2$m_ratio < 5
  plot(original_dat_exp_2$mRatio[s], reproduced_dat_exp_2$m_ratio[s])
  cor(original_dat_exp_2$mRatio[s], reproduced_dat_exp_2$m_ratio[s])

  invisible(dev.off())
}