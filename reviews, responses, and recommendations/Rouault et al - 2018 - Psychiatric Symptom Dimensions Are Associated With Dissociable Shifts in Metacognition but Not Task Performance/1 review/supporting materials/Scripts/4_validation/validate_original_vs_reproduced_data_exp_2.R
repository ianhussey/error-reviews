# I validated whether the summary statistics of participants matches between
# the studies
validate_original_vs_reproduced_data_exp_2 <- function(original_dat_exp_2, 
                                                       reproduced_dat_exp_2)
{
  # All reproduced values (except for M-Ratio values, which are validated
  # elsewhere) are perfectly consistent.
  plot(original_dat_exp_2$age     , reproduced_dat_exp_2$age            )
  plot(original_dat_exp_2$gender  , reproduced_dat_exp_2$gender         )
  plot(original_dat_exp_2$accuracy, reproduced_dat_exp_2$accuracy       )
  plot(original_dat_exp_2$confMean, reproduced_dat_exp_2$mean_confidence)
  plot(original_dat_exp_2$mRatio  , reproduced_dat_exp_2$m_ratio        )

  plot(original_dat_exp_2$anxiety, reproduced_dat_exp_2$anxiety      )
  plot(original_dat_exp_2$eat    , reproduced_dat_exp_2$eat          )
  plot(original_dat_exp_2$apathy , reproduced_dat_exp_2$apathy       )
  plot(original_dat_exp_2$alcohol, reproduced_dat_exp_2$alcohol      )
  plot(original_dat_exp_2$zung   , reproduced_dat_exp_2$zung         )
  plot(original_dat_exp_2$ocir   , reproduced_dat_exp_2$ocir         )
  plot(original_dat_exp_2$leb    , reproduced_dat_exp_2$liebowitz    )
  plot(original_dat_exp_2$iq     , reproduced_dat_exp_2$iq           )
  plot(original_dat_exp_2$bis    , reproduced_dat_exp_2$impulsiveness)
  plot(original_dat_exp_2$schizo , reproduced_dat_exp_2$schizo       )

  plot(original_dat_exp_2$AD     , reproduced_dat_exp_2$AD           )
  plot(original_dat_exp_2$Compul , reproduced_dat_exp_2$Compul       )
  plot(original_dat_exp_2$SW     , reproduced_dat_exp_2$SW           )

  cat("Match Between Reproduced and Original Experiment 2 Data

  The values I extracted look very consistent with the exception of M-Ratio
  fits, which are different because I used a different fitting method.

  \n")
}
