## #############################################################################
## Data Types
## #############################################################################

## Data Types ------------------------------------------------------------------
## Run code, learn more
## Duration: ~45 Minutes
## Followed By: 5 Minute Break


## Learning Objectives ---------------------------------------------------------
## - Assignment
## - Data Types
## - Boats



## Assignment Operator ---------------------------------------------------------
## Multiple assignment operators
## History, convention, and some old-school ideas
## These are equivalent.
a <- 1
a =  1

## In the beginning <- was the only assignment operator.
## Most R programmers continue to use it as a convention



## Why Be Conventional? ---------------------------------------------------------
## All languages have conventions
## Deviating can be OK
## You should have a good reason to do so
## KNOW the conventions, so you can read demo code, etc
## We will use R conventions today, unless otherwise noted



## Assignment Conventions ------------------------------------------------------
## Both <- and = assign variables in the local environment
## If you see someone using <--, be careful
## Especially if you do not understand concepts such as lexical scoping, global environment, etc.



## Assignment Quirks -----------------------------------------------------------
## R is a quirky language
## Assignment in a function uses = EXCLUSIVELY

## This is dummy code. Don't run this code.

## These are NOT equivalent.

## This is correct.
a <- foo(x = 1, y = 2)

## This will _NOT_ work.
a <- foo(x <- 1, y <- 2)



## Data Types ------------------------------------------------------------------
##
## Covered Today
## (Atomic Data Types)
## - Numeric
## - Integer
## - Character
## - Boolean
##
## (Additional)
## - Dates



## Numeric ---------------------------------------------------------------------
## Use the assignment operator (<-) to assign a value
## to a variable.

## The passenger capacity of the Titanic
passenger_capacity <- 2435

## The crew capacity of the Titanic
crew_capacity <- 892



## Your Turn! ------------------------------------------------------------------
## Can you calculate the total passenger capacity
## and the percentage of this total which were staff?



## Is Numeric ------------------------------------------------------------------
## - Is a variable numeric?
## - is.numeric() returns a Boolean
## These two code snippets make sense.

is.numeric(total_capacity)

## Returns:
## [1] TRUE

is.numeric(percent_crew)

## Returns:
## [1] TRUE



## Your Turn! ------------------------------------------------------------------
## Compare the results.
## Does this make sense?

total_capacity

typeof(total_capacity)
    
is.double(total_capacity)

is.integer(total_capacity)

percent_crew

typeof(percent_crew)
    
is.double(percent_crew)

is.integer(percent_crew)

## We will discuss this as a group.



## Integers V Numerics ---------------------------------------------------------
## Integer is a sub-type of numeric
## R will ONLY use this data type if you EXPLICITLY tell it to
## And if you don't understand them, they can behave oddly



## Integers Get Floored --------------------------------------------------------
oops <- as.integer(percent_crew)
oops



## Numerical Details -----------------------------------------------------------
## - You can do math with numerics
## - Follows the usual order of operations
## - R is over-kill if all you need is a calculator
## - That said . . . I have used it that way



## Characters ------------------------------------------------------------------
## - Like a char() or varchar() in SQL
## - Can be of any arbitrary length
## - Can use either 'foo' or "foo".
## - Double quotes is the convention, mostly
## - Assignment works the same way as numerics



## Your Turn! ------------------------------------------------------------------
## Let's make some character vars!
title <- "Captain"
name  <- "Smith"

## And do something . . . cool . . .  with them.
paste(title, name, sep=" ")



## BOOLEANS --------------------------------------------------------------------
## - TRUE
## - FALSE
## - Assignment works the way you would expect



## BOOLEANS --------------------------------------------------------------------

survived <- TRUE

## OR

survived <- FALSE

## Nothing Surprising Here.



## COMPARISONS -----------------------------------------------------------------
## - Comparison Operators:
## - == (Cannot use =)
## - <, <=
## - >, >=
## - Return: TRUE, FALSE OR NA


## COMPARISONS

## Were there more passengers than crew?
## Hint: Yes, but let's prove it
> passenger_capacity > crew_capacity
[1] TRUE

## Were there exactly 1,000 passengers?
## Hint: No. Of course not.
> passenger_capacity == 1000
[1] FALSE

## You can assign the results to a variable
answer <- passenger_capacity < 1000

## Doing so returns nothing, unless there is an error.
    


## YOUR TURN! ------------------------------------------------------------------

## Captain Edward Smith was 62 years old when he died.
## Was he older when he died than you are today?
answer <- 62 > ?

## Additional Questions
## Is 'answer' a Numeric?
## Is 'answer' a Boolean?



## DATES -----------------------------------------------------------------------
## - Fact of Life: Dates universally suck
## - R is no different
## - Not needed today, just demonstrative
## - Like Integers, must be explicitly declared
## - The command as.Date(), is funky
## - Why the capital D? Dunno



## DATES
## POSIX Compatible dates:
## You can write it as a mm/dd/yyyy, but . . .
## then you have to tell R how to read the date. 
capt_smith_dob <- as.Date("1850-01-27")

## I won't make you practice these today.



## DATA TYPES
## - There are other data types in R
## - Developers create new ones all the time
## - But for the sake of simplicity . . .
## - That's all we need for today



## 5 Minute Break!
