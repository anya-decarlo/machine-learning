#' Calculate Expected Value of Squared Errors
#' 
#' This function calculates the expected value of squared errors by taking
#' the average of squared differences between actual and predicted values.
#' 
#' @param y A numeric vector of actual values
#' @param y_pred A numeric vector of predicted values
#' @return The mean squared error (expected value of squared errors)
#' @examples
#' y <- c(1, 2, 3, 4, 5)
#' y_pred <- c(1.1, 2.1, 2.9, 4.2, 5.1)
#' expected_squared_error(y, y_pred)
expected_squared_error <- function(y, y_pred) {
  # Input validation
  if (length(y) == 0 || length(y_pred) == 0) {
    stop("Input vectors cannot be empty")
  }
  
  if (length(y) != length(y_pred)) {
    stop("Length of actual values and predicted values must match")
  }
  
  if (!is.numeric(y) || !is.numeric(y_pred)) {
    stop("Both inputs must be numeric vectors")
  }
  
  # Calculate squared errors for each data point
  squared_errors <- (y - y_pred)^2
  
  # Calculate mean of squared errors
  mse <- mean(squared_errors)
  
  return(mse)
}
