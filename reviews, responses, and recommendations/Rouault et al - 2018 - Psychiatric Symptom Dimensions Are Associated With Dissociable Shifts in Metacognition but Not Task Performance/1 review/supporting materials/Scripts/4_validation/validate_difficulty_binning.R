validate_difficulty_binning <- function(full_perceptual_task_dat_exp_1)
{
  # In the paper, stimulus deviations (how many more dots were in on compared
  # to the other dot cloud) was binned into 6 difficulty bins. But there was
  # no justification for this and it seemed to have been done post hoc. So
  # here I check whether a different binning would have changed results.
  coherence_accuracy_dat <- aggregate(data = full_perceptual_task_dat_exp_1, 
                                      correct ~ stimdevi                   , 
                                      mean                                 )
  plot(coherence_accuracy_dat,
       xlab = "Stimulus difficulty (stimdevi)",
       ylab = "Accuracy")

  coherence_rt_dat <- aggregate(data = full_perceptual_task_dat_exp_1, 
                                rt ~ stimdevi                        , 
                                mean                                 )
  plot(coherence_rt_dat,
       xlab = "Stimulus difficulty (stimdevi)",
       ylab = "Response Time")

  # Accuracy and confidence histograms are also comparable to what the authors
  # produced although I don't quite know their binning scheme.
  accuracies <- aggregate(data = full_perceptual_task_dat_exp_1,
                          correct ~ subj_id                    ,
                          mean                                 )$correct
  hist(accuracies, seq(0.5, 1, .015),
       xlab = "Accuracy")

  confidences <- aggregate(data = full_perceptual_task_dat_exp_1,
                           new_confid ~ subj_id                 ,
                           mean                                 )$new_confid
  confidences <- confidences / 6
  hist(confidences, seq(0, 1, .015),
       xlab = "Confidence")

  # dev.off()
  

  cat("Binning of Stimulus Difficulty

  Even though binning of stimulus difficulty seems to have been done post hoc
  without justfication, the results look very smooth so that there is no
  doubt about the validity of their reports on accuracy and RT relative to
  the stimulus difficulty in Experiment 1.

  \n")
}
