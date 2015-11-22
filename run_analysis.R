# I will use data.table instead of data.frame, they are much faster!
library(data.table)

#Use dplyr library
library(dplyr)

#This script assumes the data set is in "./UCI HAR Dataset"
UCI_dataset_home = "./UCI HAR Dataset"

#Fetch the training set
subject_train = fread(paste(UCI_dataset_home,"/train/subject_train.txt",sep=""))
X_train = fread(paste(UCI_dataset_home,"/train/X_train.txt",sep=""))
y_train = fread(paste(UCI_dataset_home,"/train/y_train.txt",sep=""))

#Fetch the test set
subject_test = fread(paste(UCI_dataset_home,"/test/subject_test.txt",sep=""))
X_test = fread(paste(UCI_dataset_home,"/test/X_test.txt",sep=""))
y_test = fread(paste(UCI_dataset_home,"/test/y_test.txt",sep=""))

##TASK 1: Merges the training and the test sets to create one data set
subject = rbind(subject_train,subject_test)
X = rbind(X_train,X_test)
y = rbind(y_train,y_test)

##TASK 2: Extracts only the measurements on the mean and standard deviation for each measurement
#Extract feature names and indexes table
features = fread(paste(UCI_dataset_home,"/features.txt",sep=""))

#Filter only the features that represent the mean and std of the measured variables
feat_mean = filter(features,grepl("mean()",V2,fixed=TRUE))
feat_std = filter(features,grepl("std()",V2,fixed=TRUE))

#Get the respective indexes and names
indexes_mean = feat_mean[,V1]
indexes_std = feat_std[,V1]
indexes_mean_std = c(indexes_mean,indexes_std)
names_mean_std = features[indexes_mean_std,V2]

#Extract only the columns with mean and std values
X_mean_std = select(X,indexes_mean_std)
#Give the columns a discriptive name

#Clean names of unwanted characters
names_mean_std <- gsub("-","_",names_mean_std,fixed=TRUE)
names_mean_std <- gsub("()","",names_mean_std,fixed=TRUE)
#set names to columns
setnames(X_mean_std,names_mean_std)

##TASK 3: Uses descriptive activity names to name the activities in the data set
#Fetch descriptive activity names
activity_labels = fread(paste(UCI_dataset_home,"/activity_labels.txt",sep=""))
#Join the activities with their descriptive names
activities_descriptive = full_join(y,activity_labels)

#Add a column to the data set called "activity" with the respective and descriptive activity
X_mean_std[,activity := activities_descriptive$V2]

##TASK 4: Appropriately labels the data set with descriptive variable names
#At this point all columns in the data set are appropriately labeled
#as a consequence of the "colnames(X_mean_std) <- names_mean_std" line in Task 2.
#Also, the activity column contains descriptive names instead of id values.

##Task 5: Create an independent tidy data set with the average of each variable for each activity and each subject
#Add a column to the data set called "subject" with the respective subject id
X_mean_std[,subject := subject$V1]

#arrange by subject
X_mean_std = arrange(X_mean_std,subject)

#Group by subject and activity
gb = group_by(X_mean_std,subject,activity)

#melt arranged data set using all measured variables
x_melt <- melt(gb,id=c("subject","activity"),measure.vars=names_mean_std)

#cast the dataset to obtain the desired summary
tidy_data_set = dcast(x_melt,subject + activity ~ variable,mean)

#write dataset to disk
write.table(tidy_data_set,"./tidy_data_set.txt",row.names = FALSE)