# Define allocation strategies as functions
strategy1 <- function(data, sector_names) {
  # Allocation strategy 1 logic
  # This function should return a vector of allocated sectors.
  # Example: Switch to the sector with the highest moving average
  allocated_sectors <- apply(data[, sector_names], 1, function(row) {
    max_sector <- sector_names[which.max(row)]
    return(max_sector)
  })
  return(allocated_sectors)
}

strategy2 <- function(data, sector_names) {
  # Allocation strategy 2 logic
  # This function should return a vector of allocated sectors.
  # Example: Switch to the sector with the lowest moving average
  allocated_sectors <- apply(data[, sector_names], 1, function(row) {
    min_sector <- sector_names[which.min(row)]
    return(min_sector)
  })
  return(allocated_sectors)
}

strategy3 <- function(data, sector_names) {
  # Allocation strategy 3 logic
  # This function should return a vector of allocated sectors.
  # Example: Switch to the sector with the highest average volume
  allocated_sectors <- apply(data[, sector_names], 1, function(row) {
    max_sector <- sector_names[which.max(row)]
    return(max_sector)
  })
  return(allocated_sectors)
}

strategy4 <- function(data, sector_names) {
  # Allocation strategy 4 logic
  # This function should return a vector of allocated sectors.
  # Example: Switch to the sector with the lowest volatility
  allocated_sectors <- apply(data[, sector_names], 1, function(row) {
    min_sector <- sector_names[which.min(row)]
    return(min_sector)
  })
  return(allocated_sectors)
}

# Define a function to compare allocation strategies and return the best one
compare_allocation_strategies <- function(data, sector_names, strategies, metric = "return") {
  best_strategy <- NULL
  best_metric <- NULL
  
  for (strategy in strategies) {
    allocated_sectors <- strategy(data, sector_names)
    
    # Calculate the metric (e.g., returns) for the strategy
    if (metric == "return") {
      # Calculate returns here based on your specific criteria
      strategy_metric <- mean(allocated_sectors == data$Actual_Sector)  # Example metric: Accuracy
    }
    
    # Update the best strategy if this strategy performs better
    if (is.null(best_strategy) || strategy_metric > best_metric) {
      best_strategy <- strategy
      best_metric <- strategy_metric
    }
  }
  
  return(best_strategy)
}
