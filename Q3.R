setwd("C:/Users/cty-c/Desktop")
gdp <- read.csv("gdp-nz.csv", stringsAsFactors=TRUE)
# Question 3
# Define the function getGrowth()
# Return the data frame containing “quarter” and “rate” (quarterly GDP growth rate in percent)
getGrowth <- function(sector_name) {
  
  # Step1: Extract all rows from the specified sector
  sub <- gdp[gdp$sector == sector_name, ]
  
  # Step2: Sorted by quarter in chronological order
  sub <- sub[order(as.character(sub$quarter)), ]
  
  # Step3: Calculate the quarterly GDP growth rate 
  n <- nrow(sub)
  rate <- (sub$amount[-1] / sub$amount[-n] - 1) * 100
  
  # Step4: Store the current quarter and growth rate in a DataFrame and return it
  data.frame(
    quarter = sub$quarter[-1],
    rate    = rate
  )
}

# Check the answer
all.equal(AgricultureGrowth, getGrowth("Agriculture"))   # TRUE
all.equal(TotalGrowth,       getGrowth("Total"))         # TRUE
head(getGrowth("Mining"))
head(getGrowth("Education and training"))

getGrowth <- function(sector_name, startYear, endYear) {
  
  # If a numeric value is provided, it is converted to the corresponding factor level name.
  if (is.numeric(sector_name)) {
    sector_name <- levels(gdp$sector)[sector_name]
  }
  
  # Step1: Extract all rows from the specified sector
  sub <- gdp[gdp$sector == sector_name, ]
  
  # Step2: Sorted by quarter in chronological order
  sub <- sub[order(as.character(sub$quarter)), ]
  
  # Step3: Calculate the quarterly GDP growth rate (in percent) for the entire series
  n <- nrow(sub)
  rate <- (sub$amount[-1] / sub$amount[-n] - 1) * 100
  
  # Step4: Build a complete data frame of growth rates
  growth <- data.frame(
    quarter = sub$quarter[-1],
    rate    = rate
  )
  
  # Step5: Extract the year (first 4 digits) from “quarter”
  years <- as.numeric(substr(as.character(growth$quarter), 1, 4))
  
  # Step6: Keep only the rows between startYear and endYear
  growth <- growth[years >= startYear & years <= endYear, ]
  
  # Step7: Reset the line numbers so that they are numbered consecutively starting from 1
  rownames(growth) <- NULL
  
  return(growth)
}

# check
getGrowth("Agriculture", 1988, 1989)
getGrowth("Total", 2025, 2026)
levels(gdp[,1])[20]          # "Mining"
getGrowth(20, 2025, 2026)

```
