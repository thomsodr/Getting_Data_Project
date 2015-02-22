
#PART ONE - Merges the training and the test sets to create one data set

#read in all files
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test<-read.table("./UCI HAR Dataset/train/subject_test.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_train<-read.table("./UCI HAR Dataset/test/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

#combine test data files
test<-cbind(sub_test, y_test, x_test)

#combine train data files
train<-cbind(sub_train, y_train, x_train)

#combine train and test
allData<-rbind(test, train)

#read in variable names
names<-read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

#set names with subject, and activity
all_names<-c("subject", "activity", t(names[,2]))

#put variable names at top
names(allData) <- make.names(all_names, unique=TRUE)


#PART TWO - Extracts only the measurements on the mean and stDev

#get indices for columns with 'mean', using fixed = TRUE to exclude MeanFreq
m_indices<-grep("mean()", all_names, fixed = TRUE, ignore.case = FALSE)
#get indices for columns with 'std'
std_indices<-grep("std()", all_names, fixed = TRUE, ignore.case = FALSE)
#subset data frame using m_indices and std_indices
indices<-c(1, 2, m_indices, std_indices)
subset<-allData[,indices]

#PART THREE - Uses descriptive activity names to name activities in data set

#read in file with activity labels
label_file<-read.table("./UCI HAR Dataset/activity_labels.txt")
#put labels in a vector
labels<-label_file[,2]
#make activity column in data frame a factor
subset$activity<-as.factor(subset$activity)
#rename factors
levels(subset$activity)<-labels


#PART FOUR - Appropriately labels the data set with descriptive variable names

#replace periods, duplicates and put in camel case
names(subset)<-gsub(".std...", "Std", names(subset))
names(subset)<-gsub(".std..", "Std", names(subset))

names(subset)<-gsub(".mean...", "Mean", names(subset))
names(subset)<-gsub(".mean..", "Mean", names(subset))

names(subset)<-gsub("BodyBody", "Body", names(subset))


#PART FIVE - Creates a second, independent tidy data set with the average
#               of each variable for each activity and each subject

library(plyr)
#calculate colummeans as a function of subject and activity
sub_means<-ddply(subset, .(subject, activity), numcolwise(mean))
#write sub_means to a table
write.table(sub_means, file = "tidy_data_table.txt", row.names=FALSE)



