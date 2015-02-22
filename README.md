#ReadMe file for Getting and Cleaning Data Course Project
==========================================================
##Contents of Course Project:
1. This ReadMe File - ReadMe.md
2. run_analysis.R script
3. CodeBook.md
4. tidy_data_table.txt

###run_analysis.R file
- The run_analysis.R script is written with the assumption that the working directory for this script contains a sub-directory, "UCI HAR Dataset", containing the Samsung data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This script accomplishes the following objectives:
        1. Merges the training and the test sets from the UCI HAR Dataset to create on data set.
        2. Extracts only the measurements on the mean and standard deviation for each measurement.
        3. Uses descriptive activity names to name the activities in teh data set.
        4. Appropriately labels the data set with descriptive variable names.
        5. Creates a second, independent tidy data set (tidy_data_table.txt) with the average of each activity and each subject.

###CodeBook.md
This is the codebook that explains the raw data from which the tidy data set was created via the run_analysis.R script.
It also describes each step in the analysis process that the run_analysis.R script uses to transform the raw data from 
the UCI HAR dataset into the tidy data table.

###tidy_data_table.txt
This is the output from the run_analysis.R script. Each row represents the means of the measurements for each activity
for each subject. This should be viewed using 'read.table()' and setting 'header=TRUE'.