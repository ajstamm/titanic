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



## Create Some Data ------------------------------------------------------------
## - Use an assignment operator
## - More than one!
## - History, convention, and some old-school ideas

## These are equivalent.
a <- 1
a =  1

## In the beginning <- was the only assignment operator.
## Most R programmers continue to use it as a convention



## Why Be Conventional? ---------------------------------------------------------
## - Languages have conventions
## - KNOW</span> them, to read demo code, etc
## - Only deviate if you have good reason to do so
## - TITR uses R conventions, unless otherwise noted



## Assignment Conventions ------------------------------------------------------
## Both <- and = assign variables in the local environment
## If you see someone using <--, be careful
## Especially if you do not understand concepts such as lexical scoping, global environment, etc.



## Capitalization Matters ------------------------------------------------------
##Capitalization does not matter in SQL.
##It does matter in R (and most other languages).
## Using our object, "a" from previous slide.

## This works.
head(a)

## This will _NOT_ work.
head(A)



## Atomic Data Types Introduced Today ------------------------------------------
##
## R calls this the data's class.
##
## Our Focus:
## - Numeric
## - Character
## - Logical (Boolean)
##
## Additional:
## - Date
## - Factor (Discussed later today)



## Atomic Data Types Not Introduced Today --------------------------------------
## - Integer
## - Complex
## - Raw
## This is more of an FYI than anything else.



## Numeric ---------------------------------------------------------------------
## - These are numbers!



## Numeric ---------------------------------------------------------------------
## Use the assignment operator (<-) to assign a value
## to a variable.

## The passenger capacity of the Titanic
passenger_capacity <- 2435

## The crew capacity of the Titanic
crew_capacity <- 892

## Note: You _do not_ use a comma separator in a numeric.



## Your Turn! ------------------------------------------------------------------
## Can you calculate the total passenger capacity
## and the percentage of this total which were staff?



## Functions -------------------------------------------------------------------
## Being able to do something to what we create is useful.
## We will often use a function to alter our data.

## This is fake code.
## I commented this out, to make sure you don't try to run it!
##second_variable <- some_function(first_variable)


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

class(total_capacity)
    
percent_crew

class(percent_crew)
    
## We will discuss this as a group.



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
passenger_capacity > crew_capacity

## Were there exactly 1,000 passengers?
## Hint: No. Of course not.
passenger_capacity == 1000

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



## DATES -----------------------------------------------------------------------
## POSIX Compatible dates:
## You can write it as a mm/dd/yyyy, but . . .
## then you have to tell R how to read the date. 
capt_smith_dob <- as.Date("1850-01-27")

## I won't make you practice these today.



## REPL Gotcha! ----------------------------------------------------------------
## - Each line in R's REPL normally starts with: ">".
## - If a line starts with a "+", you haven't finished your statement.
## - The "+" is R's way to tell you it is waiting for you to finish the statement.
##   - Usually happens because you forges to close a parens of quotation.



## YOUR TURN -------------------------------------------------------------------
## What does this do?
c(1,2,3)



## 5 Minute Break! -------------------------------------------------------------
## Please Come Back!
