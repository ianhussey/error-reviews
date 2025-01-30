reproduce_summary_data_exp_2 <- function()
{
  full_perceptual_task_dat_exp_2 <- cache_results("get_full_perceptual_task_dat_exp_2()")
  full_questionnaire_dat_exp_2   <- cache_results("get_full_questionnaire_dat_exp_2()")

  reproduced_dat_exp_2 <- combine_reproduced_dat(full_perceptual_task_dat_exp_2,
                                                 full_questionnaire_dat_exp_2)
  reproduced_dat_exp_2
}
