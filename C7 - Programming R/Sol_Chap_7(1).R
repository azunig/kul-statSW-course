
# --- Chapter 7 ---
# --- Solution to exercises ---


# - Exercise 1 -
i <- 1
while (i < 6)
{ x <- paste('nr',i)
print (x)
i <- i+1 
}



# - Exercise 2 -
i <- 1
sum <- 0
n <- 5
while (i <= n)
{ sum <- sum + i 
i <- i+1
}
print(sum)



# - Exercise 3 -
i <- 1
while (i <= 5)
{ x <- rep(i, i)
print(x)
i <- i+1
}



# - Exercise 4 -

## Question 1
library(tidyr)
names(billboard)

### Question 1.a
billboard_date <- billboard %>%
  mutate(Year = year(date.entered),
         Month = month(date.entered),
         Day_nr = mday(date.entered)) %>%
  select("artist", "wk1", "wk2", "wk3", "wk4", "Year", "Month", "Day_nr")
names(billboard_date)
head(billboard_date, n=20)

### Question 1.b
b_billboard <- pivot_longer(billboard_date, 2:5, names_to = "Week", values_to = "Rank")
names(b_billboard)
head(b_billboard)
dim(b_billboard)
dim(billboard_date)


## Question 2
names(us_rent_income)
pivot_wider(us_rent_income, names_from = variable, values_from = c(estimate, moe))



# - Exercise 5: Individual and moving range chart -
library(qcc)
data(boiler)
names(boiler)
boiler$t1

## Question a: Create total 
mr1 <- abs(diff(boiler$t1, lag=1))
mr <- c(NA, mr1)
time <- seq(1:25)
x <- boiler$t1
total <- cbind(time, x, mr)
head(total, n=6)

## Question b
mean_per_col  <- apply(total[1:20,], 2, mean, na.rm=T)
mean_x <- mean_per_col[2]
mean_mr <- mean_per_col[3]
list(mean_x = mean_x, mean_mr = mean_mr)

## Question c: Compute control limits
# For a moving range, the constants are
E2 <- 2.66
D3 <- 0
D4 <- 3.267
# Control limits of individual chart
list(mean_x = mean_x, LCL_x = mean_x - E2* mean_mr, 
     UCL_x = mean_x + E2 * mean_mr)
# Control limits of moving range chart
list(mean_mr = mean_mr, LCL_mr = mean_mr * D3, 
     UCL_mr = mean_mr * D4)

# Question d: Make the plots
par(mfrow=c(1,2))
# Individual chart
plot(time, total[,2], type="b", ylim = c(505,545), main="Individual chart")
abline(h=c(mean_x,LCL_x, UCL_x), col=4, lwd=3)
# Plot mr chart
plot(time, total[,3], type="b", ylim = c(0,22), main="Moving range chart")
abline(h=c(mean_mr,LCL_mr, UCL_mr), col=4, lwd=3)



# - Exercise 6: Exercise on rolling average to detect trends in your data -
## Step 1: 
# Generate sequence of data between 1 and 3 of total length 100
x <- seq( 1, 3, length = 100) 
plot(x)
# Use the jitter function to add noise to your data
y <- jitter(x, factor=100)
plot(y)


# Step 2: Compute a vector roll.mean with averages of 5 consecutive points
consec <- 5
roll.mean <- rep(NA, 100)
for (i in (1:96)){roll.mean[i] <- mean(y[i: (i+consec-1)])
}
roll.mean

# Step 3: Add these averages to the plot
lines(roll.mean, col=3, lwd=2)

# Step 4: Generalize your step 3 and step 4 
# Create a function with parameters consec and y 
rollmeanf <- function(y, consec = 5) {
  roll.mean <- rep(NA, 100)
  for (i in (1:96)){roll.mean[i] <- mean(y[i: (i+consec-1)])
  }
  plot(y)
  lines(roll.mean, col=3, lwd=2)
}

#step 5: apply this to rolling averages of size 10
rollmeanf(y, 10)
