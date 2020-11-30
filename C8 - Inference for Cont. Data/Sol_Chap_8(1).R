
# --- Chapter 8 ---
# --- Solution to exercises ---


# - Exercise 1 -
# import chol.txt as chol2
names(chol2)
## Question a
?ifelse
chol2$group <- ifelse(chol2$SMOKE=='nonsmo','nonsmoke','smoke')
head(chol2)

## Question b
boxplot(chol2$CHOL ~ chol2$group,col=4)


# - Exercise 2 -
# Generate a histogram of cholesterol values for smokers
# and a histogram of cholesterol values for non-smokers
chol_smoke <- chol2[chol2$group=='smoke' ,'CHOL']
chol_non <- chol2[chol2$group=='nonsmoke','CHOL']

par(mfrow=c(1,2))
hist(chol_smoke, col=5)
hist(chol_non, col=23)


# - Exercise 3 -
# Check normality
length(chol_smoke)
length(chol_non)
# Sample size is large enough (49 and 151) hence CLT can be used

# Test equality of variances
var.test(chol2$CHOL ~ chol2$group)

# test equality of average cholesterol value in both groups
# when assuming unequal variances
t.test(chol2$CHOL ~ chol2$group, var.equal = FALSE)

