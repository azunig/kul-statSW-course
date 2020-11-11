
# --- Chapter 2: Data structures ---

# - Vectors -
vec <- c(5, 8, 4.6, 21)
vec
(vec <- c(5, 8, 4.6, 21))

## - Vector arithmetic -
x <- rnorm(10)
x

z <- order(x)
z
sort(x)
sort(x, decreasing = FALSE)
rev(sort(x))
sort(x, decreasing = TRUE)

y <- c(1, 3, 8, 3, 7, 21)
unique(y)
diff(y, lag = 2)

y <- 1:8
y
x <- 20:1
z <- seq(from = -2, to = 5, by = 0.5)
z

u <- rep(2:5,2)
u
v <- rep(2:5, 2:5)
v

## - Logical vectors -
x <- c(9, 10, 8, 5, 9) # numerical vector
y <- x<9 # logical vector
y

T + T
T - F
x <- rnorm(100)
y <- x>0
y
sum(y)

## - Character vectors -
test <- c("Leuven Statistics Research Centre", "2020-2021")
test

x <- c("start", "student")
nchar(x)

paste(c("X", "Y"), 1:4, sep=" ")

x <- c("start", "student")
substring(x, 1, 3)


## - Coercing -
vector <- c(TRUE, -6.05, "Leuven")
vector


## - Missing values -
y <- c(1, 2, 3, NA)
is.na(y)

z <- c("Ward", "Wouter", "Lucas", NA)
!is.na(z)

x <- c(5, 3, 8, NA, 6)
is.na(x>5)


## - Subset of a vector -
y <- c(33, 55, 4, 22, 89)
y[c(2,3)]
y[-5]
y[y > 30]

x <- c(5, 9, NA)
y <- x[!is.na(x)]
y

## - Give a name to each element of the vector -
y <- c(33, 55, 4, 22, 89)
names(y) <- 1:5
y


# - Factors -
directions <- c("North", "East", "South", "South") # This is a character vector
directions

directions.f <- as.factor(directions) # This is a factor
directions.f

status <- factor(c("Medium", "Low", "High", "Medium", "Medium", "High"),
                 levels = c("Low", "Medium", "High"),
                 labels = c("Lo", "Me", "Hi"))
status



# - Matrices -

## - Creating a matrix in R -
x <- matrix(1:8, nrow = 2, ncol = 4, byrow = FALSE)
x
attributes(x)

x <- rbind(1:4, 5:8)
x
dim(x)
dimnames(x)
attributes(x)

x <- cbind(1:4, 5:8)
x

## - Adding labels -
paste("row", 1:2)
paste("col", LETTERS[1:4])

x <- rbind(1:4, 5:8) # Creating matrix 
dimnames(x) <- list(paste("row", 1:2), paste("col", LETTERS[1:4])) # Adding labels
x

## - Calculations on matrices -
x <- matrix(1:4, nrow = 2) # Creating a matrix x
x
nrow(x) # Returns number of rows present in x
ncol(x) # Returns number of columns present in x
x+x
x*x # Elementwise product
x/x # Elementwise division
x^2
x%*%x # Matrix product

y <- c(1,5)
y

y%*%x%*%y

z <- rbind(x, y)
z
z <- cbind(x, y)
z

a <- rbind(1:4, 5:8)
b <- cbind(1:4, 5:8)
a%*%b # Matrix multiplication



# - Data frame -
## - Creating a data frame -

employee <- c("John", "Peter", "Sylvie") # Data type = character
salary <- c(21000, 23400, 26800) # Data type = numeric

employ.df <- data.frame(employee, salary) #Creation of a data frame with two columns. 
#These columns have a different data type.
employ.df

new.df <- data.frame(employee = "Katrien", salary = 25000)
employ2 <- rbind(employ.df, new.df)
head(employ2)

age <- c(40, 23, 31)
employ3 <- cbind(employ2, age)
head(employ3) # This returns an error

age <- c(40, 23, 31, NA) #Note the extra element in this vector (i.e. NA) which is 
#crucial, otherwise an error is generated. 
employ3 <- cbind(employ2, age)
head(employ3)

authors <- data.frame(
         surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
         nationality = c("US", "Australia", "US", "UK", "Australia"),
         deceased = c("yes", rep("no", 4)))

books <- data.frame(
         name = c("Tukey", "Venables", "Tierney",
                  "Ripley", "Ripley", "McNeil", "R Core"),
         title = c("Exploratory Data Analysis",
                   "Modern Applied Statistics ...",
                   "LISP-STAT",
                   "Spatial Statistics", "Stochastic Simulation",
                   "Interactive Data Analysis",
                   "An Introduction to R"),
         other.author = c(NA, "Ripley", NA, NA, NA, NA,
                          "Venables & Smith"))

m1 <- merge(authors, books, by.x = "surname", by.y = "name") 
# by.x and by.y specify the columns used for merging
m1

m2 <- merge(books, authors, by.x = "name", by.y = "surname")
m2

## Taking a subset from a data frame
sub1 <- authors[1:3, 1:2]
sub1

sub2 <- authors$nationality
sub2

library(datasets)
?airquality
#airquality is a dataframe from package datasets

sort_air <- orderBy(~Month + Temp, data = airquality)


# - List -
## - Creating a list -
employee <- c("John", "Peter", "Sylvie") # creation of a character vector
salary <- c(21000, 23400, 26800) # creation of a numeric vector
employ.df <- data.frame(employee, salary) # creation of a data frame
y <- letters[1:5] # creation of a character vector
z <- 1:3 # creation of a numeric vector
list(employ.df, y, z)

## - Named list -
mixlist <- list(logica = c(T, T, T, F),
                plant = c("tree", "bush", "grass"),
                comment = "these components are unrelated")
mixlist
attributes(mixlist)

## - Accessing elements of a list -
mixlist$plant # Returns a character vector
mixlist[[2]] # Returns a character vector
mixlist[2] # Returns a list


