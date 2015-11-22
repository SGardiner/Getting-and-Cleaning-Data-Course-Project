# Getting-and-Cleaning-Data-Course-Project
Project for the Coursera Getting and Cleaning Data course

Files included in the submission
* README.md - this file
* run_analysis.R - R script for creating tidy dataset
* merge_sets_tidy.txt - tidy dataset output of R script, 180 rows, 82 columns
* CodeBook.md - codebook summarizing the variable names, information about the data, and transformations and work done on data to product tidy dataset merge_sets_tidy.txt

### To verify the merge_sets_tidy.txt dataset, use the following from RStudio command line:
Make sure file 'merge_sets_tidy.txt' is in the current working diretory
data <- read.table("merge_sets_tidy.txt", header = TRUE)  
View(data)

### The R scripts are contained in a single file - run_analysis.R, with 5 steps

Step 1) Merge the training and test sets
- subject and activity level variables were given names (subject and act_num)
- subject, activity levels and 561-feature measurements in x_train.txt and x_test.txt were combined into data table "merge_sets"

Step 2) Extract only the measurements on the mean and standard deviation
- variable names which contained "mean" and "std" were identified and indexed from the features.txt file
- using that index, only "mean" and "std" measurement columns were extracted from "merge_sets".  Out of 561 measurement variables, only 79 were kept.

Step 3) Use descriptive activity names to name the activities in the data set
- "activity" column added where act_num in each row was used to pull the correct activity name from the activity_labels.txt file

Step 4) Appropriately label the data set with descriptive variable names. 
- columns were renamed with corresponding measurement variable names containing "mean" and "std" pulled from the features.txt file

Step 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- "activity" column was temporarily removed from dataset since it was a character vector
- data was subsetted for each subject (1:30) and and each activity level (1:6)
- the mean (or average) was calculated for each measurement column and added (along with the subject and activity level columns) into a new dataset - "merge_sets_tidy"
- the "activity" column with descriptive names was added back and columns were re-ordered

### To install and run the R script run_analysis.R
* Create a directory for this project '~/rprogramming/GetCleanDataCourseProject/Getting-and-Cleaning-Data-Course-Project'
* Download the script 'run_analysis.R' to 'Getting-and-Cleaning-Data-Course-Project'
* Download the raw data from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  Your directory structure should look like this now (only shown 2 levels deep):
* Unzipped data files should be under the '~/rprogramming/GetCleanDataCourseProject/Dataset' directory
* Change working directory to   '~/rprogramming/GetCleanDataCourseProject/Getting-and-Cleaning-Data-Course-Project'
* Run the following from the command line
> source("run_analysis.R")
> run_analysis()
* Output file in the working directory is merge_sets_tidy.txt
