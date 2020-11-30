
# --- Chapter 9 ---
# --- Solution to exercises ---


# - Exercise 1 -
# Import operations.txt
operations  <- read.table(file=file.choose(), header=TRUE)
names(operations)
tab_oper <- xtabs(operations$n ~ operations$operation + operations$side_effect)
tab_oper
chisq.test(tab_oper)

# - Exercise 2: tips data (reshape package) -
library(reshape)
names(tips)
tabel <- table(tips$day, tips$sex)
tabel
chisq.test(tabel)

