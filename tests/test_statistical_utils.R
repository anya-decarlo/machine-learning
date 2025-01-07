# Set working directory to project root
setwd("/Users/anyadecarlo/machine-learning")

# Source the functions
source("src/statistical_utils.R")

# Test 1: Normal case with reasonable sample size
cat("\nTest 1: Normal case with n=100\n")
set.seed(123)  # For reproducibility
data1 <- rnorm(100)
result1 <- calculate_histogram_bins(data1)
cat("Number of bins:", result1$bins, "\n")
cat("Warning:", if(is.null(result1$warning)) "None" else result1$warning, "\n")

# Test 2: Small sample size (should hit minimum)
cat("\nTest 2: Small sample size (n=10)\n")
data2 <- rnorm(10)
result2 <- calculate_histogram_bins(data2)
cat("Number of bins:", result2$bins, "\n")
cat("Warning:", if(is.null(result2$warning)) "None" else result2$warning, "\n")

# Test 3: Large sample size (should hit maximum)
cat("\nTest 3: Large sample size (n=1000000)\n")
data3 <- rnorm(1000000)
result3 <- calculate_histogram_bins(data3)
cat("Number of bins:", result3$bins, "\n")
cat("Warning:", if(is.null(result3$warning)) "None" else result3$warning, "\n")

# Test 4: Custom bin limits
cat("\nTest 4: Custom bin limits (min=10, max=15)\n")
result4 <- calculate_histogram_bins(data1, min_bins=10, max_bins=15)
cat("Number of bins:", result4$bins, "\n")
cat("Warning:", if(is.null(result4$warning)) "None" else result4$warning, "\n")

# Test 5: Error handling
cat("\nTest 5: Error handling\n")
tryCatch({
  calculate_histogram_bins(c())  # Empty vector
}, error = function(e) {
  cat("Empty vector error:", e$message, "\n")
})

tryCatch({
  calculate_histogram_bins(c("a", "b", "c"))  # Non-numeric data
}, error = function(e) {
  cat("Non-numeric data error:", e$message, "\n")
})

tryCatch({
  calculate_histogram_bins(data1, min_bins=0)  # Invalid min_bins
}, error = function(e) {
  cat("Invalid min_bins error:", e$message, "\n")
})

tryCatch({
  calculate_histogram_bins(data1, min_bins=10, max_bins=5)  # Invalid max_bins
}, error = function(e) {
  cat("Invalid max_bins error:", e$message, "\n")
})
