get_factor_analysis_dat <- function(reproduced_dat)
{
  names(reproduced_dat)
  s <- grepl("raw", names(reproduced_dat)) & !grepl("iq", names(reproduced_dat))
  names(reproduced_dat)[s]
  factor_analysis_dat <- reproduced_dat[, s]
  factor_analysis_dat
}
