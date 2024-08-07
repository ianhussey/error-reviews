################################################################################
#' 
#' Reproduction of Rouault et al. (2018) for Error Reviews
#' 
#' I reproduce the results of Rouault et al. (2018) checking for validity and
#' reproducibility. This review was conducted within the Error Reviews
#' initiative (https://error.reviews/), a bug bounty program for science.
#' 
#' After registering as a potential reviewer, I was approached on May 7 2024
#' to review this study until July 4.
#' 
#' In my review, I reproduced the results of the study based on the freely
#' available data at https://github.com/metacoglab/RouaultSeowGillanFleming.
#' The authors mentioned that additional data is available upon request but I
#' deemed this not necessary given the available material on github.
#' 
#' Overall, my impression is that this study was surprisingly reliable to
#' reproduce. The relevant results of the study were independently reproduced
#' in the following R scripts and matched well with the original analyses of
#' the autors. My initials concerns about validity were resolved upon closer
#' inspection of the data. Naturally, minor errors were found but these are
#' so inconsequential that I believe the study is highly reliable and could
#' be replicated without problems.
#' 
#' For inspection of my validation, navigate to the relevantion scripts in the
#' Scripts/validation/ folder after running the data loading functions in
#' this main script. Note that all the packages listed here need to be
#' installed for running the code.
#' 
#' Rouault, M., Seow, T., Gillan, C. M., & Fleming, S. M. (2018). Psychiatric
#' symptom dimensions are associated with dissociable shifts in metacognition
#' but not task performance. Biological Psychiatry, 84(6), 443-451.
#' https://doi.org/10.1016/j.biopsych.2017.12.017 
#' 
#' Dr. Sascha Meyen, saschameyen@gmail.com
#' 2024-06-25 10:37
#' 
################################################################################

# Clear workspace and load all scripts -----------------------------------------
rm(list = ls())
source('Utilities/load_all_scripts_in_project.R')

# Install required packages ----------------------------------------------------

# install.packages("ggplot2")
# install.packages("gridExtra")
# install.packages("lme4")
# install.packages("plyr")
# install.packages("psych")
# install.packages("GPArotation")
# install.packages("paran")
# install.packages("reshape")
# install.packages("polycor")
# install.packages("nFactors")
# install.packages("R.matlab")  
# install.packages("doBy")
# install.packages("pwr")
# install.packages("gmgm")
# install.packages("parallel")

# Experiment 1 -----------------------------------------------------------------
full_perceptual_task_dat_exp_1 <- cache_results("get_full_perceptual_task_dat_exp_1()")
head(full_perceptual_task_dat_exp_1)

reproduced_dat_exp_1 <- cache_results("reproduce_summary_data_exp_1()", overwrite = TRUE)
reproduced_dat_exp_1 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_1)
head(reproduced_dat_exp_1)

# For inspection of my validation, navigate to the relevantion scripts in the
# Scripts/validation/ folder after running the data loading functions in this
# main script.

validate_difficulty_results(full_perceptual_task_dat_exp_1)

validate_power_analysis(reproduced_dat_exp_1)

# Experiment 2 -----------------------------------------------------------------
original_dat_exp_2 <- cache_results("extract_original_summary_data()")
head(original_dat_exp_2)

full_perceptual_task_dat_exp_2 <- cache_results("get_full_perceptual_task_dat_exp_2()")

reproduced_dat_exp_2 <- cache_results("reproduce_summary_data_exp_2()", 
                                      overwrite = TRUE)
reproduced_dat_exp_2 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2)
head(reproduced_dat_exp_2)

validate_original_vs_reproduced_data_exp_2(original_dat_exp_2, reproduced_dat_exp_2)

validate_m_ratio(original_dat_exp_2, reproduced_dat_exp_2)

validate_factor_analysis(original_dat_exp_2, reproduced_dat_exp_2)

validate_regression(reproduced_dat_exp_2)

validate_model_comparison(reproduced_dat_exp_2)

validate_mturk_sample(reproduced_dat_exp_2)

validate_staircase_procedure(original_dat_exp_2, reproduced_dat_exp_2)

validate_DDM_fit(original_dat_exp_2, full_perceptual_task_dat_exp_2)
