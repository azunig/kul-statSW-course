
# --- Chapter 11: Grammar of ggplot2 ---

# - Introduction -
## - What is ggplot2? -
install.packages("ggplot2")
library(ggplot2)


## - Documentation -
?ggplot2


## - Grammar -
# import fish.xlsx
names(fish)
ggplot(fish, aes(elv, log(hg))) + geom_point() + stat_smooth()



# - Build a plot layer by layer by ggplot() -
## - ggplot() -
## - Data and mapping -
pl1 <- ggplot(fish, aes(x = elv, y = log(hg), colour = factor(dam)))
pl1


## - Layer Geoms -
# Scatterplot
pl2 <- pl1 + geom_point()
pl2

# Histogram
pl3 <- ggplot(fish, aes(log(hg))) + geom_histogram(bins = 40, colour = "black", fill = "green")
pl3

# Bar chart
pl4 <- ggplot(fish, aes(lt)) + geom_bar(colour = "black", fill = "green")
pl4

# Boxplot
pl5 <- ggplot(fish, aes(x = factor(dam), y = log(hg))) + 
  geom_boxplot(colour = "black", fill = "blue")
pl5

# Line
ggplot(fish, aes(x = elv, y = log(hg))) + geom_point(colour = "blue") + 
  geom_line(colour = "black")

# Smooth trend line
pl6 <- ggplot(fish, aes(x = elv, y = log(hg))) + geom_point(colour = "blue") + 
  geom_smooth(colour = "black")
pl6

pl7 <- ggplot(fish, aes(x = elv, y = log(hg))) + geom_point(colour = "blue") + 
  geom_smooth(colour = "black", method = "lm")
pl7

# Remarks
# In case you want to see the prediction interval instead of confidence interval
# Fit a linear model
m.lm <- lm(log(hg) ~ elv, data = fish)
# cbind the predictions to fish
fish.pred <- cbind(fish, predict(m.lm, interval = "predict"))
names(fish.pred)
# Make now the plot
# remark that not all aesthetics are defined beforehand
pl7a <- ggplot(fish.pred, aes(x = elv)) + 
  geom_point(aes(y = log(hg))) +
  geom_line(aes(y = fit), colour = "blue", size = 1)
pl7b <- pl7a + geom_ribbon(aes(ymin = lwr, ymax = upr), fill = "blue", alpha = 0.1)
pl7b
?geom_ribbon

# Use of multiple data frames in same ggplot
m.lm <- lm(log(hg) ~ elv, data = fish) 
pred_fish <- cbind(elv = fish$elv, data.frame(predict(m.lm, interval = "prediction")))
names(pred_fish)
pl7d <- ggplot() + geom_point(data = fish, aes(x = elv, y = log(hg)))
pl7e <- pl7d + geom_line(data = pred_fish, aes(x = elv, y = fit), colour = "blue", size = 1)
pl7f <- pl7e + geom_ribbon(data = pred_fish, aes(x = elv, ymin = lwr, ymax = upr), 
                           fill = "blue", alpha = 0.4)
pl7f


ggplot(fish, aes(x = elv, y = log(hg))) + geom_point(colour = "blue") +
  geom_smooth(colour = "black", formula = y ~ x + I(x^2), method = "lm")



## - Layer Stat -
# Smooth line
ggplot(fish, aes(elv, log(hg))) + geom_point() + stat_smooth()

# Regression line
ggplot(fish, aes(elv, log(hg))) + geom_point() + stat_smooth(method = 'lm')

# Boxplot
ggplot(fish, aes(x = factor(dam), y = log(hg))) + 
  geom_point(colour = "black") + stat_boxplot(colour = "black", fill = "blue")



## - Layer Facet -
# facet_grid
fac1 <- ggplot(fish, aes(elv, log(hg))) + geom_point() + geom_smooth(colour = "red", method = "lm")
fac1

fac2 <- fac1 + facet_grid(. ~ dam) + labs(title = ".~dam")
fac2

fac3 <- fac1 + facet_grid(lt ~ .) + labs(title = "lt~.")
fac3

fac4 <-  fac1 + facet_grid(lt ~ dam) +  labs(title = "lt~dam")
fac4

fac5 <-  fac1 + facet_grid(lt ~ dam, margins = T) + labs(title = "lt~dam, margins=T")
fac5

# facet_wrap
fac1 <- ggplot(fish, aes(elv, log(hg))) + geom_point() + geom_smooth(colour = "red", method = "lm")
fac1 

fac2 <- fac1 + facet_wrap(~ lt + dam) + labs(title = "facet_wrap")
fac2

# Difference between faceting and grouping
# Add regression line 
ggplot(fish, aes(elv, log(hg), colour = factor(dam), shape = factor(lt))) + 
  geom_point(size = 3) + geom_smooth(method = "lm", se = FALSE)

# Faceting by continuous variables
# Color points by values of  continuous variable 
ggplot(fish, aes(elv, log(hg), colour = z)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE)
# Convert the continuous variable into a variable with discrete categories
fish$z_cat1 <- cut_interval(fish$z, n=3)
# Or you can use
fish$z_cat2 <- cut_number(fish$z, n=3)
xtabs(~ fish$z_cat1)
xtabs(~ fish$z_cat2)
# We now can use this variable for faceting
fac1 <- ggplot(fish, aes(elv, log(hg))) + geom_point() + 
  geom_smooth(colour = "red", method = "lm")
fac2 <- fac1 + facet_wrap(~ z_cat1) + labs(title = "by z_cat1")
fac2 
fac3 <- fac1 + facet_wrap(~ z_cat2) + labs(title = "by z_cat2")
fac3



# - Extras -
## - Themes -
fac1 <- ggplot(fish, aes(elv, log(hg))) + geom_point() + geom_smooth(colour = "red", method = "lm")
fac1 
# You can override the theme for a single plot
fac2 <- fac1 + theme_bw()
fac2
# Affecting all plots
previous_theme <- theme_set(theme_bw())
fac1
theme_set(theme())

## - Multiple plots on the same page -
plot1 <- ggplot(fish, aes(elv,log(hg))) + geom_point()
plot2 <- ggplot(fish, aes(log(hg))) + geom_histogram(binwidth = 0.1, 
                                                     colour = "red", fill = "red" )
plot3 <- ggplot(fish, aes(factor(lt),log(hg))) +geom_boxplot(colour = "blue", fill = "blue" )

# Create viewports
install.packages("grid")
library(grid)
vp1 <- viewport(width = 1, height = 1, x = 0.5, y = 0.5)
vp2 <- viewport(width = 0.5, height = 0.5, x = 0.5, y = 0.5)
vp3 <- viewport(x = 0.9, y = 0.9, height = 0.8, width = 0.8)
vp4 <- viewport(x = 0.8, y = 0.1, height = 0.4, width = 0.4)

# Make a plot with a smaller subplot
plot1
print(plot2, vp = vp3)
plot1
print(plot3, vp = vp4)

# Use rectangular grids
grid.newpage()
pushViewport(viewport(layout=grid.layout(2,2)))
vplayout <- function(x,y){
  viewport(layout.pos.row=x, layout.pos.col=y)}
print(plot1, vp=vplayout(1,1:2))
print(plot2, vp=vplayout(2,1))
print(plot3, vp=vplayout(2,2))


## - Save your output -
plot1 <- qplot(elv, log(hg), data = fish, geom = c("point"))
# Save your output to a pdf file
ggsave(file = "output1.pdf", plot = plot1)
dev.off()
# Save your output to a ps file
ggsave(file = "output2.ps", plot = plot1)


# - Applications -
## - Profile plots for visualizing longitudinal data -
install.packages("nlme")
library(nlme)
?Oxboys
head(Oxboys, n = 12)

pl1 <- ggplot(Oxboys, aes(age, height, group = Subject))
pl2 <- pl1 + geom_line() + labs(title = "Individual profile plot")
pl2
pl3 <- pl2 + geom_smooth(method = "lm", size = 1.2) + labs(title = "smoothed line for every boy")
pl3
pl4 <- pl2 + geom_smooth(aes(group = 1), method = "lm", size = 2) + labs(title = "individual profile + common trend")
pl4

pl1 <- ggplot(Oxboys, aes(Occasion, height))
pl2 <- pl1 + geom_boxplot(colour = "blue") + labs(title = "boxplot of height vs occasion")
pl2
pl3 <- pl2 + geom_line(aes(group = Subject), colour = "red")
pl3


## - Create frequency histogram with density curve -
pl1 <- ggplot(fish, aes(log(hg)))
pl2 <- pl1 + geom_histogram(binwidth = 0.1) + labs(title = "frequency histogram")
pl2
pl3 <- pl1 + geom_histogram(aes(y = ..density..), binwidth = 0.1) + labs(title = "rel. frequency histogram")
pl3
pl4 <- pl3 + geom_density(colour = "red", size = 1.2) + labs(title = "+density curve")
pl4


## - Visualize multiple variables on same plot -
library(ggplot2)
?economics
head(economics, 10)

# Overlaying  lines 
ts1 <- ggplot(economics, aes(date))
ts2 <- ts1 + geom_line(aes(y=psavert, colour="psavert"))  + geom_line(aes(y=uempmed, colour="uempmed"))

# To omit the labeling of the Y axis
ts3 <-  ts2 + ylab(" ")

# To adapt the coloring of the lines + add nice heading to the legend
ts4 <- ts3 + scale_color_manual(name="Variable", values=c("green","blue"))
ts4



# - Adding statistical summaries -
## - Individual summary functions -
install.packages("Hmisc")
library(Hmisc)

pl1 <- ggplot(fish, aes(factor(lt), log(hg)))
pl2 <- pl1 + geom_point()
pl3 <- pl2 + stat_summary(fun = "mean", geom = "point", size = 5, colour = "red")
pl4 <- pl3 + labs(title = "use of mean function")
pl4


## - Single summary functions -
pl1 <- ggplot(fish, aes(factor(lt), log(hg)))
pl2 <- pl1 + geom_point()
pl5 <- pl2 + stat_summary(fun.data = "mean_cl_normal", colour = "red", size = 1.5)
pl6 <- pl5 + labs(title = "use of mean_cl_normal function")
pl6

quant <- function(x)
{ q1 <- quantile(x, 0.25)
q2 <- quantile(x, 0.50)
q3 <- quantile(x, 0.75)
qs <- c(q1, q2, q3)
names(qs) <- c("ymin", "y", "ymax")
qs}
quant(fish$hg)

pl7 <- pl2 + stat_summary(fun.data = "quant", colour = "red", size = 1.5)
pl7 + labs(title = "use of own created function")



# - Animated graph -
library(gganimate)
library(gifski)
g1 <- ggplot(fish, aes(elv, log(hg))) + geom_point(aes(colour = factor(dam)), size = 3)
g1
animo1 <- g1 + transition_states(factor(dam))
animo2 <- animo1 + enter_fade() + exit_shrink()
animo2




