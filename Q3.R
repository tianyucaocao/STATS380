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


# Define a function and name it getGrowth
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


# Define a function and name it getGrowth
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
getGrowth <- function(df, sector_name, startYear = 1987, endYear = 2026) {
  # 1. Data-format check 
  if (!isGDPData(df)) {
    stop("df is not in the expected GDP format (see isGDPData)")
  }

  # 2. sector_name check and conversion 
  if (length(sector_name) != 1 || is.na(sector_name) ||
      !(is.character(sector_name) || is.numeric(sector_name))) {
    stop("sector_name must be one character or numeric value")
  }
  if (is.numeric(sector_name) && !is.finite(sector_name)) {
    stop("numeric sector_name must be finite")
  }
  if (is.numeric(sector_name)) {
    if (sector_name != floor(sector_name) ||
        sector_name < 1 || sector_name > nlevels(df$sector)) {
      stop("numeric sector_name must be a valid integer index")
    }
    sector_name <- levels(df$sector)[sector_name]
  }
  if (!(sector_name %in% levels(df$sector))) {
    stop("unknown sector: '", sector_name, "'")
  }

  # 3. Year-argument checks
  if (length(startYear) != 1 || !is.numeric(startYear) ||
      is.na(startYear) || !is.finite(startYear) ||
      startYear != floor(startYear)) {
    stop("startYear must be one finite integer")
  }
  if (length(endYear) != 1 || !is.numeric(endYear) ||
      is.na(endYear) || !is.finite(endYear) ||
      endYear != floor(endYear)) {
    stop("endYear must be one finite integer")
  }
  if (startYear > endYear) {
    stop("startYear must not be greater than endYear")
  }

  # 4. Subset and order 
  sub <- df[df$sector == sector_name, ]
  sub <- sub[order(as.character(sub$quarter)), ]

  # 5. Growth rates 
  n <- nrow(sub)
  if (n < 2) stop("at least two observations are required")
  if (anyNA(sub$amount) || any(sub$amount[-n] == 0)) {
    stop("GDP amounts must not be missing or have zero denominators")
  }
  rate <- (sub$amount[-1] / sub$amount[-n] - 1) * 100
  growth <- data.frame(quarter = sub$quarter[-1], rate = rate)

  # 6. Year filter and return 
  years  <- as.numeric(substr(as.character(growth$quarter), 1, 4))
  growth <- growth[years >= startYear & years <= endYear, ]
  rownames(growth) <- NULL
  growth
}
