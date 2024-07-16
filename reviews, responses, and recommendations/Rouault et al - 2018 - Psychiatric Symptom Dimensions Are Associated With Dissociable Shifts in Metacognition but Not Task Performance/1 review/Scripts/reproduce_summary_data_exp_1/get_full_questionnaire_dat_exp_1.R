get_full_questionnaire_dat_exp_1 <- function()
{
  mat_files <- cache_results("get_mat_files()")
  mat_file  <- mat_files[[2]]

  n <- get_number_of_participants_questionnaire_dat_exp_1(mat_file)

  full_questionnaire_dat_exp_1 <- data.frame()
  for (i_participant in 1:n)
  {
    individual_dat               <- get_individual_questionnaire_dat_exp_1(mat_file, i_participant)
    full_questionnaire_dat_exp_1 <- rbind(full_questionnaire_dat_exp_1, individual_dat)
  }

  o <- order(full_questionnaire_dat_exp_1$subj_id)
  full_questionnaire_dat_exp_1 <- full_questionnaire_dat_exp_1[o, ]

  full_questionnaire_dat_exp_1
}

get_number_of_participants_questionnaire_dat_exp_1 <- function(mat_file)
{
  n <- dim(mat_file$allqna)[2]
  n
}

get_individual_questionnaire_dat_exp_1 <- function(mat_file, i_participant)
{
  ## Exploration
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq[ , , 1]
  # names(mat_file$allqna[, i_participant][[1]][[1]][, , 1])
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$id
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$catchqn
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$globalconfid
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$confidcheck
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$zung
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$zung[, , 1]$raw
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$zung[, , 1]$score
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq[, , 1]$raw
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq[, , 1]$score
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$raw[, , 1]$all
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$raw[, , 1]$avg
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$score
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$ocir
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$ocir[, , 1]$raw
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$ocir[, , 1]$score
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$schizo
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$schizo[, , 1]$raw
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$schizo[, , 1]$score[, , 1]$total
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$bis
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$bis[, , 1]$raw
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$bis[, , 1]$score[, , 1]$total
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$gad7
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$gad7[, , 1]$raw[, , 1]$all
  # mat_file$allqna[, i_participant][[1]][[1]][, , 1]$gad7[, , 1]$score

  # Individual IDs
  individual_dat <- data.frame(i_participant = i_participant,
                               subj_id       = mat_file$allqna[, i_participant][[1]][[1]][, , 1]$id)

  # Catch question
  individual_dat$catch_question <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$catchqn

  # Confidence exclusion check
  individual_dat$confidence_check_high <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$confidcheck[1, 1]
  individual_dat$confidence_check_low  <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$confidcheck[2, 1]

  # Zung Self-Rating Depression
  individual_dat$zung     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$zung[, , 1]$score
  individual_dat$zung_raw <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$zung[, , 1]$raw  
  if (individual_dat$zung != sum(individual_dat$zung_raw)) stop("Inconsistency.")

  # International Cognitive Ability Resource (ICAR)
  individual_dat$iq     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq[, , 1]$score
  individual_dat$iq_raw <- t(mat_file$allqna[, i_participant][[1]][[1]][, , 1]$iq[, , 1]$raw)
  # Maybe I don't know how the ICAR is evaluated.
  # if (individual_dat$iq != round(mean(iq_raw))) stop("Inconsistency.")

  # Liebowitz Social Anxiety Scale
  individual_dat$liebowitz         <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$score
  # individual_dat$liebowitz_raw_all <- t(mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$raw[, , 1]$all)
  individual_dat$liebowitz_raw <- t(mat_file$allqna[, i_participant][[1]][[1]][, , 1]$leb[, , 1]$raw[, , 1]$avg)
  if (individual_dat$liebowitz != 2*sum(individual_dat$liebowitz_raw)) stop("Inconsistency.")

  # Obsessive-Compulsive Inventory-Revised
  individual_dat$ocir     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$ocir[, , 1]$score
  individual_dat$ocir_raw <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$ocir[, , 1]$raw
  if (individual_dat$ocir != sum(individual_dat$ocir_raw)) stop("Inconsistency.")

  # Schizotypy
  individual_dat$schizo     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$schizo[, , 1]$score[, , 1]$total
  individual_dat$schizo_raw <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$schizo[, , 1]$raw
  if (individual_dat$schizo != sum(individual_dat$schizo_raw)) stop("Inconsistency.")

  # Barratt Impulsiveness Scale  
  individual_dat$impulsiveness     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$bis[, , 1]$score[, , 1]$total
  individual_dat$impulsiveness_raw <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$bis[, , 1]$raw
  if (individual_dat$impulsiveness != sum(individual_dat$impulsiveness_raw)) stop("Inconsistency")

  # Generalized Anxiety Disorder (7 Items)  
  individual_dat$anxiety     <- mat_file$allqna[, i_participant][[1]][[1]][, , 1]$gad7[, , 1]$score
  individual_dat$anxiety_raw <- t(mat_file$allqna[, i_participant][[1]][[1]][, , 1]$gad7[, , 1]$raw[, , 1]$all)
  if (individual_dat$anxiety != sum(individual_dat$anxiety_raw)) stop("Inconsistency")

  individual_dat
}
