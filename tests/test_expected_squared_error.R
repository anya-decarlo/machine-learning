# Set working directory to project root
setwd("/Users/anyadecarlo/machine-learning")

# Source the function
source("src/expected_squared_error.R")

# Test case 1: Basic usage
y1 <- c(1, 2, 3, 4, 5)
y_pred1 <- c(1.1, 2.1, 2.9, 4.2, 5.1)
print("Test 1 - Basic usage:")
print(expected_squared_error(y1, y_pred1))

# Test case 2: Perfect predictions
y2 <- c(1, 2, 3)
y_pred2 <- c(1, 2, 3)
print("Test 2 - Perfect predictions:")
print(expected_squared_error(y2, y_pred2))

# Test case 3: Error handling (should throw an error)
tryCatch({
  y3 <- c(1, 2, 3)
  y_pred3 <- c(1, 2)
  expected_squared_error(y3, y_pred3)
}, error = function(e) {
  print("Test 3 - Error handling (expected):")
  print(e$message)
})
