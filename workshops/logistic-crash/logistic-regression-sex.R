## #############################################################################
## logistic-regression-sex.R
##
## A SIMPLE logistic regression, predicting survived as a function of sex.
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

## This isn't a great model, but it is better than our first couple of models.
## At least this one isn't embarassingly stupid.


## Predict And Save ------------------------------------------------------------

survived <- predict(object=g, newdata=test, type="response")
predict  <- cbind(test$passengerid, round(survived))
write.csv(predict, file="/home/andy/sex.csv", row.names=FALSE)



## =============================================================================
## SEX & PCLASS
## =============================================================================

g <- glm( formula=survived~sex+pclass, family=binomial, data=train )
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
g <- glm( formula=survived~sex*pclass, family=binomial, data=train )
summary(g)

## This really drives down our NULL residuals . . . which for today is about as
## far as I want to tear into evaluating a logistic regression model.

## Spend some time experimenting with these formula options. Look at the data.
## See what you can find. But avoid age or anything with NULLS. We will handle
## age next, together.
