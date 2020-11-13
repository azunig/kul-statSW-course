#install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
library(dplyr)

head(flights)

oct <- filter(flights, month == 10, day == 1)


first <- filter(flights, month == 10 | day == 1)
head(first)

filter2 <- filter(flights, xor(month==10, day==1)) # Note the use of 'xor'
head(filter2)

names(flights)


select1 <- select(flights, year, month, day, dest)
names(select1)

select2 <- select(flights, origin:distance)
names(select2)

select3 <- select(flights, -(origin:distance))
names(select3)

select4 <- select(flights, c(3:6, 9))
names(select4)

sort1 <- arrange(select1, year, month, day, desc(dest))
head(sort1)


df2 <- tibble(x = c(5, 2, NA), y = c('start', NA, 'end'), z = c(NA, TRUE, FALSE))
df2


arrange(df2, x)

arrange(df2, desc(x))

arrange(df2, y)

arrange(df2, z)


flights_sml <- select(flights, ends_with("delay"), distance, air_time)
names(flights_sml)

new2 <- transmute(flights_sml,
                  extra = arr_delay - dep_delay,
                  hours = air_time/60)
head(new2)

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


# Create a grouped tibble from an existing tibble.
# Grouping tibble 'flights' by date
by_date <- group_by(flights, year, month, day)
# Compute the mean value per group
summarise(by_date, Avgdelay = mean(dep_delay, na.rm = TRUE))

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



### Combining multiple operations with the pipe

sort_example1 <- flights %>%
  group_by(dest) %>%
  summarise(
    avg_delay = mean(arr_delay, na.rm = T),
    sd_delay = sd(arr_delay, na.rm = T),
    count = sum(!is.na(arr_delay))
  ) %>%
  arrange(desc(count), avg_delay)




sort_example2 <- flights %>%
  group_by(dest) %>%
  summarise(
    count = sum(!is.na(arr_delay)),
    prop_long_delay = sum(arr_delay > 60, na.rm = T)/ count
  ) %>%
  filter(count > 100) %>%
  arrange(prop_long_delay)



sum_dest_sub2 <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    Avgdist = mean(distance, na.rm = TRUE),
    AvgAdelay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, Avgdist < 3000)
ggplot(data = sum_dest_sub2, aes(x = Avgdist, y = AvgAdelay)) +
  geom_point(size = 3) + geom_smooth(se = FALSE, method = 'lm')


library(readxl)
stat93_nmk <- read_excel("~/GitHub/kul-software-course/kul-statSW-course/C6 - 'dplyr' package/stat93_nmk(1).xlsx")
stat94_nmk <- read_excel("~/GitHub/kul-software-course/kul-statSW-course/C6 - 'dplyr' package/stat94_nmk(1).xlsx")



injoin <- inner_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
injoin[, c(1:3, 5)]


Ljoin <- left_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Ljoin[, c(1:3, 5)]


Rjoin <- right_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Rjoin[, c(1:3, 5)]

Fjoin <- full_join(stat93_nmk, stat94_nmk, by = c("off_code93" = "off_code94"))
Fjoin

library(reshape)
#Differences between a tibble and a data frame

tips.tib <- as_tibble(tips)
head(tips.tib)

flights.df <- as_tibble(flights)
head(flights.df)

# In this exercise, the data set tips from the package reshape will be used.
# One waiter recorded information about each tip he received over a period of a few months working in one
# restaurant. He collected several variables:
  # • tip: tip in dollars
  # • total_bill: bill in dollars
  # • sex: sex of the bill payer
  # • smoker: whether there were smokers in the party
  # • day: day of the week
  # • time: time of the day
  # • size: size of the party
# In all he recorded 244 tips.
# 1. Create a tibble tips.tbl from the data frame tips
# 2. Create a subset sub1 from tips.tbl with only those observations with gender Male and with size of the table larger than or equal to three.
# 3. 
  # a) Create a subset sub2 from tips.tbl with only those observations with gender Male  or with size of the table larger than or equal to three 
    #or with both gender Male and size ≥ 3.
  # b) Create a subset sub3 from sub2 with all variables except smoker.
  # c) Create a tibble sort1 by sorting sub3 by time and decreasing size of table.
  # d) Compute average tip by gender (use sort1)
  # e) Use now the pipe operator to do steps a-d of exercise 3. (start from tips.tbl)
# 4. Compute average tip by day of the week (use the tibble tips.tbl).
# 5. Compute average tip by gender and day of the week (use the tibble tips.tbl).


#1
  tips.tib <- as_tibble(tips)
#2
  sub1 <- tips.tib %>% 
    filter(xor(sex == "Male",size >= 3) )
#3
  #a
  sub2 <- tips.tib %>% 
    filter((sex == "Male") | (size >= 3) | (sex == "Male" & size >= 3) )
  #b  
  sub3 <- sub2 %>%  #sub3 <- select(tips.tib, -(smoker))
    select(total_bill, tip, sex, day, time, size)
  #c
  sort1 <- tips.tib %>%  
    arrange(time, desc(size))
  #d
  sort1 %>%  
    summarise(avg_tip = mean(tip, na.rm = TRUE))
#4  
  tips.tib %>%  
    group_by(day) %>% 
    summarise(avg_tip = mean(tip, na.rm = TRUE)) 
#5
  tips.tib %>%  
    group_by(sex, day) %>% 
    summarise(avg_tip = mean(tip, na.rm = TRUE)) 
  
  
##Overall exercise 
  # 1. Compute descriptive statistics (mean, median, n, stdev) of the variable total_bill by gender of the bill payer.
  # 2. Make a grouped boxplot of total bill by gender of the bill payer.
  # 3. Create a histogram of total bill and overlay it with a density curve.
  # 4. Put both graphs next to each other in one graphical window (see below)
#library(dplyr)
my_plot <-  tips.tib %>%  
    group_by(sex) %>% 
    summarise(avg_tip = mean(tip, na.rm = TRUE)) 
  
  par(mfrow = c(1,2))
  boxplot(tips.tib$total_bill ~ tips.tib$sex ,xlab = '', ylab = '', col = "red")
  hist(tips.tib$total_bill, freq = FALSE, col = "red")
  lines(density(tips.tib$total_bill), lty = 1, border = "purple")
  
  
  
  
  
# Create now a function VISUAL which is doing subquestion 2, 3, and 4 for you. The input parameters
# for this function are
  #a) DFR which is the name of your data frame
  #b) CONT which is the continuous variable
  #c) CAT which is the categorical variable
  #d) COL1 which gives you the color number of your graph
  
  VISUAL <- function(DFR, CONT, CAT, COL1)
  {
    
    
  }
  
  
  
  
# Exercise, missing data
  # 1. Use the airquality data frame form the package datasets. Use the summary function and interpret the result.
  # 2. Count the number of rows in this airquality dataframe (use nrow function)
  # 3. Count the number of missing values for variable Ozone
  # 4. Create a subset air_complete of airquality with only the complete cases (hint: you can use the  function complete.cases).
  # 5. Count the number of rows in air_complete.
    
#library(datasets)

  data(airquality)
  #1
    summary(airquality)
  #2
    nrow(airquality)
  #3
    sum(is.na(airquality$Ozone))
  #4
    air_complete <- airquality[complete.cases(airquality),]
  #5
    nrow(air_complete)
  
  
  
  
  
  
  
  
  curve(dchisq(tips.tib$total_bill, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
  
  
  
  op <- par(mfrow = c(2, 2))
  hist(islands)
  utils::str(hist(islands, col = "gray", labels = TRUE))
  
  hist(sqrt(islands), breaks = 12, col = "lightblue", border = "pink")
  ##-- For non-equidistant breaks, counts should NOT be graphed unscaled:
  r <- hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
            col = "blue1")
  text(r$mids, r$density, r$counts, adj = c(.5, -.5), col = "blue3")
  sapply(r[2:3], sum)
  sum(r$density * diff(r$breaks)) # == 1
  lines(r, lty = 3, border = "purple") # -> lines.histogram(*)
  par(op)
  
  require(utils) # for str
  str(hist(islands, breaks = 12, plot =  FALSE)) #-> 10 (~= 12) breaks
  str(hist(islands, breaks = c(12,20,36,80,200,1000,17000), plot = FALSE))
  
  hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
       main = "WRONG histogram") # and warning
  
  ## Extreme outliers; the "FD" rule would take very large number of 'breaks':
  XXL <- c(1:9, c(-1,1)*1e300)
  hh <- hist(XXL, "FD") # did not work in R <= 3.4.1; now gives warning
  ## pretty() determines how many counts are used (platform dependently!):
  length(hh$breaks) ## typically 1 million -- though 1e6 was "a suggestion only"
  
  require(stats)
  set.seed(14)
  x <- rchisq(100, df = 4)
  
  ## Comparing data with a model distribution should be done with qqplot()!
  qqplot(x, qchisq(ppoints(x), df = 4)); abline(0, 1, col = 2, lty = 2)
  
  ## if you really insist on using hist() ... :
  hist(x, freq = FALSE, ylim = c(0, 0.2))
  curve(dchisq(x, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
  
  
  
  
  
  
  
  tN <- table(Ni <- stats::rpois(100, lambda = 5))
  r <- barplot(tN, col = rainbow(20))
  
  
  # Formula method
  barplot(GNP ~ Year, data = longley)
  barplot(cbind(Employed, Unemployed) ~ Year, data = longley)
  
  ## 3rd form of formula - 2 categories :
  op <- par(mfrow = 2:1, mgp = c(3,1,0)/2, mar = .1+c(3,3:1))
  summary(d.Titanic <- as.data.frame(Titanic))
  barplot(Freq ~ Class + Survived, data = d.Titanic,
          subset = Age == "Adult" & Sex == "Male",
          main = "barplot(Freq ~ Class + Survived, *)", ylab = "# {passengers}", legend = TRUE)
  # Corresponding table :
  (xt <- xtabs(Freq ~ Survived + Class + Sex, d.Titanic, subset = Age=="Adult"))
  # Alternatively, a mosaic plot :
  mosaicplot(xt[,,"Male"], main = "mosaicplot(Freq ~ Class + Survived, *)", color=TRUE)
  par(op)
  
  
  # Default method
  require(grDevices) # for colours
  tN <- table(Ni <- stats::rpois(100, lambda = 5))
  r <- barplot(tN, col = rainbow(20))
  #- type = "h" plotting *is* 'bar'plot
  lines(r, tN, type = "h", col = "red", lwd = 2)
  
  barplot(tN, space = 1.5, axisnames = FALSE,
          sub = "barplot(..., space= 1.5, axisnames = FALSE)")
  
  barplot(VADeaths, plot = FALSE)
  barplot(VADeaths, plot = FALSE, beside = TRUE)
  
  mp <- barplot(VADeaths) # default
  tot <- colMeans(VADeaths)
  text(mp, tot + 3, format(tot), xpd = TRUE, col = "blue")
  barplot(VADeaths, beside = TRUE,
          col = c("lightblue", "mistyrose", "lightcyan",
                  "lavender", "cornsilk"),
          legend = rownames(VADeaths), ylim = c(0, 100))
  title(main = "Death Rates in Virginia", font.main = 4)
  
  hh <- t(VADeaths)[, 5:1]
  mybarcol <- "gray20"
  mp <- barplot(hh, beside = TRUE,
                col = c("lightblue", "mistyrose",
                        "lightcyan", "lavender"),
                legend = colnames(VADeaths), ylim = c(0,100),
                main = "Death Rates in Virginia", font.main = 4,
                sub = "Faked upper 2*sigma error bars", col.sub = mybarcol,
                cex.names = 1.5)
  segments(mp, hh, mp, hh + 2*sqrt(1000*hh/100), col = mybarcol, lwd = 1.5)
  stopifnot(dim(mp) == dim(hh))  # corresponding matrices
  mtext(side = 1, at = colMeans(mp), line = -2,
        text = paste("Mean", formatC(colMeans(hh))), col = "red")
  
  # Bar shading example
  barplot(VADeaths, angle = 15+10*1:5, density = 20, col = "black",
          legend = rownames(VADeaths))
  title(main = list("Death Rates in Virginia", font = 4))
  
  # Border color
  barplot(VADeaths, border = "dark blue") 
  
  
  # Log scales (not much sense here)
  barplot(tN, col = heat.colors(12), log = "y")
  barplot(tN, col = gray.colors(20), log = "xy")
  
  # Legend location
  barplot(height = cbind(x = c(465, 91) / 465 * 100,
                         y = c(840, 200) / 840 * 100,
                         z = c(37, 17) / 37 * 100),
          beside = FALSE,
          width = c(465, 840, 37),
          col = c(1, 2),
          legend.text = c("A", "B"),
          args.legend = list(x = "topleft"))
  
  
  boxplot(tips$tip ~ tips$day, ylab = 'tip', col = 4)
  
  result.lm <- lm(tip ~ total_bill, data = tips)