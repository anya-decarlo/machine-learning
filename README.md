# Statistical Error Calculations in R

This R package provides functions for calculating various statistical error metrics, including weighted and unweighted squared errors.

## Directory Structure

```
.
├── src/           # Source code files
├── tests/         # Test files
└── docs/          # Documentation
```

## Functions

1. `expected_squared_error`: Calculates the expected value of squared errors
2. `calculate_probabilities`: Normalizes weights into probabilities
3. `calculate_weighted_squared_error`: Computes weighted squared errors

## Usage

```R
# Load the functions
source("src/expected_squared_error.R")
source("src/weighted_squared_error.R")

# Example usage
y <- c(1, 2, 3)
y_pred <- c(1.1, 2.1, 2.9)
weights <- c(1, 2, 1)

# Calculate regular squared error
mse <- expected_squared_error(y, y_pred)

# Calculate weighted squared error
wmse <- calculate_weighted_squared_error(y, y_pred, weights)
```

## Testing

Run the tests using:

```R
source("tests/test_expected_squared_error.R")
source("tests/test_weighted_squared_error.R")
```
