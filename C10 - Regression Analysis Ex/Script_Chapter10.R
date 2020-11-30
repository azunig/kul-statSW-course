
# --- Chapter 10: An example of a regression analysis ---

# - Regression analysis with usual R -
par(mfrow=c(1,1))
library(datasets)
names(airquality)
plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)

# Perform a regression analysis
res.lm <- lm(Ozone ~ Temp, data = airquality)
summary(res.lm)
names(res.lm)

plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
abline(res.lm, lty = 5, col = 4, lwd = 4)

# Try polynomial regression
res.lm2 <- lm(Ozone ~ Temp + I(Temp^2), data = airquality)
summary(res.lm2)

# One possibility
plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
# Add regression line
abline(res.lm, lty = 5, col = 4, lwd = 4)
# Add quadratic curve
curve(305.5 - 9.55*x + 0.078*x*x, add = T, col = 3, lwd = 3)
legend(60, 140, legend = c("linear", "quadratic"), lty = c(1,1), col = c(4,3))

# Another possibility
# Step 1
poly <- function(x, coefs)
{
  tot <- 0
  for (i in 1:length(coefs))
  {tot <- tot + coefs[i]*x^{i-1}}
  tot
}
coef(res.lm2)

# Step 2
plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
# Add regression line
abline(res.lm, lty = 5, col = 4, lwd = 4)
# Add quadratic curve
curve(poly(x, coef(res.lm2)), add = TRUE, col = 3, lwd = 3)
legend(60, 140, legend = c('linear', 'quadratic'), lty = c(1,1), col = c(4,3))



