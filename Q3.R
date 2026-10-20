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

plotGrowths <- function(sector_name, startYear = 1987, endYear = 2026) {
  # ---- data ---------------------------------------------------------
  g <- getGrowths(sector_name, startYear, endYear)

  # Parse "YYYYQn" into (year, quarter) and use a fractional-year x-axis
  qs    <- as.character(g$quarter)
  years <- as.integer(substr(qs, 1, 4))
  qnum  <- as.integer(substr(qs, 6, 6))
  x     <- years + (qnum - 1) / 4

  # ---- ranges -------------------------------------------------------
  y_range <- range(c(g$quarterlyRate, g$annualRate, -20, 20), na.rm = TRUE)
  y_range <- y_range + c(-2, 2)
  x_range <- range(years) + c(-0.5, 0.5)

  # ---- set up plot step by step -------------------------------------
  par(mar = c(4, 4, 3, 1))
  plot.new()
  plot.window(xlim = x_range, ylim = y_range)

  # ---- horizontal grid lines at -20, -15, ..., 20 -------------------
  abline(h = seq(-20, 20, by = 5), col = "grey80", lty = 3)
  abline(h = 0, col = "grey30")

  # ---- quarterly growth rates: bars (single rect() call) ------------
  w <- 0.18
  rect(xleft   = x - w / 2,
       ybottom = 0,
       xright  = x + w / 2,
       ytop    = g$quarterlyRate,
       col     = "blue",
       border  = "blue")

  # ---- annual growth rate curve -------------------------------------
  lines(x, g$annualRate, col = "red", lwd = 2.5)
  points(x, g$annualRate, col = "red", pch = 19)

  # ---- axes, labels, title ------------------------------------------
  axis(1, at = sort(unique(years)), labels = sort(unique(years)),
       cex.axis = 0.85)
  axis(2)
  mtext("Year",           side = 1, line = 2.5)
  mtext("Growth rate (%)", side = 2, line = 2.5)

  sector_label <- if (is.numeric(sector_name)) levels(gdp$sector)[sector_name]
                  else sector_name
  title(main = sector_label)

  #  legend (top-right)
  legend("topright",
         legend = c("Quarterly", "Annual"),
         col    = c("blue", "red"),
         pch    = c(15, 19),
         lty    = c(NA, 1),
         lwd    = c(1, 2),
         bty    = "o",
         bg     = "white",
         cex    = 0.85)
}
plotSectors <- function(sectors, startYear = 1987, endYear = 2026) {
  if (is.numeric(sectors)) {
    if (any(!is.finite(sectors)) ||
        any(sectors != floor(sectors)) ||
        any(sectors < 1) || any(sectors > nlevels(gdp$sector))) {
      stop("numeric sector indices must be valid finite integers")
    }
    sectors <- levels(gdp$sector)[sectors]
  } else if (is.character(sectors)) {
    if (!all(sectors %in% levels(gdp$sector))) {
      bad <- sectors[!sectors %in% levels(gdp$sector)]
      stop("unknown sector(s): ", paste(bad, collapse = ", "))
    }
  } else {
    stop("sectors must be a character or numeric vector")
  }

  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE)
  par(mfrow = n2mfrow(length(sectors)))

  for (s in sectors) {
    plotGrowths(s, startYear, endYear)
  }
  invisible(NULL)
}

# Demonstration
plotSectors(1:10, 1987, 2026)


plotGrowths <- function(sector_name, startYear = 1987, endYear = 2026,
                        col = c("steelblue", "darkorange")) {
  if (!is.character(col) || length(col) != 2) {
    stop("col must be a character vector of length 2")
  }

  g <- getGrowths(sector_name, startYear, endYear)

  qs    <- as.character(g$quarter)
  years <- as.integer(substr(qs, 1, 4))
  qnum  <- as.integer(substr(qs, 6, 6))
  x     <- years + (qnum - 1) / 4

  y_range <- range(c(g$quarterlyRate, g$annualRate, -20, 20), na.rm = TRUE)
  y_range <- y_range + c(-2, 2)
  x_range <- range(years) + c(-0.5, 0.5)

  par(mar = c(4, 4, 3, 1))
  plot.new()
  plot.window(xlim = x_range, ylim = y_range)

  abline(h = seq(-20, 20, by = 5), col = "grey80", lty = 3)
  abline(h = 0, col = "grey30")

  w <- 0.25 * 0.7
  rect(xleft   = x - w / 2,
       ybottom = 0,
       xright  = x + w / 2,
       ytop    = g$quarterlyRate,
       col     = col[1],
       border  = col[1])

  lines(x, g$annualRate, col = col[2], lwd = 2)
  points(x, g$annualRate, col = col[2], pch = 19)

  axis(1, at = sort(unique(years)), labels = sort(unique(years)),
       cex.axis = 0.85)
  axis(2)
  mtext("Year",           side = 1, line = 2.5)
  mtext("Growth rate (%)", side = 2, line = 2.5)

  sector_label <- if (is.numeric(sector_name)) levels(gdp$sector)[sector_name]
                  else sector_name
  title(main = sector_label)

  legend("topright",
         legend = c("Quarterly", "Annual"),
         col    = col,
         pch    = c(15, 19),
         lty    = c(NA, 1),
         lwd    = c(1, 2),
         bty    = "o",
         bg     = "white",
         cex    = 0.85)
}
```

## 2. Modified `plotSectors()`

```{r plotSectors-modified}
plotSectors <- function(
    sectors = c("Total", "Primary industries",
                "Goods producing industries", "Services industries"),
    startYear = 1987, endYear = 2026,
    col       = c("steelblue", "darkorange"),
    layout    = c("row", "col")) {

  layout <- match.arg(layout)

  if (!is.character(col) || length(col) != 2) {
    stop("col must be a character vector of length 2")
  }

  if (is.numeric(sectors)) {
    if (any(!is.finite(sectors)) ||
        any(sectors != floor(sectors)) ||
        any(sectors < 1) || any(sectors > nlevels(gdp$sector))) {
      stop("numeric sector indices must be valid finite integers")
    }
    sectors <- levels(gdp$sector)[sectors]
  } else if (is.character(sectors)) {
    if (!all(sectors %in% levels(gdp$sector))) {
      bad <- sectors[!sectors %in% levels(gdp$sector)]
      stop("unknown sector(s): ", paste(bad, collapse = ", "))
    }
  } else {
    stop("sectors must be a character or numeric vector")
  }

  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE)

  grid <- n2mfrow(length(sectors))
  if (layout == "row") par(mfrow = grid) else par(mfcol = grid)

  for (s in sectors) {
    plotGrowths(s, startYear, endYear, col = col)
  }
  invisible(NULL)
}
