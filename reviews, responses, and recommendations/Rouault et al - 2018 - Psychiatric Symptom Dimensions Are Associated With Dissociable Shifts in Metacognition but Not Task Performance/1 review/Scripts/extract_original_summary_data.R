extract_original_summary_data <- function()
{
  setwd("Input/RouaultSeowGillanFleming-master/")
  source("Regressions.R")

  original_dat <- factorData

  setwd("../../")

  original_dat
}
