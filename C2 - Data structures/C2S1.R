#vectors 
vec <- c(5,8,4.6,21)

(vec <- c(5,8,4.6,21))

#1 vector 

x <- rnorm(10)
z <- order(x)

sort(x)
sort(x,decreasing = F)

rev(sort(x))

sort(x,decreasing = T)

y <- c(1,3,8,3,7,21)

unique(y)
diff(y, lag = 2)

y <- 1:8
x <- 20:1
z <- seq(from= -2, to = 5, by = 0.5)
u <- rep(2:5,2)
v <- rep(1:10,1:10)


#2 logical vectors

x <- c(9,10,8,5,9)
y <- x < 9

T + T
T - F

x <- rnorm(100)
y <- x>0

sum(y)


#2 character vectors
test <- c("Leuven Statistics Research Centre", "2020-2021")
test

x <- c("start","student")
nchar(x)

paste(c("X", "Y"), 1:4, sep = "")


x <- c("start","student")
substring(x, 1, 3)

vector <- c(TRUE, -6.05, "Leuven")
str(vector)

y <- c(1,2,3, NA)
is.na(y)


z <- c("Ward", "Wouter", "Lucas", NA)
!is.na(z)


x <- c(5,3,8,NA,6)
is.na(x>5)


# Subset of a vector

y <- c(33, 55, 4, 22, 89)
y[c(2,3)]

y[-5]

y[y>30]


# elementos of a vector

y<-c(33,55,4,22,89)
names(y) <- 1:5
y

## FACTORS

directions <- c("North","East", "South", "South")
directions

directions.f <- as.factor(directions)
directions.f



status <- factor(c("Medium", "Low", "High", "Medium", "Medium", "High"),
                 levels = c("Low", "Medium", "High"),
                 labels = c("Lo", "Me", "Hi"))

## MATRIX

x<- matrix(1:8,nrow = 2, ncol = 4, byrow = FALSE)

  
attributes(x)  

x <- rbind(1:4,5:8)
  
dim(x)
dimnames(x)  
attributes(x)  
dimnames(x) <- list(paste("row", 1:2), paste("col", LETTERS[1:4]))
paste("row", 1:2)  
  
paste("col", LETTERS[1:4])

x <- rbind(1:4, 5:8) # Creating matrix
dimnames(x) <- list(paste("row", 1:2), paste("col", LETTERS[1:4]))


x <- matrix(1:4, nrow = 2)

nrow(x)
ncol(x)


x*x

x/x

x^x

x%*%x

y <- c(1,5)


y%*%x%*%y #--> what the fuck?

z <- rbind(x, y)


z <- cbind(x, y)


a <- rbind(1:4, 5:8)
b <- cbind(1:4, 5:8)
a%*%b # Matrix multiplication


# Sub set matrix 

x <- matrix(1:100, ncol = 5)

x[8:12, 3:4]

x[2,]

x[,2]


# DATAFRAME

employee <- c("John", "Peter", "Sylvie") # Data type = character
salary <- c(21000, 23400, 26800) # Data type = numeric

employ.df <- data.frame(employee, salary) 
employ.df

new.df <- data.frame(employee = "Katrien", salary = 25000)
employ2 <- rbind(employ.df, new.df)
head(employ2)



age <- c(40, 23, 31)
employ3 <- cbind(employ2, age)
head(employ3)

age <- c(40, 23, 31, NA)
employ3 <- cbind(employ2, age)
head(employ3)


authors <- data.frame(
  ## I(*) : use character columns of names to get sensible sort order
     surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
 nationality = c("US", "Australia", "US", "UK", "Australia"),
    deceased = c("yes", rep("no", 4)))
books <- data.frame(
        name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
       title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
other.author = c(NA, "Ripley", NA, NA, NA, NA,
                   "Venables & Smith"))


m1 <- merge(authors, books, by.x = "surname", by.y = "name") 

m2 <- merge(books, authors, by.x = "name", by.y = "surname")
m2

#4.2 Taking a subset from a data frame

sub1 <- authors[1:3, 1:1]
sub1

sub2 <- authors$nationality
sub2


?airquality
library(doBy)
install.packages("doBy")

sort_air <- doBy::orderBy(~Month + Temp, data = airquality)
head(sort_air)





employee <- c("John", "Peter", "Sylvie") # creation of a character vector
salary <- c(21000, 23400, 26800) # creation of a numeric vector
employ.df <- data.frame(employee, salary) # creation of a data frame
y <- letters[1:5] # creation of a character vector
z <- 1:3 # creation of a numeric vector
list(employ.df, y, z)



mixlist <- list(logica = c(T, T, T, F),
                plant = c("tree", "bush", "grass"),
                comment = "these components are unrelated")
mixlist

attributes(mixlist)

mixlist$plant

mixlist[[2]]

mixlist[2]

#homework
#a
vector_a  <- 1:100
#b
vector_b  <- seq(from= 0, to = 500, by = 5)
#c
z1 <- rep(1:50,each = 3)
#d
z2 <- rep(1:10,1:10)
#e
z3 <- rep(1:50, rep(c(1,2),25))
  
##################

#6.3 Matrix creation
#a. Create a vector with 100 random normal numbers and use that to generate a 10 by 10 matrix. Call this matrix mat1.
#Hint: to generate a random normal vector, use the function rnorm().
mat1 <- matrix(rnorm(100), ncol = 10, nrow = 10)

#b. Add an extra row to mat1 with the numbers 1 to 10 which will be the new first row. 
#   Also add the row with numbers 10 to 1 which will be the last row.
mat1 <- rbind(1:10,matrix(rnorm(100), ncol = 10, nrow = 10))

#c. Add an extra column to the matrix obtained in step b with the number 1 to 12 (as first column)
mat1 <- cbind(seq(from= 1, to = 12, by = 12), matrix(rnorm(100), ncol = 10, nrow = 10))

##################

library(reshape)

force(tips)
#tips (reshape package) One waiter recorded information about each tip he received over a period of a few
#months working in one restaurant. He collected several variables:
  #• tip in dollars
  #• bill in dollars
  #• sex of the bill payer
  #• whether there were smokers in the party
  #• day of the week
  #• time of the day
  #• size of the party
#In all he recorded 244 tips.
  #a. Install and load the package reshape.
  #b. Check the data description of this data frame.
  #c. Ask for the names of the variables in this data frame.
  #d. Take a subset of data tips which contains the observations from 1 until 20 and only the variables tip, sex and day.

summary(tips)

tips[1:20, c("tip","sex","day")]
