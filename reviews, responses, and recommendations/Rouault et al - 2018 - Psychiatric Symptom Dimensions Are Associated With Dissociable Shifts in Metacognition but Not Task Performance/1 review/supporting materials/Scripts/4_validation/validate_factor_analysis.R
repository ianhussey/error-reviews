# I validated that the factor analysis reproduces.
validate_factor_analysis <- function(reproduced_dat_exp_1,
                                     original_dat_exp_2,
                                     reproduced_dat_exp_2)
{
  # Around factor analysis results are very consistent to those of the
  # authors.
  plot(original_dat_exp_2$AD, reproduced_dat_exp_2$AD)
  plot(original_dat_exp_2$Compul, reproduced_dat_exp_2$Compul)
  plot(original_dat_exp_2$SW, reproduced_dat_exp_2$SW)

  # Preparing loadings of Experiment 1 to be comparable to those of Experiment 2
  loadings_1 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_1,
                                                  should_return_loadings = TRUE)

  loadings_2 <- reproduce_factor_analysis_results(reproduced_dat = reproduced_dat_exp_2,
                                                  should_return_loadings = TRUE)

  items_in_both_experiments <- intersect(rownames(loadings_1),
                                         rownames(loadings_2))
  s_1 <- rownames(loadings_1) %in% items_in_both_experiments
  s_2 <- rownames(loadings_2) %in% items_in_both_experiments

  # Factors have a different sorting in Experiment 1 because the factor
  # analysis is agnostic to which order the authors found in Experiment 2
  loadings_1_sorted <- loadings_1[, c(1, 3, 2)]
  colnames(loadings_1_sorted) <- c("AD", "Compul", "SW")

  loadings_1_sorted_spaced <- loadings_2*0
  for (i in 1:nrow(loadings_2))
  {
    n <- rownames(loadings_2)[i]
    idx <- which(n == rownames(loadings_1_sorted))
    if (length(idx) > 0) loadings_1_sorted_spaced[i, ] <- loadings_1_sorted[idx, ]
  }

  # Visualize
  visualize_factor_loadings(loadings_1_sorted, loadings_2)
  
  cat("Factor Analysis in Experiment 1

  The factor solution of Experiment 1 mirrors that of Experiment 2. There are
  three distinct factors for anxious-depression, compulsiveness, and social
  withdrawal.

  \n")
}

visualize_factor_loadings <- function(loadings_1_sorted_spaced, loadings_2)
{
  if (dev.cur() != 1) dev.off()
  dev.new(width = 16, height = 7)
  layout(matrix(c(1, 1, 4, 4, 7,
                  2, 2, 5, 5, 8,
                  3, 3, 6, 6, 9), nrow = 3, byrow = TRUE))

  barplot(loadings_1_sorted_spaced[, 1],
          main = "Exp. 1: Factor Anxious-Depression",
          col = get_colors(loadings_1_sorted_spaced),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)
  barplot(loadings_1_sorted_spaced[, 2],
          main = "Exp. 1: Factor Compulsive Behavior and Intrusive Thought",
          col = get_colors(loadings_1_sorted_spaced),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)
  barplot(loadings_1_sorted_spaced[, 3],
          main = "Exp. 1: Social Withdrawal",
          col = get_colors(loadings_1_sorted_spaced),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)

  barplot(loadings_2[, 1],
          main = "Exp. 2: Factor Anxious-Depression",
          col = get_colors(loadings_2),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)
  barplot(loadings_2[, 2],
          main = "Exp. 2: Factor Compulsive Behavior and Intrusive Thought",
          col = get_colors(loadings_2),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)
  barplot(loadings_2[, 3],
          main = "Exp. 2: Social Withdrawal",
          col = get_colors(loadings_2),
          names.arg = "", yaxt = "n", ylim = c(-0.6, +0.6), cex.main = 1.5)
  axis(2, at = c(-0.5, 0.0, +0.5), cex.axis = 1.5)

  plot(1, 1, type = 'n',
       xlab = '', ylab = '', axes = FALSE)
  plot(1, 1, type = 'n',
       xlab = '', ylab = '', axes = FALSE)
  mar.default <- par("mar")
  par(mar = c(5.1, 0, 4.1, 2.1))
  legend("left",
         fill = conversion_map[,2],
         legend = c("Alcoholism",
                    "Apathy",
                    "Depression",
                    "Eating Disorders",
                    "Generalized Anxiety",
                    "Impulsivity",
                    "OCD", 
                    "Schizotypy",
                    "Social Anxiety"),
         xpd = TRUE, 
         cex = 1.5,
         border = 0)
  plot(1, 1, type = 'n',
       xlab = '', ylab = '', axes = FALSE)
  par(mar = mar.default)  
}

conversion_map <- matrix(c("^alcohol+"      , rgb(208/255, 109/255, 176/255),
                           "^apathy+"       , rgb(135/255, 135/255, 135/255),
                           "^zung+"         , rgb( 99/255, 161/255,  62/255),
                           "^eat+"          , rgb(127/255,  71/255,  36/255),
                           "^anxiety+"      , rgb(176/255,  29/255,  33/255),
                           "^impulsiveness+", rgb(116/255,  56/255, 142/255),
                           "^ocir+"         , rgb(213/255, 113/255,  33/255),
                           "^schizo+"       , rgb(207/255, 217/255,  58/255),
                           "^liebowitz+"    , rgb( 72/255, 102/255, 166/255)
                           ), ncol = 2, byrow = TRUE)

get_colors <- function(loadings)
{
  colors <- reg_map(rownames(loadings), conversion_map)
  colors
}