
get_full_perceptual_task_dat_exp_2 <- function()
{
  mat_files <- cache_results("get_mat_files()")
  mat_file  <- mat_files[[3]]

  n   <- get_number_of_participants(mat_file)
  dat <- data.frame()
  for (i_participant in 1:n)
  {
    individual_dat <- get_individual_perceptual_task_dat_exp_2(mat_file , i_participant)
    dat            <- rbind(dat, individual_dat)
  }
  dat
}

get_mat_files <- function()
{
# install.packages("R.matlab")
  library(R.matlab)
  mat_files <- list(mat_file_perceptual_task_exp_1 = readMat("Input/RouaultSeowGillanFleming-master/ME_phase1_excludanalyseddat_all.mat"),
                    mat_file_questionnaires_exp_1  = readMat("Input/RouaultSeowGillanFleming-master/ME_phase1_excludqnadata_all.mat")    ,
                    mat_file_perceptual_task_exp_2 = readMat("Input/RouaultSeowGillanFleming-master/ME_phase2_excludanalyseddat_all.mat"),
                    mat_file_questionnaires_exp_2  = readMat("Input/RouaultSeowGillanFleming-master/ME_phase2_excludqnadata_all.mat")    )
  mat_files
}


get_number_of_participants <- function(mat_file)
{
  n <- dim(mat_file$analyseddata)[2]
  n
}


get_individual_perceptual_task_dat_exp_2 <- function(mat_file, i_participant)
{
  individual_dat  <- mat_file$analyseddata[1, i_participant][[1]][[1]][,,1]$data
  individual_dat  <- as.data.frame(individual_dat)
  
  variable_labels <- get_variable_labels_for_dat(mat_file, i_participant)
  variable_labels <- variable_labels[-9] # Variable labels inconsistent
  variable_labels[1] <- "i_participant"

  names(individual_dat) <- variable_labels
  individual_dat
}

get_variable_labels_for_dat <- function(mat_file, i_participant)
{
  subj_labels <- mat_file$analyseddata[1, i_participant][[1]][[1]][,,1]$subjlabel[1,1:10]
  variable_labels <- as.character(lapply(subj_labels, \(x) x[[1]][1,1]))
  variable_labels
}
