setwd(dir="E:\\Getting and cleaning data\\project")

# pre on colnames

features <- read.table("UCI HAR Dataset/features.txt")
features <-gsub(pattern="\\(|\\)", x=features[,2], 
                replacement="")

Data_names <- c("subject","activity",gsub("-", ".", features, perl = TRUE))

# read data

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
X_train <- cbind(subject_train,activity_train,X_train)

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
X_test <- cbind(subject_test,activity_test,X_test)

activity <- read.table("UCI HAR Dataset/activity_labels.txt")

# Merges the training and the test sets to create one data set
colnames(X_test) <- Data_names
colnames(X_train) <- Data_names
Merge_data <- rbind(X_train,X_test)

# Extracts only the measurements on the mean and standard deviation for each measurement
Mean.names <- grep("mean", Data_names) 
Std.names <- grep("std", Data_names)
Merge.names <-union(Mean.names,Std.names)
Merge.names <-union(c(1,2),Merge.names)
Data <- Merge_data[,Merge.names]

# labels the data set with descriptive activity names

Data$activity<-activity[Data$activity,2]

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 
Data.result <- aggregate(Data[3:81],by=list(Data$activity,Data$subject),FUN=mean)




