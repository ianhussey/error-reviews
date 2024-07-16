# I validated that the Mechanical Turk sample yielded similar mean scores on
# the psychiatric screening questionnaires as the reference populations that
# were used in the original studies of these questionnaires. 
validate_mturk_sample <- function(reproduced_dat_exp_2)
{
  # OC patients in the original study had a median of 25, other patients had 7
  # or 11 (Foa et al., 2002)
  hist(reproduced_dat_exp_2$ocir)
  median(reproduced_dat_exp_2$ocir) # Median score in Exp. 2: 11, very consistent

  # Non-schizotypic participants had mean scores of 3.17+4.28+2.8+2.7 = 12.95
  # in Mason et al. (2005).
  hist(reproduced_dat_exp_2$schizo)
  mean(reproduced_dat_exp_2$schizo) # Mean score in Exp. 2: 12.4, very consistent

  # The clinical sample had raw scores above 48 in the original study
  # (Zung, 1965).
  hist(reproduced_dat_exp_2$zung)
  mean(reproduced_dat_exp_2$zung) # Mean score in Exp. 2: 37.5, very consistent
  mean(reproduced_dat_exp_2$zung > 48)

  invisible()
}