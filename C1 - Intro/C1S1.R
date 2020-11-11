
# Package names
packages <- c("ggplot2", "readxl", "dplyr", "tidyr", "pander", "cluster", "abind")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

x <- 5
x
x = 5



x <- c(2,4,7,10)

y <- c(1,10, 11, 18)

plot(x,y)


ls() #: list all objects in the current workspace
rm(list = ls()) #: removes all objects in the current workspace