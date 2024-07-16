get_variable_labels_for_dat <- function(mat_file, i_participant)
{
  subj_labels <- mat_file$analyseddata[1, i_participant][[1]][[1]][,,1]$subjlabel[1,1:10]
  variable_labels <- as.character(lapply(subj_labels, \(x) x[[1]][1,1]))
  variable_labels
}
