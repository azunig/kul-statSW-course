
# --- Chapter 5: Graphics with R --- # 

# - Scatterplot -

# The dataset airquality is available in the R package datasets
# If this package is not available, you can download it by using following command
# install.packages("datasets")
# then the Using R package will be available in your list of packages
# you still have to load it 
library(datasets)
help(airquality)
names(airquality)

plot(Ozone~Temp, data = airquality)
plot(airquality$Temp, airquality$Ozone)


# - Adding to a figure -

## - Adding titles and labels to a figure -
plot(Ozone~Temp, data = airquality, main = 'Temp versus Ozone', 
     sub = 'Airquality data', xlab = 'Temperature')

## - Setting up the coordinate system and axes of a graph -
plot(Ozone~Temp, data = airquality, xlim = c(70, 80), ylim = c(0, 150))

## - Plotting points, line types, ... -
plot(Ozone ~ Temp, data = airquality, type = 'p', col = 2, pch = 6, lty = 3, cex = 2)

## - Adding information to a plot -
plot(Ozone ~ Temp, data = airquality, pch = '*', cex = 3, col = 2)
points(65, 100, col = 3, cex = 5)
text(locator(1), 'new point', cex = 1.5)
text(65, 110, 'this is a new point')

## - Adding lines to a graph -
plot(Ozone~Temp, data = airquality, pch = "*", cex = 3, xlim = c(0,150), ylim = c(0,200))
abline(150, -1, lty = 1, col = 6, lwd = 4)
plot(Ozone~Temp, data = airquality, pch = "*", cex = 3)
mean_ozone <- mean(airquality$Ozone, na.rm = T)
abline(h = mean_ozone, lty = 1, col = 2, lwd = 3)

# Adding extra wind measurements
lines(Wind~Temp, data = airquality, pch = 6, col = 3, cex = 2, type = 'p')

# Adding a regression line for Ozone versus Temp
result.lm <- lm(Ozone~Temp, data = airquality)
abline(result.lm, lty = 3, col = 4, lwd = 5)

# Adding a regression line for Wind versus Temp
result2.lm <- lm(Wind~Temp, data = airquality)
abline(result2.lm, lty = 4, col = 3, lwd = 5)


## - Adding a legend to a plot -
legend(locator(1), c('mean ozone', 'Wind', 'regression line Ozone', 'regression line Wind'), 
lty = c(1, 1, 3, 4), col = c(2, 3, 4, 3))


# - Multiple plots on one graphical window - 
# Multiple plots on same graphical window
par(mfrow = c(1,2))

# Scatter plot and regression line of Ozone versus Temp
plot(Ozone ~ Temp, data = airquality, pch = '*', cex = 3)
result.lm <- lm(Ozone ~ Temp, data = airquality)
abline(result.lm, lty = 3, col = 4, lwd = 5)
# Scatter plot and regression line of Wind versus Temp
plot(Wind ~ Temp, data = airquality, pch = '*', cex = 3)
result2.lm <- lm(Wind ~ Temp, data = airquality)
abline(result2.lm, lty = 4, col = 3, lwd = 5)



# - Histogram with usual R graphics - 
x <- rnorm(50)
y <- rexp(50, rate = 2)
range(y)
z <- rchisq(50, 10)
range(z)

par(mfrow = c(1, 3))
hist(x, nclass = 10, main = 'normal', col = 2)
hist(y, breaks = seq(0.0, 3.5, 0.5), main = 'exponential', col = 2)
hist(z, nclass = 7, probability = T, main = 'chisq', col = 2)

par(mfrow = c(1, 1))


## - Creating a histogram with a density curve on it - 
x <- rnorm(150)
hist(x, prob = TRUE, main = 'normal', col = 3)
lines(density(x))

# - Boxplots - 
library(UsingR)
?babies
names(babies)
boxplot(babies$wt, ylab = 'birth weight', col = 4)
f <- fivenum(babies$wt)
f
?fivenum

# The text() function places the values of labels= on the graph as specified.
?text
boxplot(babies$wt, ylab = 'birth weight', col = 4)
text(rep(1.3, 5), f, labels = c('min', 'Q1', 'median', 'Q3', 'max'), cex = 0.8)

# Looking for outliers
f <- fivenum(babies$wt)
IQR <- f[4] - f[2]

# What is the identification number of the outlier babies? 
outliers <- babies$id[babies$wt > f[4] + 1.5*IQR | babies$wt < f[2] - 1.5*IQR]
outliers

# What is the weight of the outlier babies?
outliers_wt <- babies$wt[babies$wt > f[4] + 1.5*IQR | babies$wt < f[2] - 1.5*IQR]
outliers_wt

 
# Grouped box plot
smoke.names <- c("never", "yes", "UP", "LA", "NA")
boxplot(babies$wt ~ babies$smoke, col = 2, data = babies, names = smoke.names)


