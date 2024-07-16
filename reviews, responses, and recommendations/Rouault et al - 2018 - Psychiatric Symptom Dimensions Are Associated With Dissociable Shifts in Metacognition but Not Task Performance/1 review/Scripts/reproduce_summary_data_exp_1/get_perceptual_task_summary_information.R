get_perceptual_task_summary_information <- function(full_perceptual_task_dat)
{
  full_dat <- data.frame()
  cat("\n")
  for (i_participant in unique(full_perceptual_task_dat$i_participant))
  {
    cat("\r", i_participant, "/", length(unique(full_perceptual_task_dat$i_participant)), "\n")
    s <- full_perceptual_task_dat$i_participant == i_participant
    individual_perceptual_task_dat <- full_perceptual_task_dat[s, ]

    meta_fit <- reproduce_individual_meta_fit(individual_dat = individual_perceptual_task_dat)
    part_dat <- data.frame(subj_id         = unique(individual_perceptual_task_dat$subj_id) ,
                           age             = unique(individual_perceptual_task_dat$age)     ,
                           gender          = unique(individual_perceptual_task_dat$gender)  ,
                           mean_confidence = mean(individual_perceptual_task_dat$new_confid),
                           var_stimdevi    = var(individual_perceptual_task_dat$stimdevi)   ,
                           accuracy        = mean(individual_perceptual_task_dat$correct)   ,
                           m_ratio         = meta_fit$M_ratio                               )

    full_dat <- rbind(full_dat,
                      part_dat)
  }
  cat("\n")
  full_dat
}

