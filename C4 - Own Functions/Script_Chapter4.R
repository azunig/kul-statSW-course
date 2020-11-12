
# --- Chapter 4: Writing your own functions --- # 

# - Rules to write a function -
## - Make and check body -
a <- 3
b <- 4
c <- sqrt(a^2 + b^2)
c

## - Generalization -
Pythagoras <- function(a,b)
{
  c <- sqrt(a^2 + b^2)
  print(a)
  print(b)
  c  
}

## - Apply - 
Pythagoras(a=1,b=1)
Pythagoras(a=3,b=4)

# Use of the list function in your Pythagoras function 
Pythagoras <- function(a,b)
{
  c <- sqrt(a^2 + b^2)
  list(a=a, b=b, hypothenusa=c)
}
# Apply your function 
Pythagoras(a=1,b=1)
Pythagoras(a=3,b=4)


# - Overview of some useful functions in R -
## - Functions to convert to integers -
x <- -3.526
round(x)
trunc(x)
floor(x)
ceiling(x)

## - Integer operators -
x1 <- 21
x2 <- 5
x1%/%x2
floor(x1/x2)
x1 %% x2
x1-floor(x1/x2)*x2


## - Some common functions -
abs(-3)
log(0.1, base = 10)
sqrt(4)
sin(pi/2)

## - Functions on 1 vector -
vec <- 1:5
length(vec)
sum(vec)
prod(vec)
cumsum(vec)
cumprod(vec)
max(vec)
min(vec)
cummax(vec)
cummin(vec)
range(vec)
sort(vec)
rev(vec)

## - Functions on 2 vectors or more -
pmax(c(1,7,3), c(3,4,5))
max(c(1,7,3), c(3,4,5))

## - Statistical functions -
vec <- 1:5
mean(vec)
var(vec)
sd(vec)

