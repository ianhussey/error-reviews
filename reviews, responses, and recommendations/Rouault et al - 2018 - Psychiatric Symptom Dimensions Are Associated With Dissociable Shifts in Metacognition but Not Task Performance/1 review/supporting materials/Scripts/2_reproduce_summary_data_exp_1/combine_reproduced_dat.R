combine_reproduced_dat <- function(full_perceptual_task_dat, full_questionnaire_dat)
{
  # ID, Age, Gender, Accuracy, M-Ratio etc.
  perceptual_task_summary_information <- get_perceptual_task_summary_information(full_perceptual_task_dat)

  reproduced_dat <- merge(perceptual_task_summary_information, 
                          full_questionnaire_dat, 
                          by = "subj_id")
  reproduced_dat
}

