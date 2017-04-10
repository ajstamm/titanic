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



## Floating Point "Errors" -----------------------------------------------------
## How can all three of these be correct?

(3 - 2.9)

(3 - 2.9) == 0.1


##Floating Point "Errors" ------------------------------------------------------
## As a matter of convention, children are taught a Base 10 (denary) number
## system. Digital computers (must) use a Base 2 (binary) system. In Base 2,
## numbers such as 0.1 are internally held as a floating-point, introducing
## rounding error. See:
## http://www.burns-stat.com/documents/tutorials/impatient-r/more-r-key-objects/more-r-numbers/
## if you'd like to read more.
 
print(3 - 2.9, digits=20)


