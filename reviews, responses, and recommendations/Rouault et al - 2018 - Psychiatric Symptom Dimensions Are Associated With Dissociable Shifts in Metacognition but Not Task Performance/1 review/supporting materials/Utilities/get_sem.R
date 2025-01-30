# Compute the standard error of the mean
get_sem <- function(x)
{
  n   <- length(x)
  sem <- sd(x) / sqrt(n)
  sem
}
