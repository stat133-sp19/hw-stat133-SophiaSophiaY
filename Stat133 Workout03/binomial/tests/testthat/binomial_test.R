test_that('bin_choose() works as expected',{
  expect_length(bin_choose(5,2),1)
  expect_equal(bin_choose(5,2),10)
  expect_equal(bin_choose(5,0),1)
  expect_type(bin_choose(5,2),'double')
})

test_that('bin_probability() works as expected',{
  expect_length(bin_probability(2,3,0.5),1)
  expect_length(bin_probability(0:5,6,0.5),6)
  expect_equal(bin_probability(0:2, 5, 0.5),c(0.03125, 0.15625, 0.31250))
  expect_type(bin_probability(2,3,0.5),'double')
})

test_that('bin_distribution() works as expected',{
  expect_length(bin_distribution(5,0.5),2)
  expect_error(bin_distribution(-1,0.5))
  expect_type(bin_distribution(5,0.5),'list')
  expect_is(bin_distribution(5,0.5),c('bindis','data.frame'))
})

test_that('bin_cumulative() works as expected',{
  expect_length(bin_cumulative(5,0.5),3)
  expect_error(bin_cumulative(-1,0.5))
  expect_type(bin_cumulative(5,0.5),'list')
  expect_is(bin_cumulative(5,0.5),c('bincum','data.frame'))
})