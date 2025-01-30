# I validated whether the M-Ratio fits are reasonably reproducible.
validate_m_ratio <- function(original_dat_exp_2,
                             reproduced_dat_exp_2)
{
  # Their M-Ratio values deviate from my reproduction. This is due to the
  # fitting method they used, which they did in Matlab. I have used a
  # different implementation. I assume that the problem comes from too many
  # confidence bins which are not fully used by the participants.
  plot(original_dat_exp_2$mRatio, reproduced_dat_exp_2$m_ratio)
  cor(original_dat_exp_2$mRatio, reproduced_dat_exp_2$m_ratio)

  # Excluding outliers, I at least get a somewhat decent correlation between
  # their fits an mine.
  s <- reproduced_dat_exp_2$m_ratio > -2.5 & reproduced_dat_exp_2$m_ratio < 5
  plot(original_dat_exp_2$mRatio[s], m_ratios[s], 
       xlab = "Original M-Ratio Values",
       ylab = "Reproduced M-Ratio Values")
  cor(original_dat_exp_2$mRatio[s], reproduced_dat_exp_2$m_ratio[s])

  # From Matlab fit
  m_ratios <- read.csv("Input/exp_2_m_ratios.csv",
                     header = FALSE)$V1
  cor(original_dat_exp_2$mRatio, m_ratios)

  cat("M-Ratio Fit

  I chose another M-Ratio fit than the authors and found deviating values.
  After accounting for extreme outliers, there is a relatively good
  correlation between my and their M-Ratio values.

  \n")
}