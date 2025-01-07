#' Calculate Optimal Number of Histogram Bins
#' 
#' This function calculates the optimal number of bins for a histogram using Sturges' formula:
#' bins = 1 + 3.3 * log10(n), where n is the sample size.
#' The result is constrained between user-specified minimum and maximum values.
#' 
#' @param data A numeric vector of data points
#' @param min_bins Minimum number of bins allowed (default: 5)
#' @param max_bins Maximum number of bins allowed (default: 20)
#' @return A list containing:
#'   - bins: The calculated number of bins (integer)
#'   - warning: Warning message if the calculated bins exceeded limits (or NULL)
#' @examples
#' data <- rnorm(100)
#' result <- calculate_histogram_bins(data)
#' print(result$bins)
calculate_histogram_bins <- function(data, min_bins = 5, max_bins = 20) {
  # Input validation
  if (!is.numeric(data)) {
    stop("Input data must be numeric")
  }
  
  if (length(data) == 0) {
    stop("Input data cannot be empty")
  }
  
  if (!is.numeric(min_bins) || !is.numeric(max_bins)) {
    stop("min_bins and max_bins must be numeric")
  }
  
  if (min_bins < 1) {
    stop("min_bins must be at least 1")
  }
  
  if (max_bins <= min_bins) {
    stop("max_bins must be greater than min_bins")
  }
  
  # Calculate optimal number of bins using Sturges' formula
  n <- length(data)
  optimal_bins <- 1 + 3.3 * log10(n)
  
  # Round to nearest integer
  optimal_bins <- round(optimal_bins)
  
  # Initialize warning message
  warning_msg <- NULL
  
  # Check if optimal bins exceeds limits
  if (optimal_bins < min_bins) {
    warning_msg <- sprintf("Calculated bins (%d) below minimum. Using min_bins: %d", 
                          optimal_bins, min_bins)
    optimal_bins <- min_bins
  } else if (optimal_bins > max_bins) {
    warning_msg <- sprintf("Calculated bins (%d) above maximum. Using max_bins: %d", 
                          optimal_bins, max_bins)
    optimal_bins <- max_bins
  }
  
  # Return results
  return(list(
    bins = optimal_bins,
    warning = warning_msg
  ))
}
