## =============================================================================
## Data Types
## =============================================================================

## Data Types ------------------------------------------------------------------
## - This script!
## - You will learn more if you run the  code for yourself!




## Data Types ------------------------------------------------------------------
##
## Covered Today
## (Atomic Data Types)
## - Numeric
## - Integer
## - Character
## - Boolean
##
## Not Covered Toay ------------------------------------------------------------
## - Dates / Timestamps
## - Imaginary Numbers
## - Other things not listed here



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



## Integers V Numerics ---------------------------------------------------------
## Integer is a sub-type of numeric
## R will ONLY use this data type if you EXPLICITLY tell it to
## And if you don't understand them, they can behave oddly



## Integers Get Floored --------------------------------------------------------
oops <- as.integer(percent_crew)
oops

## [1] 26



##
