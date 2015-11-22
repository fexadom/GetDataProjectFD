# Code book for the Getting and Cleaning Data project
This project reads from the UCI Human Activity Recognition Using Smartphones Data Set and generates a tidy data set. The file *run_analysis.R* contains the R code to accomplish this.

#Instructions
The script run_analysis.R must be in the same folder as the UCI data set, it assumes that this data set is in the "UCI HAR Dataset" folder. This can be changed though by
changing the **UCI_dataset_home** variable in the script.

The script reads the following file within the "UCI HAR Dataset" folder:
* Train files
 * /train/subject_train.txt: Subject data
 * /train/X_train.txt: Processed data
 * /train/y_train.txt: Activity data
* Test files
 * /test/subject_test.txt: Subject data
 * /test/X_test.txt: Processed data
 * /test/y_test.txt: Activity data
* Metadata
 * features.txt: Features names and column numbers within the processed data files
 * activity_labels.txt: Descriptive names for recorded activities

After running the run_analysis.R script it will generate a tidy_data_set.txt files with a summary of the data obtained from the above listed files.

#Output: tidy_data_set.txt
The tidy_data_set.txt uses descriptive names for all variables and activities. These names were extracted directly from the features.txt and activity_labels.txt files. The tidy_data_set.txt contains summarized data of the unified train and test data sets; it contains a table of the mean, by subject and then by activity, of the following measured variables:
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyAccMag-mean()
* tGravityAccMag-mean()
* tBodyAccJerkMag-mean()
* tBodyGyroMag-mean()
* tBodyGyroJerkMag-mean()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyAccMag-mean()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroJerkMag-mean()
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-std()
* tGravityAccMag-std()
* tBodyAccJerkMag-std()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-std()
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-std()
