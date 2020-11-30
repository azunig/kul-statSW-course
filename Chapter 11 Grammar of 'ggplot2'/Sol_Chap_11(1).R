
# --- Chapter 11 ---
# --- Solution to exercises ---
library(ggplot2)
library(Hmisc)
library(grid)

# - Exercise 1 -
library(reshape)
names(tips)
?tips
## Question 1: Boxplot of tip by sex of bill payer
tip1 <- ggplot(tips, aes(x=factor(sex),y=tip)) + 
  geom_boxplot(colour="black", fill= "purple")
tip1 + labs(title= "box plot of tip by sex of bill payer")
## Question 2: Matrix of panels by using faceting variable day of the week
tip2 <- tip1 + facet_grid(. ~ day) + labs(title = "faceting on day of the week")
tip2
## Question 3: Scatter plot of tips by total_bill, grouping by smoker
tip3 <- ggplot(tips, aes(total_bill, tip, colour = factor(smoker))) +
  geom_point(size = 4) + 
  scale_color_manual(name="smoker", values=c("No" = "blue","Yes" = "green"))
tip3 + labs(title = "scatter plot of tip by bill, coloured by smoke")
## Question 4: Add two regression lines
tip4 <- tip3 + geom_smooth(method = "lm", se = FALSE, size = 4) + 
  labs(title = "scatter plot of tip by bill, coloured by smoke")
tip4 
## Question 5: Combine tip4 and tip2 in one graphical window
viewp <- viewport(x=0.3, y=0.7, height=0.4, width=0.4 )
tip4
print(tip2, vp=viewp)
## Question 6
hist1 <- ggplot(tips, aes(tip)) + 
  geom_histogram(bins = 25, colour = "green", fill = "green") + theme_bw()
boxplot1 <- ggplot(tips, aes(sex, tip)) + 
  geom_boxplot(fill = "pink") + theme_bw()
scatter1 <- ggplot(tips, aes(total_bill, tip, colour = smoker)) + 
  geom_point(size = 3) + theme_bw()
grid.newpage()
pushViewport(viewport(layout=grid.layout(2,3)))
vplayout <- function(x,y)
{viewport(layout.pos.row=x, layout.pos.col=y)}
print(hist1, vp=vplayout(1,1:3))
print(boxplot1, vp=vplayout(2,3))
print(scatter1, vp=vplayout(2,1:2))
## Question 7
part1 <- ggplot(tips, aes(day, tip)) + geom_point()
part2 <- part1 + stat_summary(fun.data = "mean_cl_normal", size = 1, colour = "blue")
part3 <- part2 + labs(title = "Use of mean and corresponding confidence interval")
part4 <- part3 + theme_bw()
part4



# - Exercise 2 -
library(UsingR)
?galileo
## Question 1: Create scatter plot of Initial height (X) versus horizontal distance (Y )
p <- ggplot(galileo, aes(x=init.h, y=h.d)) 
p1 <- p + geom_point(colour="black",size=3)
## Question 2: Add regression line
p3 <- p1 + geom_smooth(formula= y~x, method="lm", se=F, aes(colour="linear"))
## Question 3: Add quadratic line 
p4 <- p3 + geom_smooth(formula= y~ x +I(x^2), method="lm", se=F, aes(colour="quadratic"))
## Qustion 4
p5 <- p4 + scale_colour_manual(name="Method", values=c("green","blue")) + 
  xlab("initial height") +ylab("horizontal distance")+labs(title="Galileo data")
p5



# - Exercise 3 -
# Generate the x values 
x <- seq(from  =-2*pi, to = 2*pi, by = 0.05)
# Construct the values for sin, cos and tan
sin_x <- sin(x)
cos_x <- cos(x)
tan_x <- tan(x)
# Create a data frame 
geom <- data.frame(x, sin_x, cos_x, tan_x )
# Create the plot
p <- ggplot(geom, aes(x=x, y=sin_x))
p1 <- p + geom_line(aes(colour="sin_x")) + 
  geom_line(aes(y = cos_x, colour = "cos_x")) + 
  geom_line(aes(y = tan_x, colour = "tan_x"))
# Add a title, omit label Y axis, set limits for Y axis
p2 <- p1  + scale_y_continuous(limits = c(-2, +2)) + ylab(" " ) +
  labs(title = "Geometric curves") + labs(colour = "Geometric function")
p2


