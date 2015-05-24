Input data was sourced:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

original data consisted of 561 summary variables (e.g. std,mean,min,max) and was separated into 'X_train' and 'X_test' 
Y_test and Y_train denoted the activity labels and Subject_Test, Subject_train denoted participant id. 
train and test data were mergered 
the transpose of the 'Features' files was used as the column names for the merged x data
grep was used to extract just the variables pertaining to the mean and std which resulted in 75 variables.
later, tidy_data was created by generating an independent dataframe based on the previous dataframe which 
showed the mean value for every variable by id and ativity, e.g.:

                                subject       activity    v1....
                                1             2           40
                                1             3           35
the previous data frame (Full_Data) was melted and reshaped, then ddply was used to calculate the means



below are the variable names gathered from features

tBodyAcc-mean()-X	
tBodyAcc-mean()-Y	
tBodyAcc-mean()-Z	
tBodyAcc-std()-X	
tBodyAcc-std()-Y	
tBodyAcc-std()-	
tGravityAcc-mean()-X	
tGravityAcc-mean()-Y	
tGravityAcc-mean()-Z	
tGravityAcc-std()-X	
tGravityAcc-std()-Y	
tGravityAcc-std()-Z	
tBodyAccJerk-mean()-X	
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z	
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z	
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y	
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y	
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()	
tBodyAccMag-std()	
tGravityAccMag-mean()	
tGravityAccMag-std()	
tBodyAccJerkMag-mean()	
tBodyAccJerkMag-std()	
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()	
tBodyGyroJerkMag-std()	
fBodyAcc-mean()-X	
fBodyAcc-mean()-Y	
fBodyAcc-mean()-Z	
fBodyAcc-std()-X	
fBodyAcc-std()-Y	
fBodyAcc-std()-Z	
fBodyAccJerk-mean()-X	
fBodyAccJerk-mean()-Y	
fBodyAccJerk-mean()-Z	
fBodyAccJerk-std()-X	
fBodyAccJerk-std()-Y	
fBodyAccJerk-std()-Z	
fBodyGyro-mean()-X
fBodyGyro-mean()-Y	
fBodyGyro-mean()-Z	
fBodyGyro-std()-X	f
BodyGyro-std()-Y	
fBodyGyro-std()-Z	
fBodyAccMag-mean()
fBodyAccMag-std()	
fBodyBodyAccJerkMag-mean()	
fBodyBodyAccJerkMag-std()	
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()	
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()	
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)	
angle(tBodyGyroJerkMean,gravityMean)	
angle(X,gravityMean)	
angle(Y,gravityMean)
angle(Z,gravityMean
