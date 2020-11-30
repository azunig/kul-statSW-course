
# --- Chapter 9: Statistical inference for discrete data ---

# - Testing inependence - 
## - Raw data: use table + chisq.test - 
Chol <- read.table(file.choose(), header=TRUE)
head(Chol, n=4)
names(Chol)
tab.chol <- table(Chol$SMOKE, Chol$MORT)
tab.chol

chisq.test(tab.chol)


## - Summary data: use xtabs and chisq.test -
seatbelts <- read.table(file=file.choose(), header=TRUE)
head(seatbelts)

table <- xtabs(seatbelts$n ~ seatbelts$seatbelts + seatbelts$fatal)
table

chisq.test(table)


## - In case of very few observations -
tea <- read.table(file=file.choose(), header=TRUE)
tea 

table <- xtabs(tea$n ~ tea$poured + tea$guess)
table

fisher.test(table)



# - Some other functions for count data -
## - Test for two proportions - 
trial.mort <- c(121, 145)
trial.siz <- c(1584, 1998)
prop.test(trial.mort, trial.siz)


## - Test for one proportion: binom.test -
binom.test(121, 1584, p = 0.08)




