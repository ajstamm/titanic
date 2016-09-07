## #############################################################################
## example-linear.R
##
## Uses Anscombe's Quartet to Introduce Linear Regression in R
##
## #############################################################################



## Load Data -------------------------------------------------------------------
## The Anscombe Quartet is built into R
data(anscombe)
anscombe

## To see other data available in R / R Packages on your machine:
data()



## Many Ways To View An Object -------------------------------------------------
attributes(anscombe)

summary(anscombe)

str(anscombe)

View(anscombe)

head(anscombe)

tail(anscombe)



## Descriptive Statistics ------------------------------------------------------
## It is easy to get the average for each column
## Note: The average is (essentially) identical for each column
colMeans(anscombe)

## It is less easy to get the standard deviation
## Note: The standard deviation is also (essentially) identical
cbind(x1 = sd(anscombe$x1),
      x2 = sd(anscombe$x2),
      x3 = sd(anscombe$x3),
      x4 = sd(anscombe$x4)
      )



## Correlation -----------------------------------------------------------------
## To test for correlation, we just have to declare x and y from a single set.
## You don't have to label the inputs "x =" and "y =", R assumes you will do
## this. I'm putting them in here explicitly for demonstrative purposes.
cor.test(x = anscombe$x1, y = anscombe$y1)



## Visualize -------------------------------------------------------------------
plot(anscombe$x1, anscombe$y1, main="Anscome: Set 1", xlab="x1", ylab="y1")



## Your Turn! ------------------------------------------------------------------
## Are the correlations of Sets 2 - 4 the same?
cor.test()

## What can you learn from:
?cor.test

## Can you reproduce the other scatterplots from Wikipedia?
plot()



## Linear Regression (Set 1) ---------------------------------------------------
## We don't have a x var and a y var any more. We have a var called formula.
## cor.test can have only two inputs. A linear regression can have many.
## R uses the formula syntax y~x (y as explained by x) to handle this
## complexity.
m1 <- lm(formula=anscombe$y1~anscombe$x1)
m1

## See ?formula to learn more about the R formula syntax for multiple regression.


## Many Ways To View An Object -------------------------------------------------
## This time, we can see different ways to see a model.

attributes(m1)

summary(m1)

str(m1)

head(m1)

tail(m1)



## Visualize! ------------------------------------------------------------------
## Same scatterplot as before. This adds the linear model, m1.
plot(anscombe$x1, anscombe$y1, main="Anscome: Set 1 w/ Model in Red", xlab="x1", ylab="y1")
abline(m1, col="red")



## Evaluating The Model - QQ Plot ----------------------------------------------
## It is easy to get a standard QQ Plot of the model.
qqplot(anscombe$x1,anscombe$y1)
abline(m1, col="red")



## Your Turn! ------------------------------------------------------------------
## But R can do more than just a QQ plot to explore a model.
plot(m1)

## If you made other models, take a moment to explore and compare them now.
plot()



## Exporting Graphics ----------------------------------------------------------
## Exports the QQ Plot grapic shown previously for Set 1.
## Exports the file as a PNG file, in the CWD.
png("qq-anscombe-1.png")
qqplot(anscombe$x1, anscombe$y1, main="Anscome: Set 1 w/ Model in Red", xlab="x1", ylab="y1")
abline(m1, col="red")
dev.off()

