

#' @title Binomial choose
#' @description calculates number of combinations that k successes occurs in n trials
#' @param n number of trials
#' @param k number of successes or a vector (represents several times) of number of successes
#' @return number of combinations
#' @export
#' @examples bin_choose(5, 3)

bin_choose <- function(n,k) {
  if (any(k > n)){
    stop("k cannot be greater than n")
  } else {
    return(factorial(n) / (factorial(k) * factorial(n-k)))}
}


#' @title Binomial probability
#' @description calculates the probability of certain successes in certain number of trials with certain probability
#' @param success number of successes or a vector (represents several times) of number of successes
#' @param trials number of trials
#' @param prob probability of successes
#' @return probability of certain successes in certain number of trials with certain probability
#' @export
#' @examples bin_probability(2, 5, 0.5)

bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * prob^success *(1-prob)^(trials-success))
}


#' @title Binomial distribution
#' @description creates a dataframe for the possible probabilities under specific number of trials
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame containing all possible probabilties under specific number of trials
#' @export
#' @examples bin_distribution(5, 0.5)

bin_distribution <- function(trials, prob) {
  success <- 0 : trials
  probability <- bin_probability(success, trials, prob)
  result <- data.frame(success, probability)
  class(result) <- c("bindis", "data.frame")
  return(result)
}

#' @export

plot.bindis <- function(df) {
  barplot(
    df$probability,
    xlab = "successes",
    ylab = "probability")
}


#' @title Binomial cumulative
#' @description creates a dataframe for cumulative probability of certain success with certain probability in certain number of trials
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame containing cumulative probability of binomial distribution
#' @export
#' @examples bin_cumulative(5, 0.5)

bin_cumulative <- function(trials, prob){
  result <- bin_distribution(trials, prob)
  class(result) <- c("bincum", "data.frame")
  cumulative <- c()
  for (i in 1:(trials+1)) {
    cumulative[i] <- sum(result$probability[1:i])
  }
  result$cumulative <- cumulative
  return(result)
}

#' @export

plot.bincum <- function(x) {
  plot(x$success, x$cumulative, type = "o",
       xlab = "successes", ylab ="probability")
}


#' @title Binomial variable
#' @description generates a binomial random variable object
#' @param trials number of trials
#' @param prob probability of success
#' @return An object of class "binvar"
#' @export
#' @examples bin_variable(5, 0.5)

bin_variable <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  object <- list(
    trials = trials,
    prob = prob)
  class(object) <- "binvar"
  return(object)
}

#' @export
print.binvar <- function(object){
  cat('"Binomial variable"\n\n')
  cat('Paramaters\n')
  cat("- number of trials: ", object$trials,"\n")
  cat("- prob of success: ", object$prob, "\n")
}

#' @export
summary.binvar <- function(x){
  result <- list(
    trials = x$trials,
    prob = x$prob,
    mean = aux_mean(x$trials, x$prob),
    variance = aux_variance(x$trials,x$prob),
    mode = aux_mode(x$trials,x$prob),
    skewness = aux_skewness(x$trials,x$prob),
    kurtosis = aux_kurtosis(x$trials,x$prob))
  class(result) <- "summary.binvar"
  return(result)
}

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat(sprintf("- number of trials: %s\n", x$trials))
  cat(sprintf("- prob of success : %s\n\n", x$prob))
  cat('Measures\n')
  cat(sprintf("- mean    : %s\n", x$mean))
  cat(sprintf("- variance: %s\n", x$variance))
  cat(sprintf("- mode    : %s\n", x$mode))
  cat(sprintf("- skewness: %s\n", x$skewness))
  cat(sprintf("- kurtosis: %s\n", x$kurtosis))
}




#' @title Binomial variance
#' @description calculates the variance of given binomal distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return variance of binomal distribution
#' @export
#' @examples bin_variance(10, 0.3)

bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}


#' @title Binomial mode
#' @description calculates the mode of given binomal distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return mode of binomal distribution
#' @export
#' @examples bin_mode(10, 0.3)

bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}


#' @title Binomial skewness
#' @description calculates the skewness of given binomal distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return skewness of binomal distribution
#' @export
#' @examples bin_skewness(10, 0.3)

bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}


#' @title Binomial kurtosis
#' @description calculates the kurtosis of given binomal distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return kurtosis of binomal distribution
#' @export
#' @examples bin_kurtosis(10, 0.3)

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}


