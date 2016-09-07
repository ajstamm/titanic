## #############################################################################
## plot.R
##
## Focuses on the train data set, although tese would work with the test
## data set just as well (except survived).
## #############################################################################


## Read the help on as.factor to understand most of these.
?as.factor

## There are only a few base R plotting functions:
## - hist()
## - abline()
## - plot()
## - barplot()
## - boxplot()
## - pairs()

## We will use most of these today, but plot() is the go to.



## =============================================================================
## TRAIN: 1 Variable Plots
## =============================================================================

## -----------------------------------------------------------------------------
## SURVIVED
## Most people died.
## -----------------------------------------------------------------------------
plot( as.factor(train$survived) )

## R commands build on one another. Below, is the process I actually followed
## when exploring this data. I started with a simple table. And then built up.

## How many survived v died?
## Remember, these aren't the actual numbers. Only about half.
table(train$survived)

## To get a better sense of the ratio
## Because this is a table with only one dimension, we don't need to specify
## if we want to aggregate over rows or columns.
prop.table( table(train$survived) )

## Yikes - Can we see that visually? (YES)
barplot( prop.table( table(train$survived) ) )

## From simple to complex, just by layering one command on top of another.


## -----------------------------------------------------------------------------
## PCLASS
## -----------------------------------------------------------------------------
## There were actually more first class passengers than second class.
## And lots of steerage.
plot( as.factor(train$pclass) )

## You can get the same results a different way:
## This has the advantage that you can more easily get percentages.
barplot( table(train$pclass) )

## -----------------------------------------------------------------------------
## SEX
## -----------------------------------------------------------------------------
## More men than women.
plot( train$sex )


## -----------------------------------------------------------------------------
## AGE
## -----------------------------------------------------------------------------
## This is the closest we get to a normally distributed, continuous variable.
hist(train$age)

## So, let's add a normal curve!
## x is a convenience variable
## I'm not going to have time to explain this thoroughly.
x <- train$age
h <- hist(x, col="lightblue",
          xlab = "Passenger Age",
          main = "Histogram of Passenger Ages On The Titanic"
          )

xfit <- seq( min(x, na.rm=TRUE), max(x, na.rm=TRUE), length=length(x) ) 
yfit <- dnorm( xfit, mean=mean(x, na.rm=TRUE), sd=sd(x, na.rm=TRUE) ) 
yfit <- yfit*diff( h$mids[1:2] )*length(x) 
lines(xfit, yfit, col="red", lwd=2)


## -----------------------------------------------------------------------------
## SIBSP
## -----------------------------------------------------------------------------
hist(train$sibsp, col="gray")


## -----------------------------------------------------------------------------
## PARCH
## -----------------------------------------------------------------------------
plot( as.factor(train$parch) )


## -----------------------------------------------------------------------------
## FARE
## -----------------------------------------------------------------------------
## Two different ways to view this data.
plot( train$fare )
hist( train$fare )

## Or we could use a kernel density plot
plot( density(train$fare) )

## FUNKY!


## -----------------------------------------------------------------------------
## EMBARKED
## -----------------------------------------------------------------------------
plot( train$embarked )



## =============================================================================
## Train: 2 Variable Plots
##
## The challenge: graphing a visual relationship between two categorical
## variables. Fortunately, R is designed to make this "easy".
##
## 
## =============================================================================


## -----------------------------------------------------------------------------
## PCLASS x SURVIVE
## -----------------------------------------------------------------------------

## We used code similar to this earlier. Now we are going to use it in practice.
tbl <- table(as.factor(train$pclass), as.factor(train$survived))
prp <- prop.table(tbl, 1)

## This just shows us our output. Useful, but not new.
tbl
prp

## Question: What is the difference between these two plots?
## How can this be usefulfor our prediction work later?
plot(tbl)
plot(prp)


## -----------------------------------------------------------------------------
## PAIRS!
## I saved the best for last. This is sooo much fun.
## -----------------------------------------------------------------------------
pairs(train, main="Everything By Everything")

## Spend a minute with that one if you want. I'll wait.


## =============================================================================
## YOUR TURN!
## =============================================================================

## -----------------------------------------------------------------------------
## AGE x SURVIVE
## -----------------------------------------------------------------------------



## -----------------------------------------------------------------------------
## SEX x SURVIVE
## -----------------------------------------------------------------------------






## FEEL FREE TO ASK QUESTIONS!
