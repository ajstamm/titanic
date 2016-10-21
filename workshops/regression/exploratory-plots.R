## #############################################################################
## Exploratory Plots
##
## Plots to demonstrate Base R's graphics abilities. 
##
## Examples focus on the train data set, but work with the test data set too.
##
## The data dictionary is available here:
## http://choens.github.io/titanic/workshops/regression/data-dictionary/
##
## #############################################################################

## What are our columns? ------------------------------------------------------
## Column names, in alphabetical order.
sort(names(train))


## As you review these, how can you use these plots to find factors which might
## affect survival? From time to time, I will demonstrate a feature or two that
## might be of interest.

## AGE -------------------------------------------------------------------------
## Several ways to look at age.
plot(train$age)
plot(as.factor(train$age))

## This one is better if you want to share with others.
hist(train$age,
     main="Histogram of Age Onboard the RMS Titanic",
     xlab="Age",
     ylab="N Passengers"
     )


## CABIN -----------------------------------------------------------------------
## This doesn't really "make sense" graphically.
## So, here's a table. Be happy with that.  :-)
table(train$cabin)


## EMBARKED --------------------------------------------------------------------
plot(train$embarked, col="light blue")


## FARE ------------------------------------------------------------------------
plot(train$fare)
hist(train$fare, col="pink")


## NAME ------------------------------------------------------------------------
## This doesn't make any sense as a visual, so here's a way to see all of them.
View(train$name)


## PARCH -----------------------------------------------------------------------
plot(train$parch)
hist(train$parch)


## PASSENGERID -----------------------------------------------------------------
## This is another data element which doesn't make any sense as a graphic.
View(train$passengerid)


## PCLASS ----------------------------------------------------------------------
## Although stored as a numeric, this is really a factor.
plot(as.factor(train$pclass))
barplot(table(train$pclass))


## SEX -------------------------------------------------------------------------
plot(train$sex)


## SIBSP -----------------------------------------------------------------------
plot(train$sibsp)
hist(train$sibsp)


## SURVIVED --------------------------------------------------------------------
## Since more than 50% of the passengers died, I think this column name is a
## little optimistic.
plot(as.factor(train$survived))


## TICKET ----------------------------------------------------------------------
## This is another one that really doesn't work graphically.
head(train$ticket)


## SEX -------------------------------------------------------------------------
plot(train$sex)
