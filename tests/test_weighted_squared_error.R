# Set working directory to project root
setwd("/Users/anyadecarlo/machine-learning")

# Source the functions
source("src/weighted_squared_error.R")

# Test calculate_probabilities function
cat("\nTest 1: calculate_probabilities\n")
weights1 <- c(2, 3, 5)
probs1 <- calculate_probabilities(weights1)
cat("Weights:", weights1, "\n")
cat("Probabilities:", probs1, "\n")
cat("Sum of probabilities:", sum(probs1), "\n")

# Test calculate_weighted_squared_error function
cat("\nTest 2: calculate_weighted_squared_error\n")
y <- c(1, 2, 3)
y_pred <- c(1.1, 2.1, 2.9)
weights2 <- c(1, 2, 1)
wse <- calculate_weighted_squared_error(y, y_pred, weights2)
cat("Y values:", y, "\n")
cat("Predicted values:", y_pred, "\n")
cat("Weights:", weights2, "\n")
cat("Weighted squared error:", wse, "\n")

# Test error handling
cat("\nTest 3: Error handling\n")
tryCatch({
  # Try negative weights
  calculate_probabilities(c(-1, 2, 3))
}, error = function(e) {
  cat("Error with negative weights:", e$message, "\n")
})

tryCatch({
  # Try mismatched lengths
  calculate_weighted_squared_error(c(1, 2), c(1, 2, 3), c(1, 2, 3))
}, error = function(e) {
  cat("Error with mismatched lengths:", e$message, "\n")
})
