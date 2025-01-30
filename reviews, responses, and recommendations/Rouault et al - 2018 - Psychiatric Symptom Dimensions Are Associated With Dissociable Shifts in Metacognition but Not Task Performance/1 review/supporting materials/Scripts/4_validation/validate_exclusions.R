validate_exclusions <- function(full_perceptual_task_dat_exp_1,
                                full_perceptual_task_dat_exp_2)
{
  # Some trials are missing for participants. There was probably an exclusion
  # criterion on RTs that the authors did not report.
  number_of_trials_per_participant <- table(full_perceptual_task_dat_exp_1$subj_id)
  maximum_number_of_trials <- 210
  hist(number_of_trials_per_participant)
  mean(number_of_trials_per_participant) # 208
  quantile(number_of_trials_per_participant, c(.01, .05)) # 200, 204

  number_of_trials_per_participant <- table(full_perceptual_task_dat_exp_2$subj_id)
  maximum_number_of_trials <- 210

  hist(number_of_trials_per_participant, 
       main = "",
       xlab = "Number of Trials per Participants After Exclusion")
  mean(number_of_trials_per_participant) # 208
  quantile(number_of_trials_per_participant, c(.01, .05)) # 199, 204

  cat("Unreported Exclusion of Trials

  The authors seem to have excluded some trials which was not reported in the
  paper. But these exclusions seem to be very minor with less than 2% of the
  trials being excluded.

  \n")
}