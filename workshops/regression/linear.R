## #############################################################################
## example-linear.R
##
## Uses Anscombe's Quartet to Introduce Linear Regression in R
##
## #############################################################################


## Many Data Sets --------------------------------------------------------------
## R comes with several classic data sets which are useful for learning how
## to write R script.
## Most R packages also come with an example data set (or several).
## Right now we want to use Anscombe's Quartet.
data()



## Load Data -------------------------------------------------------------------
## Anscombe's Quartet is built into R.
## This loads the data into the current session and displays it in-line.
## It is a small data set, so this shouldn't be overwhelming.
data(anscombe)
anscombe



## Many Ways To View An Object -------------------------------------------------
attributes(anscombe)

summary(anscombe)

str(anscombe)

View(anscombe)

head(anscombe)

tail(anscombe)



## Descriptive Statistics ------------------------------------------------------
## It is easy to get the average for each column
## Note: The x columns are nearly identical. Ditto for the y columns.
colMeans(anscombe)

## It is less easy to get the standard deviation
## Note: It is also (essentially) identical
cbind(x1 = sd(anscombe$x1),
      x2 = sd(anscombe$x2),
      x3 = sd(anscombe$x3),
      x4 = sd(anscombe$x4)
     )



## Your Turn! ------------------------------------------------------------------
## Can you calculate the standard deviation for the y columns?
cbind(x1 = sd(),
      x2 = sd(),
      x3 = sd(),
      x4 = sd()
     )



## Correlation: Set 1 ----------------------------------------------------------
## To test for correlation, we must use an x and y from a single set.
## You don't have to label the inputs "x =" and "y =", R assumes you will do
## this. They are shown here explicitly for demonstrative purposes.
cor.test(x=anscombe$x1, y=anscombe$y1)



## Scatterplot: Set 1 ----------------------------------------------------------
plot(anscombe$x1, anscombe$y1, main="Anscombe: Set 1", xlab="x1", ylab="y1")



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
m1 <- lm(formula=y1~x1, data=anscombe)
m1

## To learn more about the R formula syntax for multiple regression: ?formula


## Many Ways To View An Object -------------------------------------------------
## This time, we can see different ways to see a model.

attributes(m1)

summary(m1)

str(m1)

head(m1)

tail(m1)



## Many Ways To View An Object -------------------------------------------------
## Because we are modeling only a single variable, the t-statistic, p-value, 
## and degrees of freedom are EXACTLY the same as our correlation above.
summary(m1)



## Many Ways To View An Object -------------------------------------------------
attributes(m1)



## Many Ways To View An Object -------------------------------------------------
attributes(summary(m1))



## Many Ways To View An Object -------------------------------------------------
summary(m1)$coefficients



## Many Ways To View An Object -------------------------------------------------
coef(summary(m1))



## Visualize: Set 1 ------------------------------------------------------------
## Same scatterplot, adds the linear model.
plot(anscombe$x1, anscombe$y1, main="Anscombe: Set 1 w/ Model in Red", xlab="x1", ylab="y1")
abline(m1, col="red")



## Exporting Graphics ----------------------------------------------------------
## Exports the QQ Plot grapic shown previously for Set 1.
## Exports the file as a PNG file, in the CWD.
png("qq-anscombe-1.png")
qqplot(anscombe$x1, anscombe$y1, main="Anscombe: Set 1 w/ Model in Red", xlab="x1", ylab="y1")
abline(m1, col="red")
dev.off()



## Evaluating The Model - QQ Plot ----------------------------------------------
## It is easy to get a standard QQ Plot of the model.
qqplot(anscombe$x1,anscombe$y1)
abline(m1, col="red")



## Your Turn! ------------------------------------------------------------------
## But R can do more than just a QQ plot to explore a model.
plot(m1)

## If you made other models, take a moment to explore and compare them now.
plot()



## Prediction ------------------------------------------------------------------
## Our model is: y = .5001x + 3.0001
## How do we calculate y when x is 10?
y <- 10 * .5001 + 3.0001

## But is there an easier way? (Of course there is.)



## Prediction ------------------------------------------------------------------
## It is easy to use predict to automate this and do it quickly.
## Create a new data.frame with the SAME column names.
## The dependent variable must be NA.
## It is easy to 
p1 <- data.frame(x1=anscombe$x1+30, y1=NA)
p1$y1 <- predict(object=m1, newdata=p1)



## Let's Look At Our Predictions -----------------------------------------------
plot(rbind(anscombe[,c(1,5)], p1))
abline(m1, col="red")



## Prediction Gotcha -----------------------------------------------------------
## These produce the "same" model.
## Only the second can be easily used in a prediction.
## Look at the different models produced.
## Do you remember how to view the model?
mGood <- lm(formula=y1~x1, data=anscombe)
mBad <- lm(formula=anscombe$y1~anscombe$x1)
