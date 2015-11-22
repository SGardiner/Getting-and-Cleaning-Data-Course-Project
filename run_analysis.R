## Here are the data for the project: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## You should create one R script called run_analysis.R that does the following. 
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.

## download and unzip into the Dataset directory
## dir.create("Dataset")
## setwd("Dataset")
## fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileURL, destfile = "Dataset.zip", method = "curl")
## unzip("Dataset.zip")

## load dplyr and data.table
library(data.table)
library(dplyr)

run_analysis <- function() {
        ## read the training and test sets into data frames
        ## activity_labels - file with descriptive names of activities (i.e. WALKING, SITTING, etc.)
        activity_labels <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/activity_labels.txt")
        ## features - file with measurement variable names
        features <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/features.txt")
        ## subject_train - subject numbers used in training data set
        subject_train <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/train/subject_train.txt")
        ## x_train - measurements for training data set
        x_train <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/train/X_train.txt")
        ## y_train - activity numbers used in training data set
        y_train <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/train/y_train.txt")
        ## subject_test - subject numbers used in test data set
        subject_test <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/test/subject_test.txt")
        ## x_test - measurements for test data set
        x_test <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/test/X_test.txt")
        ## y_test - activity numbers used in test data set
        y_test <- fread("~/rprogramming/GetCleanDataCourseProject/Dataset/UCI HAR Dataset/test/y_test.txt")
        
        ## Start of 1) - merge the training and test sets
        ## rename columns in subject and activity number files
        subject_train <- rename(subject_train, subject=V1)
        y_train <- rename(y_train, act_num = V1)
        subject_test <- rename(subject_test, subject=V1)
        y_test <- rename(y_test, act_num = V1)
        ## Note: use head(subject_train) to verify change; same with other files
        
        ## cbind subject and act_num columns to x_train/test measurement sets
        merge_train <- cbind(subject_train, y_train,x_train)
        merge_test <- cbind(subject_test, y_test,x_test)
        ## Note: use head(select(merge_train,1:5)) to verify columns were added
        
        ## merge the test and training sets
        ## start with merge_train and add each row of shorter merge_test set to it
        ## merge_sets <- merge_train
        ##for (i in 1:nrow(merge_test)) {
        ##        merge_sets <- rbind(merge_sets, merge_test[i])
        ##}
        ##  This was a slow operation.  Use the much faster dplyr::full_join function

        ## merge the test and training sets
        merge_sets <- full_join(merge_train, merge_test, by = NULL)
        ## Note: verify with dim(merge_train), dim(merge_test) and dim(merge_sets) 
        
        ## Order the data set by subject and act_num
        merge_sets <- arrange(merge_sets, subject, act_num)
        ## Note: veryify with unique(merge_sets$subject) and unique(merge_sets$act_num)
        ## End of 1) - merge the training and test sets
        print("End of Part 1)")
        
        ## Start of 2) Extract only the measurements on the mean and standard deviation
        ## create index for variable names containing "mean" and "std" strings
        mean_std_features_idx <- c(grep("mean", features$V2), grep("std", features$V2))
        ## Sort in ascending order.  Note: this variable will be used later for adding
        ## descriptive variable names
        mean_std_features_idx <- sort(mean_std_features_idx)
        ## add subject and label columns to index and add +2 to index to adjust
        mean_std_idx <- c(1,2,(mean_std_features_idx+2))
  
        ## Extract only the subject, label, mean and std columns
        merge_sets <- select(merge_sets, mean_std_idx)
        ## Note: verify by dim(merge_sets).  Column number should be 81 instead of 563
        ## End of 2) Extract only the measurements on the mean and standard deviation
        print("End of Part 2)")
        
        ## Start of 3) Use descriptive activity names to name the activities in the data set
        ## Pull names from activity_labels data set.  Column V1 is the index number,
        ## Column V2 is the corresponding descriptive activity name
        for (i in 1:nrow(merge_sets)) {
                merge_sets$activity[i] <- activity_labels$V2[merge_sets$act_num[i]]
        }
        ## Note: verify with tail(names(merge_sets)) and head(merge_sets$activity)
        
        ## re-oder columns to put activity names in 2nd column
        setcolorder(merge_sets,c(1,ncol(merge_sets),2:(ncol(merge_sets)-1)))
        ## Note: verify with head(select(merge_sets,1:5))
        ## End of 3) Use descriptive activity names to name the activities in the data set
        print("End of Part 3)")
        
        ## Start of 4) Appropriately labels the data set with descriptive variable names. 
        ## Pull descriptive variable names from features data set, V2 column
        ## Remove "()" string from names in features, column V2
        for (i in 1:nrow(features)) {
                features$V2[i] <- gsub("\\()", "", features$V2[i])
        }
        
        ## Rename columns in merge_sets, adding +3 to index to skip first 3 columns
        ## use mean_std_features_idx variable
        for (i in 1:length(mean_std_features_idx)) {
                colnames(merge_sets)[i+3] <- features$V2[mean_std_features_idx[i]]
        }
        ## Note: verify with head(select(merge_sets,1:5))
        ## End of 4) Appropriately labels the data set with descriptive variable names.
        print("End of Part 4)")
        
        ## Start of 5) From the data set in step 4, creates a second, independent tidy
        ## data set with the average of each variable for each activity and each subject.
        
        ## get number of unique subjects and activity numbers
        num_subj <- length(unique(merge_sets$subject))
        num_act <- length(unique(merge_sets$act_num))
        
        ## remove activity column (character vector) to make colMeans easier
        merge_sets_temp <- subset(merge_sets, select = -activity)
        ## initialize the tidy data set: merge_sets_avg
        merge_sets_avg = data.frame(matrix(ncol = ncol(merge_sets_temp), nrow = 0))
        
        ## Loop through all subjects; loop through all activities for each subject
        ## to build the new tidy data set
        for (i in 1:num_subj) {
                subj_temp <- filter(merge_sets_temp, subject == i)
                for (j in 1:num_act) {
                        act_temp <- filter(subj_temp,act_num == j)
                        merge_sets_avg <- rbind(merge_sets_avg, colMeans(act_temp))
                }
        }
        ## add previously used column names
        names(merge_sets_avg) <- names(merge_sets_temp)
        ## Note: verify with head(select(merge_sets_avg,1:5))
        
        ## add activity column back in (same code as step 3 above)
        for (i in 1:nrow(merge_sets_avg)) {
                merge_sets_avg$activity[i] <- activity_labels$V2[merge_sets_avg$act_num[i]]
        }
        ## re-oder columns to put activity names in 2nd column
        setcolorder(merge_sets_avg,c(1,ncol(merge_sets_avg),2:(ncol(merge_sets_avg)-1)))
        ## Note: verify with head(names(merge_sets_avg)) and head(select(merge_sets_avg,1:5))
        
        ## Copy dataset for uploading
        merge_sets_tidy <- merge_sets_avg
        ## End of 5) Create a second, tidy data set with average for each activity and
        ## subject
        print("End of Part 5)")
        print(head(select(merge_sets_tidy, 1:5)))
        
        ## Save tidy data set to a .txt file
        write.table(merge_sets_tidy, "~/rprogramming/GetCleanDataCourseProject/Getting-and-Cleaning-Data-Course-Project/merge_sets_tidy.txt", row.names = FALSE)
        
}