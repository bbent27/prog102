function_name <- function(inputs) {
  output_value <-do_something(inputs)
  return(output_value)
}

square <- function(x) {
  result <- x^2
  return(result)
}
square(3)
y <- 4
square(y)
square(y+1)
#^that function has one parameter. What about when a function has 2 parameters?

nth_power <- function(x, n) {
  result <- x^n
  return(result)
}
nth_power(3,2)
nth_power(3,4)

gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}
gt_threshold(c(1, 2, 4), 3)
#when you sum up TRUEs and FALSEs, trues count and 1 and falses count as 0,
#so you get # of TRUEs




