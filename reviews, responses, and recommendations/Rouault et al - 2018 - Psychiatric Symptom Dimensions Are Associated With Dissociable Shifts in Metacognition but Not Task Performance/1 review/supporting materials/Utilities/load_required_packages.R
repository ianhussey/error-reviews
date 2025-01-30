load_required_packages <- function()
{
  required_packages <- c("ggplot2", 
                         "gridExtra", 
                         "lme4", 
                         "plyr", 
                         "psych", 
                         "GPArotation", 
                         "paran", 
                         "reshape", 
                         "polycor", 
                         "nFactors", 
                         "R.matlab", 
                         "doBy", 
                         "pwr", 
                         "gmgm", 
                         "parallel")

  # Install and load packages if not already installed
  for (required_package in required_packages)
  {
    if (!require(required_package, character.only = TRUE)) 
    {
      install.packages(required_package)
      library(required_package, character.only = TRUE)
    }
  }
}
