save_plot <- function(filename, format)
{
  full_filename <- paste0("Output/", filename, ".", format)
  cat("Save Figure to ", full_filename, ".\n", sep = "")

  if (format == "pdf" ) save_function <- dev.copy2pdf
  if (format == "eps" ) save_function <- dev.copy2eps

  save_function(file = full_filename)
  
  invisible(dev.off())
}
