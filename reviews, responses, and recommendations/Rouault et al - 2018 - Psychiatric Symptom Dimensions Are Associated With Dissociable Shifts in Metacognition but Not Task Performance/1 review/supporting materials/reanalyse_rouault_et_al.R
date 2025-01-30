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

# Clear workspace and load all scripts and packages ----------------------------
rm(list = ls())
source('Utilities/load_all_scripts_in_project.R')
load_required_packages()

# Experiment 1 Data Reproduction -----------------------------------------------
full_perceptual_task_dat_exp_1 <- cache_results("get_full_perceptual_task_dat_exp_1()")

reproduced_dat_exp_1 <- cache_results("reproduce_summary_data_exp_1()")
reproduced_dat_exp_1 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_1)

# Experiment 2 Data Reproduction -----------------------------------------------
original_dat_exp_2 <- cache_results("extract_original_summary_data()")

full_perceptual_task_dat_exp_2 <- cache_results("get_full_perceptual_task_dat_exp_2()")

reproduced_dat_exp_2 <- cache_results("reproduce_summary_data_exp_2()")
reproduced_dat_exp_2 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2)

# Labeling the Factors ---------------------------------------------------------

# The authors gave labels to the three factors in Experiment 2
factor_indices <- ncol(reproduced_dat_exp_2)-(2:0)
names(reproduced_dat_exp_2)[factor_indices] <- c("AD", "Compul", "SW")

# According to a factor loading comparion, the factors in Experiment 1 are
# ordered differently. See factor loading plot in validate_factor_analysis() below.
factor_indices <- ncol(reproduced_dat_exp_1)-(2:0)
names(reproduced_dat_exp_1)[factor_indices] <- c("AD", "SW", "Compul")

# Summary of Available Data ---------------------------------------------------------------

# Now we have reproduced the data of Experiment 1 with the perceptual task
# information (one row one trial, many rows for each participant) as well as
# the participant data (one row per participant, aggregated values from the
# perceptual task plus questionnaire information.
head(full_perceptual_task_dat_exp_1)
head(reproduced_dat_exp_1)

# We have the same for Experiment 2. In addition, we have the original data
# that was produced from their code.
head(full_perceptual_task_dat_exp_2)
head(reproduced_dat_exp_2)
head(original_dat_exp_2)

# Validation -------------------------------------------------------------------

# There is one function for each aspect that I validated beyond the
# reproduction of the data. Each function prints a string with my evaluation.
# For details, check the function definitions.

validate_exclusions(full_perceptual_task_dat_exp_1,
                    full_perceptual_task_dat_exp_2)

validate_difficulty_binning(full_perceptual_task_dat_exp_1)

validate_power_analysis(reproduced_dat_exp_1)

validate_original_vs_reproduced_data_exp_2(original_dat_exp_2,
                                           reproduced_dat_exp_2)

validate_mturk_sample(reproduced_dat_exp_2)

validate_DDM_fit(original_dat_exp_2,
                 full_perceptual_task_dat_exp_2)

validate_m_ratio(original_dat_exp_2,
                 reproduced_dat_exp_2)

reproduced_dat_exp_1 <- overwrite_m_ratio_from_MATLAB_fit_exp_1(reproduced_dat_exp_1)
reproduced_dat_exp_2 <- overwrite_m_ratio_from_MATLAB_fit_exp_2(reproduced_dat_exp_2)

validate_model_comparison(reproduced_dat_exp_2,
                          original_dat_exp_2)

validate_staircase_procedure(original_dat_exp_2,
                             reproduced_dat_exp_2)

validate_factor_analysis(reproduced_dat_exp_1,
                         original_dat_exp_2,
                         reproduced_dat_exp_2)

validate_reliabilities(full_perceptual_task_dat_exp_1,
                       full_perceptual_task_dat_exp_2)

validate_regression(reproduced_dat_exp_1,
                    reproduced_dat_exp_2)

validate_exp_2_factors_in_exp_1(reproduced_dat_exp_1,
                                reproduced_dat_exp_2)


