#Code Book

##Experimental data
Data are taken from the Human Activity Recognition Using Smartphones Dataset Version 1.0. The experimants were conducted in the Smartlab - Non Linear Complex Systems Laboratory. The experiments from which the raw data were obtained were carried out with a group of 30 volunteers whithin an age range of 19-48 years. Each person performed six activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing,  and Laying. Each subject wore a Samsung Galaxy S II smartphone while performing these activities and measurements were recorded from the phone's internal accelerometer and gyroscope. 3-axial linear acceleration and 3-axial angular velocity were sampled at a rate of 50Hz. The obtained data set was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% were selected for generating the test data.

##Signal processing
The signals from the accelerometer and gyroscope in the smartphone were pre-processed by applying noise filters and were then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap.

##Data Cleaning
The raw experimental data were sorted using the run_analysis.R script. The resulting tidy data table was written to the tidy_data_table.txt file. This was accomplished in the following steps:
1. Merging the Training and Test sets
The following data files were read into R as data tables and combined into a data frame called allData: the training and test sets (x_train.txt and x_test.txt), the subject ids (subject_train.txt and subject_test.txt), and the activity labels (y_train.txt and y_test.txt). The columns were labled using the lables in the features.txt file.

2. Extracting the Means and Standard Deviations
The indices for all columns containing the strings 'mean()' and 'std()' were obtained using the 'grep' function. The 'fixed' argument was set to 'true' to avoid obtaining indices for 'Freq' variables. The allData data frame was then subset using these indices, while also preserving the 'subject' and 'activity' columns. This resulted in the creation of a new data frame called 'subset' that contained only the variables referring to the mean and standard deviation measurement.

3. Applying Descriptive Activity Names
Activity labels were obtained by reading the second column of the file 'activity_labels.txt' into a character vector. The 'activity' variable was then coerced to a factor, and the levels of the 'activity' variable were set to the character strings contained within the newly created vector.

4. Applying Descriptive Variable Names
Upon inspection of the variable names in the 'subset' data frame, the variable names corresponding to the mean and standard deviation variables were observed to contain '.', '..', and '...' - these were removed using the 'gsub' function. In addition, variable names were converted to camel case, and redundant variable names (i.e. 'BodyBody') were corrected.

5. Creating Tidy Data Table
Using the plyr package and the ddply function, means for each activity for each subject were obtained using 'numcolwise'. The resulting means were then written to a text file using the 'write.table' function.Again, the 'subject' and 'activity' columns were retained and written to the tidy data table. This table can be viewed using the 'read.table()' function and setting header=TRUE.

Variables beginning with the letter 't' are time domain variables, while those beginning with the letter 'f' are frequency domain variables. Variables containing 'Body' and 'Gravity' refer to measurements of the body and gravity acceleration signals respectively. Variable names contain the abreviations 'Acc' and 'Gyro', which refer to the signal type: 'Accelerometer' and 'Gyroscope', respectively. The magnitude measures are indicated with the label 'Mag'. Where applicable, the measures represent signals from the X, Y, or Z axes.

