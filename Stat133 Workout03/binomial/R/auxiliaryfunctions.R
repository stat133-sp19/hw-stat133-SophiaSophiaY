
# title: aux_mean()
# description: given the trials and probability, return the mean
# param: trials
# param: prob
# return: mean
# example: aux_mean(10, 0.3)
aux_mean<- function(trials, prob){
  return(trials*prob)
}

# title: aux_variance()
# description: given the trials and probability, return the variance
# param: trials
# param: prob
# return: variance
# example: aux_variance(10, 0.3)
aux_variance <- function(trials,prob){
  return(trials*prob*(1-prob))
}

# title: aux_mode()
# description: given the trials and probability, return the mode
# param: trials
# param: prob
# return: mode
# example: aux_mode(10, 0.3)
aux_mode <- function(trials,prob){
  m <- trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m-1, m))
  } else {
    return(floor(m))
  }
}

# title: aux_skewness()
# description: given the trials and probability, return the skewness
# param: trials
# param: prob
# return: skewness
# example: aux_skewness(10, 0.3)
aux_skewness <- function(trials,prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}

# title: aux_kurtosis()
# description: given the trials and probability, return the kurtosis
# param: trials
# param: prob
# return: kurtosis
# example: aux_kurtosis(10, 0.3)
aux_kurtosis <- function(trials, prob){
  return((1-6*prob*(1-prob)) / (trials*prob*(1-prob)))
}
