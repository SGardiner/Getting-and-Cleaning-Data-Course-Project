# Code Book - Getting and Cleaning Data course project
This codebook summarizes the variable (column) names in the tidy dataset merge_sets_tidy.txt

## Variables
"subject" - Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
"activity" - Activity name.  Values are: 
        WALKING (value 1)
        WALKING_UPSTAIRS (value 2)
        WALKING_DOWNSTAIRS (value 3)
        SITTING (value 4)
        STANDING (value 5)
        LAYING (value 6)
"act_num" - Activity labels used to link with their activity name.  Range is from 1 to 6, 1 corresponding to WALKING, 2 to WALKING_UPSTAIRS, etc.

## Measurement variables
The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The following measurement variables are the average of the mean and standard deviation (where applicable).

"tBodyAcc-mean-X"
"tBodyAcc-mean-Y"
"tBodyAcc-mean-Z"
"tBodyAcc-std-X"
"tBodyAcc-std-Y"
"tBodyAcc-std-Z"
"tGravityAcc-mean-X"
"tGravityAcc-mean-Y"
"tGravityAcc-mean-Z"
"tGravityAcc-std-X"
"tGravityAcc-std-Y"
"tGravityAcc-std-Z"
"tBodyAccJerk-mean-X"
"tBodyAccJerk-mean-Y"
"tBodyAccJerk-mean-Z"
"tBodyAccJerk-std-X"
"tBodyAccJerk-std-Y"
"tBodyAccJerk-std-Z"
"tBodyGyro-mean-X"
"tBodyGyro-mean-Y"
"tBodyGyro-mean-Z"
"tBodyGyro-std-X"
"tBodyGyro-std-Y"
"tBodyGyro-std-Z"
"tBodyGyroJerk-mean-X"
"tBodyGyroJerk-mean-Y"
"tBodyGyroJerk-mean-Z"
"tBodyGyroJerk-std-X"
"tBodyGyroJerk-std-Y"
"tBodyGyroJerk-std-Z"
"tBodyAccMag-mean"
"tBodyAccMag-std"
"tGravityAccMag-mean"
"tGravityAccMag-std"
"tBodyAccJerkMag-mean"
"tBodyAccJerkMag-std"
"tBodyGyroMag-mean"
"tBodyGyroMag-std"
"tBodyGyroJerkMag-mean"
"tBodyGyroJerkMag-std"
"fBodyAcc-mean-X"
"fBodyAcc-mean-Y"
"fBodyAcc-mean-Z"
"fBodyAcc-std-X"
"fBodyAcc-std-Y"
"fBodyAcc-std-Z"
"fBodyAcc-meanFreq-X"
"fBodyAcc-meanFreq-Y"
"fBodyAcc-meanFreq-Z"
"fBodyAccJerk-mean-X"
"fBodyAccJerk-mean-Y"
"fBodyAccJerk-mean-Z"
"fBodyAccJerk-std-X"
"fBodyAccJerk-std-Y"
"fBodyAccJerk-std-Z"
"fBodyAccJerk-meanFreq-X"
"fBodyAccJerk-meanFreq-Y"
"fBodyAccJerk-meanFreq-Z"
"fBodyGyro-mean-X"
"fBodyGyro-mean-Y"
"fBodyGyro-mean-Z"
"fBodyGyro-std-X"
"fBodyGyro-std-Y"
"fBodyGyro-std-Z"
"fBodyGyro-meanFreq-X"
"fBodyGyro-meanFreq-Y"
"fBodyGyro-meanFreq-Z"
"fBodyAccMag-mean"
"fBodyAccMag-std"
"fBodyAccMag-meanFreq"
"fBodyBodyAccJerkMag-mean"
"fBodyBodyAccJerkMag-std"
"fBodyBodyAccJerkMag-meanFreq"
"fBodyBodyGyroMag-mean"
"fBodyBodyGyroMag-std"
"fBodyBodyGyroMag-meanFreq"
"fBodyBodyGyroJerkMag-mean"
"fBodyBodyGyroJerkMag-std"
"fBodyBodyGyroJerkMag-meanFreq"
