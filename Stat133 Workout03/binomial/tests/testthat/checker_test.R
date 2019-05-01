
context("test checker functions")

# test check_prob() 
test_that("test that check_prob works",{
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
  expect_length(check_prob(0.5), 1)
  expect_error(check_prob(2), 'invalid prob')
  expect_error(check_prob(-2), 'invalid prob')
})



# test check_trials() function
test_that("test that check_trials works",{
  expect_true(check_trials(0))
  expect_true(check_trials(10))
  expect_length(check_trials(10),1)
  expect_error(check_trials(0.5), 'invalid trials')
  expect_error(check_trials(-2), 'invalid trials')
})



# test check_success() function
test_that("test that check_success works",{
  expect_true(check_success(2,3))
  expect_true(check_success(1:3, 5))
  expect_length(check_success(2,3),1)
  expect_error(check_success(3,2),'error: success greater than trials')
  expect_error(check_success(1.5,2), 'invalid success')
})