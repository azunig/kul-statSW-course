
# --- Chapter 1: Introduction and preliminaries ---

# - Manuals -
## - R help -
# To open the help page of the function 'order'
help(mean)
# or
?mean


# - Add-on packages in R -
## - Install package -
# To  install the package 'BayesTree':
install.packages('BayesTree')

## - Load package -
# To load the package 'BayesTree':
library(BayesTree)
# To open the documentation for package 'BayesTree':
library(help = BayesTree)
# or
help(package=BayesTree)

# To load the package 'UsingR':
library(UsingR)
# To open the documentation for package 'UsingR':
help(package = UsingR)


# - Writing scripts -
## - Common exercise -
x <- c(2,4,7,10)
x
y <- c(1,10,11,18)
y
plot(x,y)

# - Working directory -
# To check the working directory
getwd()

# To set the working directory
setwd("C:/Temp")


