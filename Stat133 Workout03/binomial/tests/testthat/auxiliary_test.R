context("test auxiliary functions")

# test aux_mean()
test_that("aux_mean works well",{
  expect_equal(aux_mean(10, 0.1), 1)
  expect_equal(aux_mean(100, 0.1), 10)
  expect_equal(aux_mean(990, 0.1), 99)
  expect_length(aux_mean(10,0.1),1)
  expect_type(aux_mean(10,0.1),'double')
})


# test aux_variance()
test_that("aux_variance works well",{
  expect_equal(aux_variance(10, 0.1), 0.9)
  expect_equal(aux_variance(20, 0.2), 3.2)
  expect_equal(aux_variance(30, 0.3), 6.3)
  expect_length(aux_variance(10, 0.1),1)
  expect_type(aux_variance(10,0.1),'double')
})


# test aux_mode()
test_that("aux_mode works well",{
  expect_equal(aux_mode(10, 0.1), 1)
  expect_equal(aux_mode(20, 0.2), 4)
  expect_equal(aux_mode(100, 0.1), 10)
  expect_length(aux_mode(10, 0.5),1)
  expect_length(aux_mode(3, 0.5), 2)
  expect_equal(aux_mode(5,0.5),c(2, 3))
  expect_type(aux_mode(10,0.1),'integer')
})


# test aux_skewness() 
test_that("aux_skewness works well",{
  expect_equal(aux_skewness(10,0.5),0)
  expect_equal(aux_skewness(10,0.3),(1-2*0.3)/sqrt(10*0.3*(1-0.3)))
  expect_length(aux_skewness(10, 0.3),1)
  expect_type(aux_skewness(10,0.1),'double')
})


# test aux_kurtosis()
test_that("aux_kurtosis works well",{
  expect_length(aux_kurtosis(10, 0.3),1)
  expect_equal(aux_kurtosis(10, 0.5),-0.2)
  expect_equal(aux_kurtosis(10,0.3),(1-6*0.3*(1-0.3))/(10*0.3*(1-0.3)))
  expect_type(aux_kurtosis(10,0.3),'double')
})