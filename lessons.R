### Intro to Computational Finance with R
### E Zivot - on Datacamp

## 1

# Assign the URL to the CSV file
data_url <- "http://assets.datacamp.com/course/compfin/sbuxPrices.csv"
  
# Load the data frame using read.csv
sbux_df <- read.csv(data_url, header = T, stringsAsFactors = F)

## 2

# The sbux_df data frame is already loaded in your work space

# Check the structure of sbux_df
str(sbux_df)

# Check the first and last part of sbux_df
head(sbux_df)
tail(sbux_df)

# Get the class of the Date column of sbux_df
class(sbux_df$Date)

## 3

# The sbux_df data frame is already loaded in your work space
closing_prices <- sbux_df[,"Adj.Close", drop = F]

## 4

# The sbux_df data frame is already loaded in your work space

# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 <- which(sbux_df$Date == "3/1/1994")
index_2 <- which(sbux_df$Date == "3/1/1995")

# Extract prices between 3/1/1994 and 3/1/1995
some_prices <- sbux_df[index_1:index_2, "Adj.Close"]

## 5

# The sbux_df data frame is already loaded in your work space

# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]
rownames(sbux_prices_df) <- sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 <- sbux_prices_df["3/1/1994", 1]
price_2 <- sbux_prices_df["3/1/1995", 1]

## 6

# Now add all relevant arguments to the plot function below to get a nicer plot
plot(sbux_df$Adj.Close, type = "l", col = "blue", lwd = 2, ylab = "Adjusted close", main = "Monthly closing price of SBUX")
legend(x = 'topleft', legend = 'SBUX', lty = 1, lwd = 2, col = 'blue')

## 7

# The sbux_df data frame is already loaded in your work space
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]

# Denote n the number of time periods
n <- nrow(sbux_prices_df)
sbux_ret <- (sbux_prices_df[2:n,1] - sbux_prices_df[1:(n - 1),1])/(sbux_prices_df[1:(n - 1),1])

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# sbux_ret is numeric, if you add drop = F to the [] then will be a data frame class

## 8

# Now add dates as names to the vector and print the first elements of sbux_ret to the console to check
names(sbux_ret) <- sbux_df[2:n,"Date"]
head(sbux_ret)

## 9

# Compute continuously compounded 1-month returns
sbux_ccret <- log(sbux_prices_df[2:n,1]) - log(sbux_prices_df[1:n-1,1])

# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) <- sbux_df[2:n, "Date"]

# Show sbux_ccret
head(sbux_ccret)

## 10

# Compare the simple and cc returns
head(cbind(sbux_ret, sbux_ccret))

## 11

# The simple returns (sbux_ret) and the continuously compounded returns (sbux_ccret) have been preloaded in your workspace

# Plot the returns on the same graph
plot(sbux_ret, type = "l", col = "blue", lwd = 2, ylab = "Return", main = "Monthly Returns on SBUX")

# Add horizontal line at zero
abline(h = 0)

# Add a legend
legend(x = "bottomright", legend = c("Simple", "CC"), lty = 1, lwd = 2, col = c("blue", "red"))

# Add the continuously compounded returns
lines(sbux_ccret, col = "red", lwd = 2)

## 12



