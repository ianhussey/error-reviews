z_transform <- function(x)
{
  z <- ( x - mean(x) ) / sd(x)
  z
}
