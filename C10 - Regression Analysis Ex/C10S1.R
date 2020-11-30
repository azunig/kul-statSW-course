#summary()
#plot()
#coef()
#residuals()
#fitted()
#deviance()
#predict()
#anova()
#AIC()


plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)


res.lm <- lm(Ozone ~ Temp, data = airquality)
summary(res.lm)


names(res.lm)


plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
abline(res.lm, lty = 5, col = 4, lwd = 4)


plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
abline(res.lm, lty = 5, col = 4, lwd = 4)



res.lm2 <- lm(Ozone ~ Temp + I(Temp^2), data = airquality)
summary(res.lm2)

# One possibility
plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
# Add regression line
abline(res.lm, lty = 5, col = 4, lwd = 4)
# Add quadratic curve
curve(305.5 - 9.55*x + 0.078*x*x, add = T, col = 3, lwd = 3)
legend(60, 140, legend = c("linear", "quadratic"), lty = c(1,1), col = c(4,3))



poly <- function(x, coefs)
{
  tot <- 0
  for (i in 1:length(coefs))
  {tot <- tot + coefs[i]*x^{i-1}}
  tot
}

coef(res.lm2)



# One possibility
plot(Ozone ~ Temp, data = airquality, pch = "*", cex = 3)
# Add regression line
abline(res.lm, lty = 5, col = 4, lwd = 4)
curve(poly(x, coef(res.lm2)), add = TRUE, col = 3, lwd = 3)
legend(60, 140, legend = c('linear', 'quadratic'), lty = c(1,1), col = c(4,3))




res.mine <- lm(tip ~ total_bill, data = reshape::tips)
plot(tip ~ total_bill, data = reshape::tips, pch = "*", cex = 3)
abline(res.mine, lty = 5, col = 4, lwd = 4)
#plot(total_bill ~ tip, data = reshape::tips, pch = "*", cex = 3)




