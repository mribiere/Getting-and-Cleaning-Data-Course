
library(plyr)
library(dplyr)


filename <- "getdata_dataset.zip"

## Download the dataset, unzip and create the directory UCI HAR Dataset
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}
#####################################################################
## 1 - Merges the training and the test sets to create one data set.
#####################################################################

## Create a table with the name of the features used for the test and train dataset
        features <- read.table("UCI HAR Dataset/features.txt")
## Transform the features into Strings in order to process them as column names
        featureNames <- as.character(features[,2])

## Read and create the train, trainActivities and trainSubjects datasets
        train <- fread("UCI HAR Dataset/train/X_train.txt",col.names=featureNames)
        trainActivities <- fread("UCI HAR Dataset/train/Y_train.txt", col.names=c("activity"))
        trainSubjects <- fread("UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))

## Merge the three datasets related to the Train Activities representing the data acquired 
## from different subjects on different activities used as a training dataset
        train <- cbind(trainSubjects, trainActivities, train)

## Read and create the test, testActivities and testSubjects datasets
        test <- fread("UCI HAR Dataset/test/X_test.txt",col.names=featureNames)
        testActivities <- fread("UCI HAR Dataset/test/Y_test.txt", col.names=c("activity"))
        testSubjects <- fread("UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))
        
## Merge the three datasets related to the Train Activities representing the data acquired 
## from different subjects on different activities used as a training dataset
        test <- cbind(testSubjects, testActivities, test)

## Merge train and test datasets to combine all data acquired
allData <- cbind(train,test)

#############################################################################################
## 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#############################################################################################

## Filtering columns in the dataset that are not measurement of a mean or standard deviation 
## The corresponding columns are characterized by "mean" or "std" in their name.
## We extract a subset of the allData dataset where the columns are "activity", "subject"
## considered as index of a measurement events and all columns which name contains mean or std.

allDataFiltered <- subset(allData,,grep("activity|subject|mean\\(\\)|std\\(\\)",names(allData)))

################################################################################
## 3 - Uses descriptive activity names to name the activities in the data set
################################################################################
##Create a table with the name of the activities used for the test and train dataset
activities <-read.table("UCI HAR Dataset/activity_labels.txt")

## Using factor to transform the activity code used in the measurement dataset with the name of the activity
allDataFiltered$activity <- factor(allDataFiltered$activity,levels = activities[,1],labels = activities[,2])

################################################################################
## 4 - Appropriately labels the data set with descriptive variable names.
################################################################################

## Transform dataset column names into readable and understandable names
names(allDataFiltered)<-gsub("^t", "time", names(allDataFiltered))
names(allDataFiltered)<-gsub("^f", "frequency", names(allDataFiltered))
names(allDataFiltered)<-gsub("Acc", "Accelerometer", names(allDataFiltered))
names(allDataFiltered)<-gsub("Gyro", "Gyroscope", names(allDataFiltered))
names(allDataFiltered)<-gsub("Mag", "Magnitude", names(allDataFiltered))
names(allDataFiltered)<-gsub("BodyBody", "Body", names(allDataFiltered))

################################################################################
## 5 - From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
################################################################################

## Splits the dataset into groups of data using subject and activity as index to 
## compute the mean function on the remaining dataset columns
tidy_data<-aggregate(. ~subject + activity, allDataFiltered, mean)

## Write the results into a .txt file.
write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)

