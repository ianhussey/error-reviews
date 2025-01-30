reproduce_individual_meta_fit <- function(individual_dat)
{
  target_left_response_left    <- individual_dat$target_left == 1 & individual_dat$correct == 1
  target_right_response_left   <- individual_dat$target_left == 0 & individual_dat$correct == 0
  response_left                <- target_left_response_left | target_right_response_left
  response_left_pm_coded       <- ifelse(response_left, 1, -1)
  individual_dat$response_left <- response_left_pm_coded

  individual_dat$response_bin  <- individual_dat$response_left * individual_dat$new_confid
  individual_dat$response_bin  <- factor(individual_dat$response_bin, levels = c(-5:-1, 1:5))

  tab <- table(individual_dat$target_left, individual_dat$response_bin)
  tab

  tab <- tab + 1

  fit <- fit_meta_d_MLE(tab[1, ], tab[2, ])
  reproduced_fit_dat <- fit[1, 1:5]
  reproduced_fit_dat
}
