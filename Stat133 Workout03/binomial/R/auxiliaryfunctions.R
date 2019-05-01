
#this function take two arguments: trials and prob, and return the mean
aux_mean<- function(trials, prob){
  return(trials*prob)
}


#this function take two arguments: trials and prob, and return the variance
aux_variance <- function(trials,prob){
  return(trials*prob*(1-prob))
}


#this function take two arguments: trials and prob, and return the mode
aux_mode <- function(trials,prob){
  m <- trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m-1, m))
  } else {
    return(floor(m))
  }
}


#this function take two arguments: trials and prob, and return the skewness
aux_skewness <- function(trials,prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}


#this function take two arguments: trials and prob, and return the kurtosis
aux_kurtosis <- function(trials, prob){
  return((1-6*prob*(1-prob)) / (trials*prob*(1-prob)))
}
