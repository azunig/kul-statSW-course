#install.packages("readxl")
library(readxl)

titanic2 <- read_excel("~/GitHub/kul-software-course/kul-statSW-course/C3 - Imp & Exp/titanic.xlsx")
head(titanic2, n = 6)
head(airquality, n = 6)

#install.packages("openxlsx")
library(openxlsx)
write.xlsx(airquality, file ="~/GitHub/kul-software-course/kul-statSW-course/C3 - Imp & Exp/AirData.xlsx")


chol <- read.table(file = file.choose(), header = TRUE)
chol2 <- read.table(file = "~/GitHub/kul-software-course/kul-statSW-course/C3 - Imp & Exp/chol_R.txt", header = TRUE)

write.table(chol, file = file.choose(), quote = FALSE,
            sep = " ", row.names = FALSE, col.names = TRUE)