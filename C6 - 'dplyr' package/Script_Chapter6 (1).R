
# --- Chapter 6: Some concepts of dplyr package ---

# - Data frame: flights -
install.packages("nycflights13")
library(nycflights13)
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)

head(flights)


# - Basic functions in dplyr package -
## - Select observations: filter() - 
?filter
oct <- filter(flights, month == 10, day ==1)
head(oct)

first <- filter(flights, month == 10 | day == 1)
head(first)

filter2 <- filter(flights, xor(month==10, day==1)) # Note the use of 'xor'
head(filter2)


## - Select variables: select() - 
?select
names(flights)

select1 <- select(flights, year, month, day, dest)
names(select1)

select2 <- select(flights, origin:distance)
names(select2)

select3 <- select(flights, -(origin:distance))
names(select3)

select4 <- select(flights, c(3:6, 9))
names(select4)


## - Sorting data frame by one (or more) of its variables: arrange() - 
?arrange
sort1 <- arrange(select1, year, month, day, desc(dest))
head(sort1)

df2 <- tibble(x = c(5, 2, NA), y = c('start', NA, 'end'), z = c(NA, TRUE, FALSE)) 
df2
arrange(df2, x)
arrange(df2, desc(x))
arrange(df2, y)
arrange(df2, z)


## - Create new variables: mutate() and transmute() - 
flights_sml <- select(flights, ends_with("delay"), distance, air_time)
names(flights_sml)
new1 <- mutate(flights_sml, 
               extra = arr_delay - dep_delay,
               hours = air_time/60)
head(new1)

new2 <- transmute(flights_sml, 
                  extra = arr_delay - dep_delay,
                  hours = air_time/60)
head(new2)


## - Grouped summaries: summarise() - 
summarise(flights, Avgdelay = mean(dep_delay, na.rm=TRUE))

test <- c(1:10, NA, NA)
test

mean1 <- mean(test, na.rm = TRUE)
mean1

mean2 <- mean(test, na.rm = FALSE)
mean2

df2 <- tibble(x = c(5, 2, NA))
x1 <- is.na(df2$x)
x1

x2 <- !is.na(df2$x)
x2

# Create a grouped tibble from an existing tibble. 
# Grouping tibble 'flights' by date
by_date <- group_by(flights, year, month, day)

# Compute the mean value per group
summarise(by_date, Avgdelay = mean(dep_delay, na.rm = TRUE))

# Compute the number of flights per day
summarise(by_date, n_flights = n())

fl_group <- group_by(flights, dest)
fl_descr <- summarise(fl_group,
                      avg_delay = mean(arr_delay, na.rm = TRUE),
                      sd_delay = sd(arr_delay, na.rm = TRUE),
                      max_delay = max(arr_delay, na.rm = TRUE), 
                      count = sum(!is.na(arr_delay)))
arrange(fl_descr, desc(count), avg_delay)

fl_group <- group_by(flights, dest)
fl_descr <- summarise(fl_group, 
                      count = sum(!is.na(arr_delay)),
                      prop_long_delay = sum(arr_delay > 60, na.rm = TRUE) / count )
sub1 <- filter(fl_descr, count > 100)
arrange(sub1, prop_long_delay)


# - Combining multiple operations with the pipe - 
## Example 1 without the use of pipe
fl_group <- group_by(flights, dest)
fl_descr <- summarise(fl_group,
                      avg_delay = mean(arr_delay, na.rm = TRUE),
                      sd_delay = sd(arr_delay, na.rm = TRUE),
                      max_delay = max(arr_delay, na.rm = TRUE), 
                      count = sum(!is.na(arr_delay)))
arrange(fl_descr, desc(count), avg_delay)

## Example 1 with the use of pipe
sort_example1 <- flights %>%
  group_by(dest) %>%
  summarise(
    avg_delay = mean(arr_delay, na.rm = T), 
    sd_delay = sd(arr_delay, na.rm = T),
    count = sum(!is.na(arr_delay))
  ) %>%
  arrange(desc(count), avg_delay)


## Example 2 without the use of pipe
fl_group <- group_by(flights, dest)
fl_descr <- summarise(fl_group, 
                      count = sum(!is.na(arr_delay)),
                      prop_long_delay = sum(arr_delay > 60, na.rm = TRUE) / count )
sub1 <- filter(fl_descr, count > 100)
arrange(sub1, prop_long_delay)

## Example 2 with the use of pipe
sort_example2 <- flights %>%
  group_by(dest) %>%
  summarise(
    count = sum(!is.na(arr_delay)),
    prop_long_delay = sum(arr_delay > 60, na.rm = T)/ count 
  ) %>%
  filter(count > 100) %>%
  arrange(prop_long_delay)


## Example 3 without the use of pipe
# Step 1
by_dest <- group_by(flights, dest)
# Step 2
sum_dest <- summarise(by_dest, 
                      count = n(), 
                      Avgdist = mean(distance, na.rm = TRUE),
                      AvgAdelay = mean(arr_delay, na.rm = TRUE))
# Step 3
sum_dest_sub <- filter(sum_dest, count > 20)
# Step 4
ggplot(data = sum_dest_sub, aes(x = Avgdist, y = AvgAdelay)) + geom_point(size = 3) + geom_smooth(se = FALSE, method = 'lm')
# Step 5
sum_dest_sub2 <- filter(sum_dest_sub, Avgdist < 3000)
ggplot(data = sum_dest_sub2, aes(x = Avgdist, y = AvgAdelay)) + geom_point(size = 3) + geom_smooth(se = FALSE, method = 'lm')


## Example 3 with the use of pipe
sum_dest_sub2 <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    Avgdist = mean(distance, na.rm = TRUE), 
    AvgAdelay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, Avgdist < 3000)

ggplot(data = sum_dest_sub2, aes(x = Avgdist, y = AvgAdelay)) + geom_point(size = 3) + geom_smooth(se = FALSE, method = 'lm')




# - Integration of multiple sources: JOIN -
# import stat93_nmk.xlsx and stat94_nmk.xlsx
head(stat93_nmk)
head(stat94_nmk)

## - Inner join - 
injoin <- inner_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
injoin[, c(1:3, 5)]


## - Outer join - 
Ljoin <- left_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Ljoin[, c(1:3, 5)]

Rjoin <- right_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Rjoin[, c(1:3, 5)]

Fjoin <- full_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Fjoin


# - Differences between a tibble and a data frame - 
tips.tib <- as_tibble(tips)
head(tips.tib)

flights.df <- as_data_frame(flights)

head(flights.df)











