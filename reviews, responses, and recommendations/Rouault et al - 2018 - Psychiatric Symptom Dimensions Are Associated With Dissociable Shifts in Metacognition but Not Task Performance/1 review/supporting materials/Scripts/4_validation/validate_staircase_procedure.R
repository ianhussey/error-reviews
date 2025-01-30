# I validated whether the staircase procedure obscured confounds with M-Ratio
validate_staircase_procedure <- function(original_dat_exp_2,
                                         reproduced_dat_exp_2)
{
  # There were no correlations with the symptom clusters
  cor.test(reproduced_dat_exp_2$var_stimdevi, reproduced_dat_exp_2$AD)
  cor.test(reproduced_dat_exp_2$var_stimdevi, reproduced_dat_exp_2$Compul)
  cor.test(reproduced_dat_exp_2$var_stimdevi, reproduced_dat_exp_2$SW)

  # There were no correlations with M-Ratio, neither the original values nor
  # my reproduced values
  cor.test(reproduced_dat_exp_2$var_stimdevi, original_dat_exp_2$mRatio)
  plot(reproduced_dat_exp_2$var_stimdevi, original_dat_exp_2$mRatio,
       xlab = "Variability of Stimulus Difficulty (stimdevi)",
       ylab = "Estimated M-Ratio")

  # Taken together, the staircase procedure problem did not manifest in the
  # data

  cat("Problem With Staircase Procedure and M-Ratio

  Although I hypothesized that there is a confound due to the staircase
  procedure, I found no problems here. A problem could have occured if some
  participants had a higher variability in the staircase while others had a
  more stable staircase trajectory. In that case, the former participants
  would have more differentiable difficulty levels in the stimuli which would
  then easily be mistaken for a good metacognitive ability (high M-Ratio)
  compared to the latter participants with less differentiable difficulties.
  This was not the case.

  \n")
}