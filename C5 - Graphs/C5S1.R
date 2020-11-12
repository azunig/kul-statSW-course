library(datasets)
names(airquality)

plot(Ozone~Temp, data = airquality)


plot(airquality$Temp, airquality$Ozone)

plot(Ozone~Temp, data = airquality, main = 'Temp versus Ozone', sub = 'Airquality data', xlab = 'Temperature')

xlim = x(xmin, ymin)
ylim = x(ymin, xmin)  

plot(Ozone~Temp, data = airquality, xlim = c(70,80), ylim = c(0,150))

plot(Ozone ~ Temp, data = airquality, type = 'p', col = 2, pch = 6, lty = 3, cex = 2)


plot(Ozone~Temp, data = airquality, pch = '*', cex = 3, col = 2)
points(65, 100, col = 3, cex = 5)
text(locator(1), 'otro', cex = 1.5)
text(65, 110, 'this is a new point')
#identify()

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


#queri quear legenda 
plot(Ozone~Temp, data = airquality, pch = "*", cex = 3)
legend(locator(1), c('mean ozone', 'Wind', 'regression line Ozone', 'regression line Wind'),
      lty = c(1, 1, 3, 4), col = c(2, 3, 4, 3))




# Multiple plots on same graphical window
par(mfrow = c(1,2))
# Scatterplot and regression line of Ozone versus Temp
plot(Ozone ~ Temp, data = airquality, pch = '*', cex = 3)
result.lm <- lm(Ozone ~ Temp, data = airquality)
abline(result.lm, lty = 3, col = 4, lwd = 5)
# Scatterplot and regression line of Wind versus Temp
plot(Wind ~ Temp, data = airquality, pch = '*', cex = 3)
result2.lm <- lm(Wind ~ Temp, data = airquality)
abline(result2.lm, lty = 4, col = 3, lwd = 5)


###4 Histogram with usual R graphics

  x <- rnorm(50)
  y <- rexp(50, rate = 2)
  range(y)
  
  z <- rchisq(50, 10)
  range(z)
  
  par(mfrow = c(1,3))
  
  hist(x, nclass = 10, main = 'normal', col = 2)
  hist(y, breaks = seq(0.0, 3.5, 0.5), main = 'exponential', col = 2)
  hist(z, nclass = 7, probability = T, main = 'chisq', col = 2)
  
  x <- rnorm(150)
  hist(x, prob = TRUE, main = 'normal', col = 3)
  lines(density(x))

#install.packages("UsingR")
#library(UsingR)
  boxplot(babies$wt, ylab = 'birth weight', col = 4)
  f <- fivenum(babies$wt)

  boxplot(babies$wt, ylab = 'birth weight', col = 4)
  text(rep(1.3, 5), f, labels = c('min', 'Q1', 'median', 'Q3', 'max'), cex = 0.8)

  f <- fivenum(babies$wt)
  IQR <- f[4] - f[2]
# What is the identification number of the outlier babies?
  outliers <- babies$id[babies$wt > f[4] + 1.5*IQR | babies$wt < f[2] - 1.5*IQR]
  outliers

# What is the weight of the outlier babies?
  outliers_wt <- babies$wt[babies$wt > f[4] + 1.5*IQR | babies$wt < f[2] - 1.5*IQR]
  outliers_wt
  
  smoke.names <- c("never", "yes", "UP", "LA", "NA")
  boxplot(babies$wt ~ babies$smoke, col = 2, data = babies, names = smoke.names)

#In the first two exercises, the data tips from the package reshape will be used.
#One waiter recorded information about each tip he received over a period of a few months working in one
#restaurant. He collected several variables:
  #• tip: tip in dollars
  #• total_bill: bill in dollars
  #• sex: sex of the bill payer
  #• smoker: whether there were smokers in the party
  #• day: day of the week
  #• time: time of the day
  #• size: size of the party
#  In all he recorded 244 tips.

#1. Make a simple scatterplot of the tip (Y) versus bill (X). Add a regression line and add a horizontal
#reference line with average tip. Add a legend.

#tips
# Scatterplot and regression line of Ozone versus Temp
plot(tip ~ total_bill, data = tips)
result.lm <- lm(tip ~ total_bill, data = tips)
abline(result.lm, lty = 3, col = 4, lwd = 3)
# ab line average
abline(h = mean(tips$tip), lty = 4, col = 3, lwd = 5)

# make a grouped boxplot of tip by day of the week
boxplot(tips$tip ~ tips$day, ylab = 'tip', col = 4)

#Plotting multiple lines
#This exercise is not using the tips data frame
#Create the graph of the functions sin, cos, and tan in one figure. Plot the functions on the interval
#[−2π, 2π] and separate the graphs by line style (add a legend).
#


own_fun <- function(r_x){
  
  
}
  

x <- seq(−2*pi, 2*pi, length.out=400)
y_sin <- sin(x)

plot(x,y_sin, 
     main="overlaying graphs :'(",
     type = 'p',
     pch = 6,
     col="black")
lines(x,cos(x), col="red")
lines(x,tan(x), col="green", type = 'p')

legend("right", bg = "transparent",
       c("sin","cos", "tan")
)
legend(-3, 0.9, x.cs1, lty = 1:2, col = 12:3,  adj = c(0, 0.6))




##-- Math expressions:  ------------------------------
x <- seq(-pi, pi, len = 65)
plot(x, sin(x), type = "l", col = 2, xlab = expression(phi),
     ylab = expression(f(phi)))
abline(h = -1:1, v = pi/2*(-6:6), col = "gray90")
lines(x, cos(x), col = 3, lty = 2)
ex.cs1 <- expression(plain(sin) * phi,  paste("cos", phi))  # 2 ways
utils::str(legend(-3, .9, ex.cs1, lty = 1:2, plot = FALSE,
                  adj = c(0, 0.6)))  # adj y !

legend(-3, 0.9, ex.cs1, lty = 1:2, col = 2:3,  adj = c(0, 0.6))

require(stats)
x <- rexp(100, rate = .5)
hist(x, main = "Mean and Median of a Skewed Distribution")
abline(v = mean(x),   col = 2, lty = 2, lwd = 2)
abline(v = median(x), col = 3, lty = 3, lwd = 2)
ex12 <- expression(bar(x) == sum(over(x[i], n), i == 1, n),
                   hat(x) == median(x[i], i == 1, n))
utils::str(legend(4.1, 30, ex12, col = 2:3, lty = 2:3, lwd = 2))

## 'Filled' boxes -- for more, see example(plot.factor)
op <- par(bg = "white") # to get an opaque box for the legend
plot(cut(weight, 3) ~ group, data = PlantGrowth, col = NULL,
     density = 16*(1:3))
par(op)

## Using 'ncol' :
x <- 0:64/64
matplot(x, outer(x, 1:7, function(x, k) sin(k * pi * x)),
        type = "o", col = 1:7, ylim = c(-1, 1.5), pch = "*")
op <- par(bg = "antiquewhite1")
legend(0, 1.5, paste("sin(", 1:7, "pi * x)"), col = 1:7, lty = 1:7,
       pch = "*", ncol = 4, cex = 0.8)
legend(.8,1.2, paste("sin(", 1:7, "pi * x)"), col = 1:7, lty = 1:7,
       pch = "*", cex = 0.8)
legend(0, -.1, paste("sin(", 1:4, "pi * x)"), col = 1:4, lty = 1:4,
       ncol = 2, cex = 0.8)
legend(0, -.4, paste("sin(", 5:7, "pi * x)"), col = 4:6,  pch = 24,
       ncol = 2, cex = 1.5, lwd = 2, pt.bg = "pink", pt.cex = 1:3)
par(op)

## point covering line :
y <- sin(3*pi*x)
plot(x, y, type = "l", col = "blue",
     main = "points with bg & legend(*, pt.bg)")
points(x, y, pch = 21, bg = "white")
legend(.4,1, "sin(c x)", pch = 21, pt.bg = "white", lty = 1, col = "blue")

## legends with titles at different locations
plot(x, y, type = "n")
legend("bottomright", "(x,y)", pch=1, title= "bottomright")
legend("bottom",      "(x,y)", pch=1, title= "bottom")
legend("bottomleft",  "(x,y)", pch=1, title= "bottomleft")
legend("left",        "(x,y)", pch=1, title= "left")
legend("topleft",     "(x,y)", pch=1, title= "topleft, inset = .05", inset = .05)
legend("top",         "(x,y)", pch=1, title= "top")
legend("topright",    "(x,y)", pch=1, title= "topright, inset = .02",inset = .02)
legend("right",       "(x,y)", pch=1, title= "right")
legend("center",      "(x,y)", pch=1, title= "center")

# using text.font (and text.col):
op <- par(mfrow = c(2, 2), mar = rep(2.1, 4))
c6 <- terrain.colors(10)[1:6]
for(i in 1:4) {
  plot(1, type = "n", axes = FALSE, ann = FALSE); title(paste("text.font =",i))
  legend("top", legend = LETTERS[1:6], col = c6,
         ncol = 2, cex = 2, lwd = 3, text.font = i, text.col = c6)
}
par(op)

