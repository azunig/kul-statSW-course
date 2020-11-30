
# --- Chapter 10 ---
# --- Solution to exercises ---


# - Exercise -
names(reshape::tips)
par(mfrow=c(1,1))
plot(tips$tip ~ tips$total_bill)
res.lm <- lm(tips$tip ~ tips$total_bill)
summary(res.lm)
abline(res.lm, lty=5, col=6, lwd=3)
identify(tips$total_bill,tips$tip, n=2)

