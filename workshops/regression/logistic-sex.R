## #############################################################################
## logistic-sex.R
##
## Predicts survived as a function of sex using logisitc regression.
## #############################################################################



## =============================================================================
## SEX ALONE
## =============================================================================


## Build The Model -------------------------------------------------------------

## For logistic regression, we are going to use glm
?glm

## Like with the linear regression, we MUST use a formula.
## This formula is survived as a function of sex.
g <- glm( formula=survived~sex, family=binomial, data=train )
summary(g)

## Connection to Odds Ratio ----------------------------------------------------
## Calculated the OR on "died" not "survived"
gd <- glm( formula=died~sex, family=binomial, data=train )
summary(gd)

## Exponentiate the coefficient to calculate the Odds Ratio.
exp(coef(gd))

## Ditto for the confidence intervals.
exp(confint(gd))

## Or do it all at once.
## R uses combinations of simple commands to build complexity.
exp(cbind(coef(gd), confint(gd)))

## Goodness of Fit -------------------------------------------------------------
## But, is this a good model?

## How much did we reduce the deviance?
with(g, null.deviance - deviance)

## How many degrees of freedom did we reduce the data by?
## Yes, you probably know the answer to this question.
with(g, df.null - df.residual)

## Question: is the model a good fit?
## Is this better than the null model?
## Note: This can be misleading.
with(g, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))

## Predict And Save ------------------------------------------------------------
## Use predict() as with the linear model.
survived <- predict(object=g, newdata=test, type="response")
predict  <- cbind(test$passengerid, round(survived))
## YOU NEED TO CHANGE THE file VARIABLE! THIS IS FOR MY LAPTOP.
write.csv(predict, file="/home/andy/sex.csv", row.names=FALSE)


## =============================================================================
## SEX & PCLASS
## =============================================================================

## Who knows why pclass is in as.factor()?

g <- glm( formula=survived~sex+as.factor(pclass), family=binomial, data=train )
summary(g)
    
## Let's get a little fancier.
##
## | Symbol	|                           Use                                   |
## |   +	| separate effects in a formula                                   |
## |   :	| interaction (A:B is interaction of A and B)                     |
## |   *	| main effects plus interactions A*B is equivalent to A + B + A:B |
## |   ^	| crossed                                                         |
## |  %in%	| nested within                                                   |
## |   /	| nested within                                                   |
## |   |	| conditional on; defines separate panels or shingles in lattice  |



## What am I doing here and why?
g <- glm( formula=survived~sex*as.factor(pclass), family=binomial, data=train )
summary(g)

## This reduces our Residual deviance . . . which for today is about as
## far as I want to tear into evaluating a logistic regression model.

## Question: Is the model a good fit?
with(g, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))

## It is a better fit, but remember the difference between p values is NOT
## statistically significant.
