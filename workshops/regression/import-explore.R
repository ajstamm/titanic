## #############################################################################
## import-explore.R
## #############################################################################


## =============================================================================
## Import
## =============================================================================

## TEST ------------------------------------------------------------------------
url  <- "http://choens.github.io/titanic/public/data/test.csv"
test <- read.csv(file=url)
names(test) <- tolower(names(test))    ## I hate mixed-case column names

## TRAIN -----------------------------------------------------------------------
url   <- "http://choens.github.io/titanic/public/data/train.csv"
train <- read.csv(file=url)
names(train) <- tolower(names(train))   ## I hate mixed-case column names


## You will need these two data sets. Tell us NOW if you are having trouble.




## =============================================================================
## Explore
## If these don't work, you haven't imported the data successfully.
## These two sets of code aren't quite identical. Poke around a little.
## =============================================================================


## TEST ------------------------------------------------------------------------
## Run each command to confirm you have imported the data correctly.
## You can record any output you would like as a comment.
names(test)
summary(test)
head(test)

## TRAIN -----------------------------------------------------------------------
## Run each command to confirm you have imported the data correctly.
## You can record any output you would like as a comment.
dim(train)
names(train)
str(train)
tail(train)



## Questions -------------------------------------------------------------------
## Q1. Which functions seem most useful to you? Why?
## Q2. When first starting out with a new data set, what else might you want to know?
## Q3. What is your favorite color?
