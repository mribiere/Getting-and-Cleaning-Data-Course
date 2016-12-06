
Initial data are extracted from the Human Activity Recognition Using Smartphones Dataset
This dataset contains:
        - two folders for the training and testing data, each folder contains:
                - a data text file (subject_train.txt or subject_test.txt) giving the ID of the subject for each observation
                - a data text file (y_train.txt or y_test.txt) giving the ID of the activity for each observation
                - a data text file (X_train.txt or X_test.txt) giving the measurements for each observation
        - one file (features.txt) giving the type of measurements made during the experimentation
        - one file (activity_labels.txt) giving the labels of the activity observed during the experimentation

-------
The R script for the Getting and Cleaning Data Coursera course Project compute the following actions on the different datasets available in the UCI HAR Dataset folder: 

- make use of the dplyr library
- Download the dataset and create a directory under the R working directory where the different files containing the data are available
- Load the features used for the different activity measurements into a table via the features.txt file 
- Load and create data structures for the training and testing datasets with for each: the measurements, activities and subjects files
- Merge the two datasets to have access to the entire set of data collected during the experience (called AllData). We keep only the measurements columns which reflect a mean or a standard deviation into AllDataFiltered
- Load the activities txt file to give readable values to the activity column of the last computed dataset called AllDataFiltered
- Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. 
- Create a txt file for the tidy dataset called Tidy_dataset.txt.

------
Data represented in the final tidy dataset has 68 variables and 126 observations, it consists of the average (mean) value of each variable for each subject and activity pair

Index of the experimentation:
- subject
- activity

Measurements: 
timeBodyAccelerometer-mean()-X
timeBodyAccelerometer-mean()-Y
timeBodyAccelerometer-mean()-Z
timeBodyAccelerometer-std()-X
timeBodyAccelerometer-std()-Y
timeBodyAccelerometer-std()-Z
timeGravityAccelerometer-mean()-X
timeGravityAccelerometer-mean()-Y
timeGravityAccelerometer-mean()-Z
timeGravityAccelerometer-std()-X
timeGravityAccelerometer-std()-Y
timeGravityAccelerometer-std()-Z
timeBodyAccelerometerJerk-mean()-X
timeBodyAccelerometerJerk-mean()-Y
timeBodyAccelerometerJerk-mean()-Z
timeBodyAccelerometerJerk-std()-X
timeBodyAccelerometerJerk-std()-Y
timeBodyAccelerometerJerk-std()-Z
timeBodyGyroscope-mean()-X
timeBodyGyroscope-mean()-Y
timeBodyGyroscope-mean()-Z
timeBodyGyroscope-std()-X
timeBodyGyroscope-std()-Y
timeBodyGyroscope-std()-Z
timeBodyGyroscopeJerk-mean()-X
timeBodyGyroscopeJerk-mean()-Y
timeBodyGyroscopeJerk-mean()-Z
timeBodyGyroscopeJerk-std()-X
timeBodyGyroscopeJerk-std()-Y
timeBodyGyroscopeJerk-std()-Z
timeBodyAccelerometerMagnitude-mean()
timeBodyAccelerometerMagnitude-std()
timeGravityAccelerometerMagnitude-mean()
timeGravityAccelerometerMagnitude-std()
timeBodyAccelerometerJerkMagnitude-mean()
timeBodyAccelerometerJerkMagnitude-std()
timeBodyGyroscopeMagnitude-mean()
timeBodyGyroscopeMagnitude-std()
timeBodyGyroscopeJerkMagnitude-mean()
timeBodyGyroscopeJerkMagnitude-std()
frequencyBodyAccelerometer-mean()-X
frequencyBodyAccelerometer-mean()-Y
frequencyBodyAccelerometer-mean()-Z
frequencyBodyAccelerometer-std()-X
frequencyBodyAccelerometer-std()-Y
frequencyBodyAccelerometer-std()-Z
frequencyBodyAccelerometerJerk-mean()-X
frequencyBodyAccelerometerJerk-mean()-Y
frequencyBodyAccelerometerJerk-mean()-Z
frequencyBodyAccelerometerJerk-std()-X
frequencyBodyAccelerometerJerk-std()-Y
frequencyBodyAccelerometerJerk-std()-Z
frequencyBodyGyroscope-mean()-X
frequencyBodyGyroscope-mean()-Y
frequencyBodyGyroscope-mean()-Z
frequencyBodyGyroscope-std()-X
frequencyBodyGyroscope-std()-Y
frequencyBodyGyroscope-std()-Z
frequencyBodyAccelerometerMagnitude-mean()
frequencyBodyAccelerometerMagnitude-std()
frequencyBodyAccelerometerJerkMagnitude-mean()
frequencyBodyAccelerometerJerkMagnitude-std()
frequencyBodyGyroscopeMagnitude-mean()
frequencyBodyGyroscopeMagnitude-std()
frequencyBodyGyroscopeJerkMagnitude-mean()
frequencyBodyGyroscopeJerkMagnitude-std()