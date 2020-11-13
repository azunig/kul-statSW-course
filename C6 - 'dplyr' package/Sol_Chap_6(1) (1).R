
# --- Chapter 6 ---
# --- Solution to exercises ---
library(dplyr)
library(tidyverse)

# - Exercise 1: Exercise tips -
library(reshape)
names(tips)
## Question 1
tips.tbl <- as_tibble(tips)

## Question 2
# Select observations
sub1 <- filter(tips.tbl, sex=="Male", size >= 3)
head(sub1)

## Question 3.a
# Select observations
sub2 <- filter(tips.tbl, sex=="Male"| size >= 3)
head(sub2)
## Question 3.b
# Select all variables except certain variables
sub3 <- select(sub2, -smoker)
names(sub3)
## Question 3.c
# Sort sub3 by time  and decreasing size of table 
sort1 <- arrange(sub3, time,  desc(size))
head(sort1)
## Question 3.d
# Average tip by sex
by_sex <- group_by(sort1, sex)
summarise(by_sex, Avgtip = mean(tip))
## Question 3.e: Use now pipe 
result <- tips.tbl %>%
      filter( sex=="Male"| size >= 3) %>%
      select( - smoker) %>%
      arrange(time,  desc(size)) %>%
      group_by(sex) %>%
      summarise(Avgtip = mean(tip))
result

# Question 4
# Average tip by day
by_day <- group_by(tips.tbl, day)
summarise(by_day, Avgtip = mean(tip))

# Question 5
# Average tip by sex and day
by_sex_day <- group_by(tips.tbl, sex, day)
summarise(by_sex_day, Avgtip = mean(tip))



# - Exercise 2: Overall exercise -
library(reshape)
names(tips)
# Question 1: Compute descriptive statistic for total bill by gender of bill payer
by_gender <- group_by(tips, sex)
summarise(by_gender, mean(total_bill), median(total_bill), n=n(), 
          sd(total_bill))

# Question 2: Grouped box plot
boxplot(total_bill ~ sex, data = tips, col = 'red', xlab = " ", ylab = " ")

# Question 3: Histogram overlaid with density plot
hist(tips$total_bill, prob = TRUE, col = 'red')
lines(density(tips$total_bill))

# Question 4: Two graphs next to each other in one graphical window
par(mfrow=c(1,2))
boxplot(total_bill ~ sex, data = tips, col = 'red', xlab = " ", ylab = " ")
hist(tips$total_bill, prob = TRUE, col = 'red')
lines(density(tips$total_bill))

# Question 5: Write the function 
VISUAL <- function(DFR, CONT, CAT, COL1)
{
  par(mfrow=c(1,2))
  # Grouped box plot
  boxplot(CONT ~ CAT, col = COL1, data = DFR, xlab = " ", ylab = " ")
  # Histogram overlaid with density plot
  hist(CONT, prob=TRUE, col = COL1, main = " ",xlab = " ")
  lines(density(CONT))  
  }

# Question 6: Apply the function 
VISUAL(tips, tips$tip, tips$day, "green")




# - Exercise 3: Missing data -
library(datasets)
names(airquality)

# Question 1
summary(airquality)

# Question 2: Count number of rows 
nrow(airquality)

# Question 3: Count number of missing for Ozone
sum(is.na(airquality$Ozone))

# Question 4: Only complete cases
air_complete <- airquality[complete.cases(airquality),]

# Question 5: Count number of rows 
nrow(air_complete)


