
# title: check_prob()
# description: test if an input prob is a valid probability value
# param: prob
# return: TRUE or error
# example: check_prob(0.2)

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


# title: check_trials()
# decsription: test if an input trials is a valid value for number of trials
# param: trials
# return: TRUE or error
# example: check_trials(2)

check_trials <- function(trials){
  if (is.integer(trials) & trials >= 0) {
    return(TRUE)
  } else {
    stop("invalid trials value")
  }
}


# title: check_success()
# description: test if an input success is a valid value for number of successes
# param: success
# param: trials
# return: TRUE or error
# example: check_success(c(1,2),5)

check_success <- function(success, trials){
  if(any(success < 0 | !is.integer(success))){
    stop("invalid success value")
  } else if (any(success > trials)){
    stop("success cannot be greater than trials")
  } else {
    return(TRUE)
  }
}



