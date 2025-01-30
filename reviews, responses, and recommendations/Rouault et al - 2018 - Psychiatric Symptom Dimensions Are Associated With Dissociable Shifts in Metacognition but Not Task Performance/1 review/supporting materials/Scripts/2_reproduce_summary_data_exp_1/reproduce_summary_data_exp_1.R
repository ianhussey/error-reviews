reproduce_summary_data_exp_1 <- function()
{
  full_perceptual_task_dat_exp_1 <- cache_results("get_full_perceptual_task_dat_exp_1()")
  full_questionnaire_dat_exp_1   <- cache_results("get_full_questionnaire_dat_exp_1()")

  reproduced_dat_exp_1 <- combine_reproduced_dat(full_perceptual_task_dat_exp_1, 
                                                 full_questionnaire_dat_exp_1)
  reproduced_dat_exp_1
}


