validate_mturk_sample <- function(reproduced_dat_exp_2)
{
  # OC patients in the original study had a median of 25, other patients had 7
  # or 11 (Foa et al., 2002)
  hist(reproduced_dat_exp_2$ocir, xlab = "OCIR", main = "")
  abline(v = c(7, 11), lwd = 3)
  legend("topright", lwd = 3, legend = c("Median of Healthy Control"))
  median(reproduced_dat_exp_2$ocir) # Median score in Exp. 2: 11, very consistent

  # Non-schizotypic participants had mean scores of 3.17+4.28+2.8+2.7 = 12.95
  # in Mason et al. (2005).
  hist(reproduced_dat_exp_2$schizo, xlab = "Schizotypy Scores")
  abline(v = c(12.95), lwd = 3)
  legend("topright", lwd = 3, legend = c("Mean of Healthy Control"))
  mean(reproduced_dat_exp_2$schizo) # Mean score in Exp. 2: 12.4, very consistent

  # The clinical sample had raw scores above 48 in the original study
  # (Zung, 1965).
  hist(reproduced_dat_exp_2$zung, xlab = "Zung Score", main = "")
  abline(v = 48, lwd = 3)
  legend("topright", lwd = 3, legend = c("Lower Bound of Patients"))
  mean(reproduced_dat_exp_2$zung) # Mean score in Exp. 2: 37.5, very consistent
  mean(reproduced_dat_exp_2$zung > 48)

  cat("MTurk Sample

  The Mechanical Turk sample yielded similar mean scores on the psychiatric
  screening questionnaires as the reference populations that were used in the
  original studies of these questionnaires. To my surprise, this seems like a
  fairly comparable population.

  \n")
}