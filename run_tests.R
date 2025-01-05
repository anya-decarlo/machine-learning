# Set working directory to the script location
setwd(dirname(parent.frame(2)$ofile))

# Run all tests
source("tests/test_expected_squared_error.R")
source("tests/test_weighted_squared_error.R")
