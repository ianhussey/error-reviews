get_mat_files <- function()
{
  # install.packages("R.matlab")
  library(R.matlab)

  filename_perceptual_task_exp_1 <- "Input/RouaultSeowGillanFleming-master/ME_phase1_excludanalyseddat_all.mat"
  filename_questionnaires_exp_1  <- "Input/RouaultSeowGillanFleming-master/ME_phase1_excludqnadata_all.mat"
  filename_perceptual_task_exp_2 <- "Input/RouaultSeowGillanFleming-master/ME_phase2_excludanalyseddat_all.mat"
  filename_questionnaires_exp_2  <- "Input/RouaultSeowGillanFleming-master/ME_phase2_excludqnadata_all.mat"

  mat_files <- list(mat_file_perceptual_task_exp_1 = readMat(filename_perceptual_task_exp_1),
                    mat_file_questionnaires_exp_1  = readMat(filename_questionnaires_exp_1 ),
                    mat_file_perceptual_task_exp_2 = readMat(filename_perceptual_task_exp_2),
                    mat_file_questionnaires_exp_2  = readMat(filename_questionnaires_exp_2 ))
  mat_files
}
