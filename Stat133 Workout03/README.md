
##Overview

The purpose of this assignment is to create an R package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

The Binomial distribution is perhaps the most famous probability distribution among discrete random variables. This is the theoretical probability model that we use when calculating probabilities about the number of successes in a fixed number of random trials performed under identical conditions (assuming a constant probability of success on each trial).


This "binomial" package includes tests—via the package "testthat"—for the fol- lowing functions, and their contexts:
• Context for checkers:  <br />
– check_prob()  <br />
– check_trials() – check_success()  <br />
• Context for summary measures:  <br />
– aux_mean()  <br />
– aux_variance() – aux_mode()  <br />
– aux_skewness() – aux_kurtosis()  <br />
• Context for binomial:  <br />
– bin_choose()  <br />
– bin_probability() – bin_distribution() – bin_cumulative()  <br />
