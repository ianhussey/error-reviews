# Transforms every element in x using the conversion mapping in "from"
# and "to". For example map(c(1,2,3), cbind(c(1,3), c("a", "c"))) results in c
# ("a", "2", "c").
map <- function(x, conversion_map)
{
  from <- conversion_map[, 1]
  to   <- conversion_map[, 2]
  
  for (i in seq_along(from))
  {
    from_i <- from[i]
    to_i <- to[i]
    x[x == from_i] <- to_i
  }
  x
}

reg_map <- function(x, conversion_map)
{
  from <- conversion_map[, 1]
  to   <- conversion_map[, 2]
  
  for (i in seq_along(from))
  {
    from_i <- from[i]
    to_i <- to[i]
    x[grep(from_i, x)] <- to_i
  }
  x
}
