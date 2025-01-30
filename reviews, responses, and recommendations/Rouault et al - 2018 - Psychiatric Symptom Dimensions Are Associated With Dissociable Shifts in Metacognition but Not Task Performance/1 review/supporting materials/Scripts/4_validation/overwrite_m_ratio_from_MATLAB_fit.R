overwrite_m_ratio_from_MATLAB_fit_exp_1 <- function(reproduced_dat_exp_1)
{
  m_ratios <- read.csv("Input/exp_1_m_ratios.csv",
                     header = FALSE)$V1
  reproduced_dat_exp_1$m_ratio <- m_ratios
  reproduced_dat_exp_1
}

overwrite_m_ratio_from_MATLAB_fit_exp_2 <- function(reproduced_dat_exp_2)
{
  m_ratios <- read.csv("Input/exp_2_m_ratios.csv",
                     header = FALSE)$V1
  reproduced_dat_exp_2$m_ratio <- m_ratios
  reproduced_dat_exp_2
}
