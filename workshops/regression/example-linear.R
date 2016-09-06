## #############################################################################
## example-linear.R
##
## Uses Anscombe's Quartet to Introduce Linear Regression in R
##
## #############################################################################

## Question: R you familiar with Anscombe's Quartet?

## =============================================================================
## Load Data
## =============================================================================

data(anscombe)

## Use View(anscombe) to see the data out of the terminal.
anscombe


## =============================================================================
## Descriptive Statistics
## =============================================================================

## It is easy to get the average for each column.
## Note: The average is essentially the same for all of these.
colMeans(anscombe)

## It is less easy to get the standard deviation.
## Note: The standard deviation is basically the same for each of these.
cbind(x1 = sd(anscombe$x1),
      x2 = sd(anscombe$x2),
      x3 = sd(anscombe$x3),
      x4 = sd(anscombe$x4)
      )

## Are the sets correlated with each other? (Hint: Yes)
cor.test(anscombe$x1, anscombe$y1)
cor.test(anscombe$x2, anscombe$y2)
cor.test(anscombe$x3, anscombe$y3)

## =============================================================================
## Linear Regression (Set 1)
## =============================================================================

## Note the difference between this and cor.test!
m1 <- lm(anscombe$y1~anscombe$x1)

m1

summary(m1)

attributes(m1)

plot(anscombe$x1, anscombe$y1)
abline(m1, col="red")
lines(lowess(anscombe$x1, anscombe$y1), col="blue")

qqplot(anscombe$x1,anscombe$y1)
abline(m1, col="red")


## =============================================================================
## Linear Regression (Set 2)
## =============================================================================


## What do you see?



## =============================================================================
## Linear Regression (Set 3)
## =============================================================================


## What do you see?



## =============================================================================
## Linear Regression (Set 4)
## =============================================================================


## What do you see?
