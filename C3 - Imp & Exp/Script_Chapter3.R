
# --- Chapter 3 --- # 

# - Importing an Excel file using R function -
install.packages("readxl")
library(readxl)

# Change in the next code line the given directory to directory where you saved the file titanic.xlsx!
titanic2 <- read_excel("N:/acarbonez/R/Scripts_data/titanic.xlsx") 
head(titanic2, n = 6)

# - Export a data frame to a xlsx file -
library(datasets)
head(airquality, n = 6)

install.packages("openxlsx")
library(openxlsx)
write.xlsx(airquality, file = "AirData.xlsx")

# - Importing a txt file using the  read.table() function -
chol <- read.table(file = file.choose(), header = TRUE)
# Complete in the next code line the ... in the directory to specify the location where you want to save the file
chol2 <- read.table(file = "C:/Users/.../chol_R.txt", header = TRUE) 

# - Export a data frame to a .txt file -
write.table(chol, file = file.choose(), quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)
# Complete in the next code line the ... in the directory to specify the location where you want to save the file
write.table(chol,
            file = "C:/Users/.../chol_out.txt",
            quote = FALSE,
            sep = " ",
            row.names = FALSE,
            col.names = TRUE)

# Use getwd() to see what is your working directory
getwd()

