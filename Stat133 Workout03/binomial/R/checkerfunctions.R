
#this is a private auxiliary function check_prob() to test if an input prob is a valid probability value (i.e. 0 ≤ p ≤ 1).
check_prob <- function(prob){
  if (!is.numeric(prob)) {
    stop("invalid prob input")
  } else {
     if (prob <= 1 & prob >= 0) {
       return(TRUE)
     } else {
        stop("p has to be a number between 0 and 1")}
  }
}


#this is a private auxiliary function check_trials() to test if an input trials is a valid value for number of trials (i.e. n is a non-negative integer).
check_trials <- function(trials){
  if (is.integer(trials) & trials >= 0) {
    return(TRUE)
  } else {
    stop("invalid trials value")
  }
}


#this is a private auxiliary function check_success() to test if an input success is a valid value for number of successes (i.e. 0 ≤ k ≤ n).
check_success <- function(success, trials){
  if(any(success < 0 | !is.integer(success))){
    stop("invalid success value")
  } else if (any(success > trials)){
    stop("success cannot be greater than trials")
  } else {
    return(TRUE)
  }
}



