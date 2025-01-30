get_full_perceptual_task_dat_exp_1 <- function()
{
  mat_files <- cache_results("get_mat_files()")
  mat_file  <- mat_files[[1]]

  n   <- get_number_of_participants(mat_file)
  dat <- data.frame()
  for (i_participant in 1:n)
  {
    individual_dat <- get_individual_perceptual_task_dat_exp_1(mat_file , i_participant)
    dat            <- rbind(dat, individual_dat)
  }
  dat
}

get_individual_perceptual_task_dat_exp_1 <- function(mat_file, i_participant)
{
  individual_dat  <- mat_file$analyseddata[1, i_participant][[1]][[1]][,,1]$data
  individual_dat  <- as.data.frame(individual_dat)
  
  variable_labels <- get_variable_labels_for_dat(mat_file, i_participant)
  variable_labels[1] <- "i_participant"

  names(individual_dat) <- variable_labels
  individual_dat
}
