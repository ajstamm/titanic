# README - Data

## test.csv

-  Data Source - http://www.kaggle.com/c/titanic-gettingStarted/data
-  Data Information - Test data for Kaggle Titanic introductory comp.
-  Saved - 2014-10-15 at 23:35

## train.csv

-  Data Source - http://www.kaggle.com/c/titanic-gettingStarted/data
-  Data Information - Training data for Kaggle Titanic introductory
   comp.
-  Saved - 2014-10-15 at 23:35

##  Data Variables (Test / Train)

Describes the variables in the test / train .csv files.
This data dictionary and subsequent info was obtained from Kaggle.


| Variable | Description                       | Details                                        |
|----------+-----------------------------------+------------------------------------------------|
| survival | Survival                          | 0 = No; 1 = Yes                                |
| pclass   | Passenger Class                   | 1 = 1st; 2 = 2nd; 3 = 3rd                      |
| name     | First and Last Name               |                                                |
| sex      | Sex                               |                                                |
| age      | Age                               |                                                |
| sibsp    | Number of Siblings/Spouses Aboard |                                                |
| parch    | Number of Parents/Children Aboard |                                                |
| ticket   | Ticket Number                     |                                                |
| fare     | Passenger Fare                    |                                                |
| cabin    | Cabin                             |                                                |
| embarked | Port of Embarkation               | C = Cherbourg; Q = Queenstown; S = Southampton |
|          |                                   |                                                |

## SPECIAL NOTES:

Pclass can be a proxy for socio-economic status (SES)

-  1st ~ Upper;
-  2nd ~ Middle;
-  3rd ~ Lower

Age is in Years; - Fractional if Age less than One (1) - If the Age is
Estimated, it is in the form xx.5

With respect to the family relation variables (i.e. sibsp and parch)
some relations were ignored. The following are the definitions used for
sibsp and parch.

Sibling: Brother, Sister, Stepbrother, or Stepsister of Passenger Aboard
Titanic Spouse: Husband or Wife of Passenger Aboard Titanic (Mistresses
and Fiances Ignored) Parent: Mother or Father of Passenger Aboard
Titanic Child: Son, Daughter, Stepson, or Stepdaughter of Passenger
Aboard Titanic

Other family relatives excluded from this study include cousins,
nephews/nieces, aunts/uncles, and in-laws. Some children travelled only
with a nanny, therefore parch=0 for them. As well, some travelled with
very close friends or neighbors in a village, however, the definitions
do not support such relations.

Andy's Additions:

| Variable       | Description                   | Details       |
|----------------+-------------------------------+---------------|
| survival\_desc | Survival                      | No; Yes       |
| pclass\_desc   | Passenger Class               | 1st; 2nd; 3rd |
| age\_group     | Age Groupings                 |               |
| fare\_group    | Passenger Fare                |               |
| deck           | The letter portion from cabin |               |

