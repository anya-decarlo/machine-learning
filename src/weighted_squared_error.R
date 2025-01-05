#' Calculate Normalized Probabilities from Weights
#' 
#' This function takes non-negative weights and normalizes them to sum to 1
#' to obtain valid probabilities.
#' 
#' @param weights A numeric vector of non-negative weights
#' @return A numeric vector of normalized probabilities
#' @examples
#' weights <- c(2, 3, 5)
#' calculate_probabilities(weights)
calculate_probabilities <- function(weights) {
  # Input validation
  if (length(weights) == 0) {
    stop("Weights vector cannot be empty")
  }
  
  if (!is.numeric(weights)) {
    stop("Weights must be numeric")
  }
  
  if (any(weights < 0)) {
    stop("All weights must be non-negative")
  }
  
  # Calculate sum of weights
  total_weight <- sum(weights)
  
  if (total_weight == 0) {
    stop("Sum of weights cannot be zero")
  }
  
  # Normalize weights to get probabilities
  probabilities <- weights / total_weight
  
  return(probabilities)
}

#' Calculate Weighted Expected Value of Squared Errors
#' 
#' This function computes the weighted average of squared errors using
#' provided weights or probabilities.
#' 
#' @param y A numeric vector of actual values
#' @param y_pred A numeric vector of predicted values
#' @param weights A numeric vector of non-negative weights
#' @return The weighted mean squared error
#' @examples
#' y <- c(1, 2, 3)
#' y_pred <- c(1.1, 2.1, 2.9)
#' weights <- c(2, 3, 5)
#' calculate_weighted_squared_error(y, y_pred, weights)
calculate_weighted_squared_error <- function(y, y_pred, weights) {
  # Input validation
  if (length(y) == 0 || length(y_pred) == 0 || length(weights) == 0) {
    stop("Input vectors cannot be empty")
  }
  
  if (length(y) != length(y_pred) || length(y) != length(weights)) {
    stop("Length of actual values, predicted values, and weights must match")
  }
  
  if (!is.numeric(y) || !is.numeric(y_pred) || !is.numeric(weights)) {
    stop("All inputs must be numeric vectors")
  }
  
  # Calculate probabilities from weights
  probabilities <- calculate_probabilities(weights)
  
  # Calculate squared errors for each data point
  squared_errors <- (y - y_pred)^2
  
  # Calculate weighted average of squared errors
  weighted_mse <- sum(probabilities * squared_errors)
  
  return(weighted_mse)
}
