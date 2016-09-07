## #############################################################################
## first-predictive-model.R
##
## Our very first model, together.
## #############################################################################

## =============================================================================
## WARNING
##
## If you have a fresh R session running, you need to run the import.R code
## to import the data objects used here.
## =============================================================================



## =============================================================================
## EVERYONE LIVES!
## Even though we know more than 60% of the passengers die,
## our first model assumes everyone lives.
##
## In other words. It sucks.
## =============================================================================

## Does not actually use test, because this is silly.
## To upload a predictive model to Kaggle, it can have only two columns.
everyone_lives <- cbind(test$passengerid, survived=1)
write.csv(everyone_lives, file="/home/andy/everyone_lives.csv", row.names=FALSE)

## And upload this to Kaggle.
## I uploaded this model in October, 2014 and was 3,175 on the leader board
## (of 3,178). Only 37.321% of these predictions are correct.



## =============================================================================
## EVERYONE DIES!
## Even though we know more than 60% of the passengers die,
## our first model assumes everyone dies.
##
## In other words. It sucks.
## =============================================================================

## Does not actually use test, because this is silly.
## To upload a predictive model to Kaggle, it can have only two columns.
everyone_dies <- cbind(test$passengerid, survived=1)
write.csv(everyone_dies, file="/home/andy/everyone_dies.csv", row.names=FALSE)

## And upload this to Kaggle.
## This model improved my score, by 82 positions.
## It is now right 62.679 percent of the time.


