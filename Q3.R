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

