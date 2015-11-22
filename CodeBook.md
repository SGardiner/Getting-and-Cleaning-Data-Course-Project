# Code Book - Getting and Cleaning Data course project
This codebook summarizes 
* the variable (column) names in the tidy dataset merge_sets_tidy.txt
* background about the data
* transformations and work performed to clean up the data

## Variables
"subject" - Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
"activity" - Activity name.  Values are: 
* WALKING (value 1)
* WALKING_UPSTAIRS (value 2)
* WALKING_DOWNSTAIRS (value 3)
* SITTING (value 4)
* STANDING (value 5)
* LAYING (value 6)
"act_num" - Activity labels used to link with their activity name.  Range is from 1 to 6, 1 corresponding to WALKING, 2 to WALKING_UPSTAIRS, etc.

## Measurement Variables
The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The following measurement variables are the average of the mean and standard deviation (where applicable).

* "tBodyAcc-mean-X"
* "tBodyAcc-mean-Y"
* "tBodyAcc-mean-Z"
* "tBodyAcc-std-X"
* "tBodyAcc-std-Y"
* "tBodyAcc-std-Z"
* "tGravityAcc-mean-X"
* "tGravityAcc-mean-Y"
* "tGravityAcc-mean-Z"
* "tGravityAcc-std-X"
* "tGravityAcc-std-Y"
* "tGravityAcc-std-Z"
* "tBodyAccJerk-mean-X"
* "tBodyAccJerk-mean-Y"
* "tBodyAccJerk-mean-Z"
* "tBodyAccJerk-std-X"
* "tBodyAccJerk-std-Y"
* "tBodyAccJerk-std-Z"
* "tBodyGyro-mean-X"
* "tBodyGyro-mean-Y"
* "tBodyGyro-mean-Z"
* "tBodyGyro-std-X"
* "tBodyGyro-std-Y"
* "tBodyGyro-std-Z"
* "tBodyGyroJerk-mean-X"
* "tBodyGyroJerk-mean-Y"
* "tBodyGyroJerk-mean-Z"
* "tBodyGyroJerk-std-X"
* "tBodyGyroJerk-std-Y"
* "tBodyGyroJerk-std-Z"
* "tBodyAccMag-mean"
* "tBodyAccMag-std"
* "tGravityAccMag-mean"
* "tGravityAccMag-std"
* "tBodyAccJerkMag-mean"
* "tBodyAccJerkMag-std"
* "tBodyGyroMag-mean"
* "tBodyGyroMag-std"
* "tBodyGyroJerkMag-mean"
* "tBodyGyroJerkMag-std"
* "fBodyAcc-mean-X"
* "fBodyAcc-mean-Y"
* "fBodyAcc-mean-Z"
* "fBodyAcc-std-X"
* "fBodyAcc-std-Y"
* "fBodyAcc-std-Z"
* "fBodyAcc-meanFreq-X"
* "fBodyAcc-meanFreq-Y"
* "fBodyAcc-meanFreq-Z"
* "fBodyAccJerk-mean-X"
* "fBodyAccJerk-mean-Y"
* "fBodyAccJerk-mean-Z"
* "fBodyAccJerk-std-X"
* "fBodyAccJerk-std-Y"
* "fBodyAccJerk-std-Z"
* "fBodyAccJerk-meanFreq-X"
* "fBodyAccJerk-meanFreq-Y"
* "fBodyAccJerk-meanFreq-Z"
* "fBodyGyro-mean-X"
* "fBodyGyro-mean-Y"
* "fBodyGyro-mean-Z"
* "fBodyGyro-std-X"
* "fBodyGyro-std-Y"
* "fBodyGyro-std-Z"
* "fBodyGyro-meanFreq-X"
* "fBodyGyro-meanFreq-Y"
* "fBodyGyro-meanFreq-Z"
* "fBodyAccMag-mean"
* "fBodyAccMag-std"
* "fBodyAccMag-meanFreq"
* "fBodyBodyAccJerkMag-mean"
* "fBodyBodyAccJerkMag-std"
* "fBodyBodyAccJerkMag-meanFreq"
* "fBodyBodyGyroMag-mean"
* "fBodyBodyGyroMag-std"
* "fBodyBodyGyroMag-meanFreq"
* "fBodyBodyGyroJerkMag-mean"
* "fBodyBodyGyroJerkMag-std"
* "fBodyBodyGyroJerkMag-meanFreq"

## The Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record, the following was provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. (provided in x_train.txt and x_test.txt datasets) 
* Triaxial Angular velocity from the gyroscope.  (provided in x_train.txt and x_test.txt datasets) 
* A 561-feature vector with time and frequency domain variables. (provided in the features.txt file)
* Its activity label. (provided in the activity_labels.txt file).  Corresponding activity levels were provided in the y_train.txt and y_test.txt files.
* An identifier of the subject who carried out the experiment. (provided in the subject_train.txt and subjec_test.txt files)

Transformations and work performed to clean up the data
1. Merge the training and test sets
- subject, activity levels and 561-feature measurements were combined

2. Extract only the measurements on the mean and standard deviation
- only "mean" and "std" measurement columns were extracted, keeping only 79 out of the 561 measurement variables

3. Give descriptive activity names to the activities in the data set

4. Appropriately label the data set with descriptive variable names.
- columns were renamed with corresponding measurement variable names containing "mean" and "std" that were provided with the dataset

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
- data was subsetted for each subject and each activity level
- the mean (or average) was calculated for each measurement column and added into a new dataset - "merge_sets_tidy"



