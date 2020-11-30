
# --- Chapter 7: More programming in R ---

# - The family of apply functions in R - 
## - The apply function in R - 
library(qcc)
data(boiler)
head(boiler)

# Apply function log on each element of boiler
ln_boiler <- apply(boiler, c(1,2), log)
head(ln_boiler)
# Compute the average temperate per row (for every observation)
mean_per_row <- apply(boiler, 1, mean)
mean_per_row
# Compute the average temperature per column
mean_per_col <- apply(boiler, 2, mean)
mean_per_col


## - The tapply function in R - 
library(reshape)
# Look at the tips data
head(tips)

?tapply
# Compute average tip depending on day of the week 
tapply(tips$tip, tips$day, mean)
# Compute average tip depending on day of the week and time of the day
tapply(tips$tip, list(tips$day, tips$time), mean)


## - The lapply function in R - 
# By using split we divide a vector into groups defined by a factor 
# Here we divide the total amount of the tip by day of the week 
list_tip <- split(tips$tip, tips$day)
list_tip

lapply(list_tip, mean)


# - Loops in R - 

## - For loop -

# Example 1
head(tips, n=3)
# Count the number of reservations with even number of people 
# Use the variable size of tips data frame
sum_even <- 0
for (val in tips$size) {
  if (val %% 2 == 0) sum_even = sum_even + 1
}
# %% is modulo division in R
sum_even

# Example 2
# Assume that we want to create a new variable which is the total of the bill and the tip 
tips$total <- tips$total_bill + tips$tip
head(tips$total)

# Another way to do the same (but now with a for loop)
tips$total <- 0
for (i in 1:length(tips$total_bill)) {
  tips$total[i] <- tips$total_bill[i] + tips$tip[i]
}
head(tips)


## - While loop in R - 

# Example 1
i <- 1
while(i<6){
  i = i+1
  print(i)
}

# Example 2
i <- 1
while(i<6){
  i = i+1
  if (i==4) break
  print(i)
}

# Example 3
i <- 1
while(i<6){
  i = i+1
  if (i==4) next
  print(i)
}


## - Repeat loop in R - 
i <- 1
repeat{
  print(i)
  i = i+1
  if (i==6){break}
}



# - If then else in R - 
x <- -5
if(x>0){
  print("Non-negative number")
} else {
  print("Negative number")
}



# - Examples of writing functions in R -
## - General example - 

# Function of moving averages
Fn <- function(vec)
{
  for(i in 3:length(vec))
  {x[i] <- (vec[i-2] + vec[i-1] + vec[i])/3
  print(x[i])}
}
z <- 1:6
Fn(z)

## - Illustration of the Central Limit Theorem (use of for loop and apply functions - 
# Generate a matrix with rows and columns, each row is one sample. 
# One sample consists of 30 datapoints which are generated from an exponential distribution with rate 3.

# Step 1
rexp(30, rate=3)

# Step 2
mat <- matrix(rep(0,150), nrow=5)
for (i in (1:5))
{
  mat[i,] <- rexp(30, rate=3)
}

# Step 3
# compute the average for every sample
all.sample.means <- apply(mat,1,mean)  

# Step 4
# create a histogram with the original data of 1st row
#and another histogram with the averages
par(mfrow=c(1,2))
hist(mat[1,],col="blue", main="Distribution of One Sample")
hist(all.sample.means, col="green", main="Sampling Distribution of
     the Mean", prob=T)
lines(density(all.sample.means))


# Step 5
# create a function out of this 
clt_fun <- function(rpt = 5, n=30)
{
  mat <- matrix(rep(0,n*rpt), nrow=rpt)
  for (i in (1:rpt))
  {
    mat[i,] <- rexp(n, rate=3)
  }
  
  # compute the average for every sample
  all.sample.means <- apply(mat,1,mean)  
  
  # create a histogram with the original data for 1st row
  #and another histogram with the averages
  par(mfrow=c(1,2))
  hist(mat[1,],col="blue", main="Distribution of One Sample")
  hist(all.sample.means, col="green", main="Sampling Distribution of
         the Mean", prob=T)
  lines(density(all.sample.means))
}

# Step 6
clt_fun(rpt=500,n=30)



# - Dates - 
library(lubridate)
library(nycflights13)
library(ggplot2)

## - Create date from strings - 
# Current date:
today()
vec <- c("1970-01-01", "2020-01-31", "2020-02-01") # This is a vector
dates <- ymd(c("1970-01-01", "2020-01-31", "2020-02-01")) # This is a date
as.numeric(dates)


## - Create date from individual components - 
head(flights)
flights_date <- flights %>%
  select(year, month, day) %>%
  mutate(dep_date = make_date(year, month, day))
head(flights_date)


## - How to compare to a fixed date? -
sub <- flights_date %>%
  filter(dep_date == ymd(20130122))
head(sub)


## - Once you have a date, you can get components - 
head(economics, n=3)
econ <- economics
econ2 <- econ %>%
  select(date) %>%
  mutate(date_Y = year(date), date_M = month(date), date_D = mday(date), 
         date_wkd = wday(date, label = TRUE))
head(econ2)



# - Spreading and gathering - 

## - Gathering: make a long table - 
library(tidyr)
table4a

table_long <- pivot_longer(table4a, 2:3, names_to = "year", values_to = "cases")
table_long


## - Spreading: make a wide table - 
table2

table_wide <- pivot_wider(table2, id_cols = 1:2, names_from = type, values_from = count)
table_wide





