validate_reliabilities <- function(full_perceptual_task_dat_exp_1,
                                   full_perceptual_task_dat_exp_2)
{
  # Reliabilities of accuracy and confidence in Experiment 1 via Monte Carlo
  # sampling
  bootstrap_dat <- get_bootstrap_dat(full_perceptual_task_dat_exp_1)
  bootstrapped_confidences <- aggregate(data = bootstrap_dat,
            new_confid ~ i_participant,
            mean)$new_confid
  bootstrapped_accuracies <- aggregate(data = bootstrap_dat,
            correct ~ i_participant,
            mean)$correct

  accuracies <- aggregate(data = full_perceptual_task_dat_exp_1,
            correct ~ i_participant,
            mean)$correct
  confidences <- aggregate(data = full_perceptual_task_dat_exp_1,
            new_confid ~ i_participant,
            mean)$new_confid

  cor(accuracies, bootstrapped_accuracies)   # ~ .90
  cor(confidences, bootstrapped_confidences) # ~ .99


  # Reliabilities of accuracy and confidence in Experiment 2 via Monte Carlo
  # sampling
  bootstrap_dat <- get_bootstrap_dat(full_perceptual_task_dat_exp_2)
  bootstrapped_confidences <- aggregate(data = bootstrap_dat,
            new_confid ~ i_participant,
            mean)$new_confid
  bootstrapped_accuracies <- aggregate(data = bootstrap_dat,
            correct ~ i_participant,
            mean)$correct


  accuracies <- aggregate(data = full_perceptual_task_dat_exp_2,
            correct ~ i_participant,
            mean)$correct
  confidences <- aggregate(data = full_perceptual_task_dat_exp_2,
            new_confid ~ i_participant,
            mean)$new_confid

  cor(accuracies, bootstrapped_accuracies)   # ~ .5
  cor(confidences, bootstrapped_confidences) # ~ .99

  # Reliabiliites of M-Ratio values (fitting done in MATLAB)
  m_ratios <- read.csv("Input/exp_1_m_ratios.csv",
                     header = FALSE)$V1
  bootstrap_m_ratios <- read.csv("Input/exp_1_bootstrapped_m_ratios.csv",
                                 header = FALSE)
  atanh(mean(tanh(cor(m_ratios, bootstrap_m_ratios)))) # Rel ~ .64


  m_ratios <- read.csv("Input/exp_2_m_ratios.csv",
                     header = FALSE)$V1
  bootstrap_m_ratios <- read.csv("Input/exp_2_bootstrapped_m_ratios.csv",
                                 header = FALSE)
  atanh(mean(tanh(cor(m_ratios, bootstrap_m_ratios)))) # Rel ~ .19


  cat("Reliabilities of Perceptual Task Measures

  The reliabilities of accuracies and mean confidence ratings in Experiment 1
  are very good with values of around .90 and .99. The reliability of
  M-Ratio is less good with Rel ~ .64.

  In Experiment 2, the accuracy was kept constant by a staircase procedure.
  This drops the reliability of accuracy down to around .5. The reliability
  of mean confidences remains high at .99. The reliability of M-Ratio drops
  further down to .19.

  Note that I used Monte Carlo bootstrap simulations to determine these
  reliabilities I did not use stratification because there were very trials
  per difficulty condition within the participants. So these results are only
  a rough approximation. But split-half reliabilities would also be
  problematic because I am not aware of a Spearman-Brown-like correction for
  reliabilities when using split-half reliabilities on M-Ratio.
  
  \n")
}

get_bootstrap_dat <- function(full_perceptual_task_dat, seed = NULL)
{
  if (!is.null(seed)) set.seed(2024-08-09-1205-seed)
  boot_list <- list()
  for (participant_id in unique(full_perceptual_task_dat$i_participant))
  {
    s        <- full_perceptual_task_dat$i_participant == participant_id
    part_dat <- full_perceptual_task_dat[s, ]
    s_boot   <- sample(1:nrow(part_dat), replace = TRUE)
    boot_dat <- part_dat[s_boot, ]
    boot_list[[length(boot_list) + 1]] <- boot_dat

    # cat("Participant ", participant_id, " done.\n")
  }
  boot_list
  bootstrap_dat <- do.call(rbind, boot_list)
  bootstrap_dat
}


