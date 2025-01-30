cache_results <- function(function_call_as_string, overwrite = FALSE) 
{
  filename      <- paste0(function_call_as_string, ".Rdata")
  full_filename <- paste0("Output/Cache/", filename)
  
  if (!file.exists(full_filename) || overwrite)
  {
    cached_result <- eval(parse(text = function_call_as_string))
    save(cached_result, file = full_filename)
  }

  load(full_filename)
  cached_result
}