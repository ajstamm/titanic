## #############################################################################
## example-linear.R
##
## Semi-serious linear model, just to introduce lm()
## #############################################################################

## Question: Is age correlated with class?

## =============================================================================
## Graphical Approach
## =============================================================================

## A SIMPLE plot.
plot(train$pclass, train$age)

## Hmmmm. Maybe . . . .
plot( density( train$age[train$pclass==1], na.rm=TRUE ),
      main = "Age For First Class Passengers"
     )

plot( density( train$age[train$pclass==2], na.rm=TRUE ),
      main = "Age For Second Class Passengers"
     )

plot( density( train$age[train$pclass==3], na.rm=TRUE ),
      main = "Age For Third Class Passengers"
     )

## What could be causing the difference in shape?


## =============================================================================
## Correlation
## =============================================================================

## We can't have any NAs. So, we need to know how many we have.
sum( is.na(train$age) )
sum( is.na(train$pclass) )

x <- train[!is.na(train$age), ]

dim(train)
dim(x)

with(x, cor.test(age, pclass) )

## Yep. Correlated.


## =============================================================================
## Linear Model (lm)
## =============================================================================

l <- with(x, lm(formula=age~pclass) )
summary(l)

## Before we go any further, we need to discuss the formula.

plot(train$pclass, train$age)
abline(l, color="red")

## So yes. There is a correlation. It is statistically significant.
## You have now done a linear regression.
