validate_difficulty_results <- function(full_perceptual_task_dat_exp_1)
{
  # Some trials are missing for participants. There was probably an exclusion
  # criterion on RTs.
  table(full_perceptual_task_dat_exp_1$subj_id)
  head(full_perceptual_task_dat_exp_1)
  summary(as.numeric(table(full_perceptual_task_dat_exp_1$subj_id) / 210))

  # In the paper, stimulus deviations (how many more dots were in on compared
  # to the other dot cloud) was binned into 6 difficulty bins. The data
  # overall looks very clean so that the binning seems almost not necessary.
  coherence_accuracy_dat <- aggregate(data = full_perceptual_task_dat_exp_1, 
                                      correct ~ stimdevi                   , 
                                      mean                                 )
  plot(coherence_accuracy_dat)

  coherence_rt_dat <- aggregate(data = full_perceptual_task_dat_exp_1, 
                                rt ~ stimdevi                        , 
                                mean                                 )
  plot(coherence_rt_dat)

  # Accuracy and confidence histograms are also comparable to what the authors
  # produced although I don't quite know their binning scheme.
  accuracies <- aggregate(data = full_perceptual_task_dat_exp_1,
                          correct ~ subj_id                    ,
                          mean                                 )$correct
  hist(accuracies, seq(0.5, 1, .015))

  confidences <- aggregate(data = full_perceptual_task_dat_exp_1,
                           new_confid ~ subj_id                 ,
                           mean                                 )$new_confid
  confidences <- confidences / 6
  hist(confidences, seq(0, 1, .015))

  invisible(dev.off())
}
