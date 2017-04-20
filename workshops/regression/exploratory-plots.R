## #############################################################################
## Exploratory Plots
##
## Quick (mostly) visual exploration of the passengers data.
## I often start a real project with something like this, just to get a "feel"
## of the data. I'm all touchy-feely with my numbers.
##
## Provide some documentation on the "meaning" of the variables.
##
## Requires the passengers data set.
##
## #############################################################################



## WHAT ARE OUR COLUMNS? ------------------------------------------------------
## Column names, in alphabetical order. Data columns are presented in the same
## order.
sort(names(passengers))



## AGE -------------------------------------------------------------------------
## Several ways to look at age.
plot(passengers$age)
plot(as.factor(passengers$age))

## This one is better if you want to share with others.
hist(passengers$age,
     main="Histogram of Age Onboard the RMS Titanic",
     xlab="Age",
     ylab="N Passengers"
     )



## CABIN -----------------------------------------------------------------------
## This tells us where they are on the Titanic. This is useful, but hard to
## represent in a graph. So, here's a table. Be happy with that.  :-)
table(passengers$cabin)



## EMBARKED --------------------------------------------------------------------
## Shows us which port people boarded the Titanic. Passengers boarding in France
## were less likely to speak English.
plot(passengers$embarked, col="light blue")



## NAME ------------------------------------------------------------------------
## This doesn't make any sense as a visual, so here's a way to see all of them.
## Really, this is just depressing.
View(passengers$passenger_name)



## N_PARENTS_CHILDREN ----------------------------------------------------------
## Basically, how many people were in the group?
plot(passengers$n_parents_children)
hist(passengers$n_parents_children)



## PASSENGER_ID ----------------------------------------------------------------
## This is another data element which doesn't make any sense as a graphic.
## I included this just to make this comprehensive.
View(passengers$passenger_id)



## PASSENGER_CLASS -------------------------------------------------------------
## Although stored as a numeric, this is really a factor.
## A useful proxy for socio-economic class, since first-class tickets cost
## more than steerage (third-class)
plot(as.factor(passengers$passenger_class))
barplot(table(passengers$passenger_class))



## SEX -------------------------------------------------------------------------
## This is just what the label says.
plot(passengers$sex)



## SIBSP -----------------------------------------------------------------------
## How many brothers sisters?
plot(passengers$n_siblings)
hist(passengers$n_siblings)



## SURVIVED --------------------------------------------------------------------
## O == Died
## Since more than 50% of the passengers died, I think the name of this column
## is a little optimistic.
plot(as.factor(passengers$survived))



## TICKET ----------------------------------------------------------------------
## This is another one that really doesn't work graphically.
## This is a nice way to see the first 6 values of an object.
head(passengers$ticket)
