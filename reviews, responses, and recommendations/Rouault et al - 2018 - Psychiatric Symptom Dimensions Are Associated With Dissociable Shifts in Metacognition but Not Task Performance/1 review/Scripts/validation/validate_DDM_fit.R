validate_DDM_fit <- function(original_dat_exp_2, full_perceptual_task_dat_exp_2)
{
  # To roughly see if the DDM parameter fits match, I simulate data here to
  # inspect the fit. If deviations occur, the fits may still be valid because
  # the model may be too restrictive but I cannot reproduce the original
  # fitting procedure and the authors have not provided code for it.
  i_participant  <- 10
  inspect_participant(original_dat_exp_2            , 
                      full_perceptual_task_dat_exp_2,
                      i_participant                 )

  # Some participants have very high non-decision times but that is because
  # they also take very long to give responses.
  hist(original_dat_exp_2$t)
  s <- original_dat_exp_2$t > .8
  extreme_participant_id <- original_dat_exp_2$id[s][1]
  s <- full_perceptual_task_dat_exp_2$subj_id == extreme_participant_id
  head(full_perceptual_task_dat_exp_2[s, ])
  i_participant  <- 8
  inspect_participant(original_dat_exp_2            , 
                      full_perceptual_task_dat_exp_2,
                      i_participant                 )

  invisible(dev.off())
}

inspect_participant <- function(original_dat_exp_2            , 
                                full_perceptual_task_dat_exp_2,
                                i_participant                 )
{
  ddm_parameters <- original_dat_exp_2[i_participant, 17:20]
  s <- full_perceptual_task_dat_exp_2$i_participant == i_participant
  part_dat       <- full_perceptual_task_dat_exp_2[s, ]

  sim_data <- simulate_conditionwise_data(ddm_parameters, part_dat)
  sim_data$rt <- sim_data$rt * 1000
  visualize_data(part_dat, sim_data)

  # For some reason, the non-decision time seems to have an offset of 300 ms.
  # This is likely due to the RT being differently measured in the DDM fit
  # vs. the published data.
  sim_data$rt <- sim_data$rt - 300
  visualize_data(part_dat, sim_data)
}

simulate_conditionwise_data <- function(ddm_parameters, part_dat)
{
  vs    <- ddm_parameters$v_inter + part_dat$stimdevi * ddm_parameters$v_delta
  v_dat <- aggregate(list(n = vs), by = list(v = vs), length)

  sim_data <- data.frame()
  for (irow in 1:nrow(v_dat))
  {
    parameters <- data.frame(v        = v_dat$v[irow]   , 
                             t        = ddm_parameters$t,
                             a        = ddm_parameters$a, 
                             max_time = 10              , 
                             dt       = 0.001           )
    part_sim_data <- simulate_data(parameters, n_trials = v_dat$n[irow])
    sim_data      <- rbind(sim_data, part_sim_data)
  }
  sim_data
}

#' Simulate Data
#' 
#' Compute from full traces the resulting observed data set of reaction times
#' and response correctness.
#' 
#' @param parameters List of parameters
#' @param n_trials = 200 Number of trials to be simulated for the data set
#' 
#' @return Data frame with one row per trial and variables trace_id, rt, and
#'  correct
simulate_data <- function(parameters, n_trials = 200)
{
  traces <- simulate_multiple_traces(parameters, n_traces = n_trials)

  correctness    <- sapply(1:ncol(traces), \(i_trace) { traces[, i_trace]$correct[1] })
  decision_times <- sapply(1:ncol(traces), \(i_trace) { traces[, i_trace]$decision_time[1] })

  distribution_dat <- data.frame(trace_id = 1:ncol(traces),
                                 rt       = decision_times,
                                 correct  = correctness   )

  distribution_dat
}

#' Simulate Multiple Traces
#' 
#' Simulate multiple traces.
#' 
#' @param parameters List of parameters
#' @param n_traces Number of traces to simulate
#' 
#' @return Data frame with multiple traces in long format
simulate_multiple_traces <- function(parameters, n_traces)
{
  # install.packages(parallel)
  library(parallel)

  cores   <- detectCores() - 1 # Leave one core free
  cluster <- makePSOCKcluster(cores) # Set up cluster

  clusterExport(cluster, c("parameters", "simulate_trace"), envir = environment())

  result <- parSapply(cluster, 1:n_traces, 
    function(i) 
    {
      simulate_trace(parameters)
    })

  # Close cluster (otherwise you get warnings)
  stopCluster(cluster)

  result
}

#' Simulate Trace
#' 
#' Simulate a single trace based on the drift diffusion model.
#' 
#' @param parameters List of parameters
#' 
#' @return Data frame indicating the decision variable at each time point
simulate_trace <- function(parameters)
{
  non_decision_time_steps <- parameters$t/parameters$dt
  max_decision_time_steps <- (parameters$max_time - parameters$t)/parameters$dt

  start_point <- parameters$a/2

  dv <- c(rep(start_point, non_decision_time_steps),
          start_point,
          start_point + cumsum(rnorm(max_decision_time_steps            , 
                                     mean = parameters$v * parameters$dt, 
                                     sd   = 1 * sqrt(parameters$dt)     )))
  decision_point <- which(dv >= parameters$a | dv <= 0)[1]

  if (is.na(decision_point))
  {
    decision_point <- parameters$max_time/parameters$dt
  }

  trace <- data.frame(time           = 1:decision_point * parameters$dt   ,
                      dv             = dv[1:decision_point]               ,
                      correct        = 1*(dv[decision_point]>start_point) ,
                      decision_time  = decision_point * parameters$dt     )
  trace
}


#' Visualize Data
#' 
#' @param data Data frame of one participant with variables rt and correct
visualize_data <- function(data, data_fit = NULL)
{
  if (!is.null(data_fit))
  {
    par(mfrow = c(2, 1))
  }

  # Determine breaks
  rts           <- data$rt
  if (!is.null(data_fit))
  {
    rts           <- c(data$rt, data_fit$rt)
  }
  breaks <- hist(rts, plot = FALSE)$breaks  

  # Plot data
  s <- data$correct == 1
  correct_rts   <- data$rt[s]
  incorrect_rts <- data$rt[!s]

  hist(correct_rts, main = "Data", breaks = breaks, col = rgb(0,1,0,0.5))
  hist(incorrect_rts, add = TRUE, breaks = breaks, col = rgb(1,0,0,0.5))

  # Plot fitted data
  if (!is.null(data_fit))
  {
    s <- data_fit$correct == 1

    correct_rts   <- data_fit$rt[s]
    incorrect_rts <- data_fit$rt[!s]

    hist(correct_rts, main = "Fit", breaks = breaks, col = rgb(0,1,0,0.5))
    hist(incorrect_rts, add = TRUE, breaks = breaks, col = rgb(1,0,0,0.5))
  }
  
  par(mfrow = c(1, 1))
}