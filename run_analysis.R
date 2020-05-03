library(dplyr)
library(data.table)

# read training data
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train<-read.table("./UCI HAR Dataset/train/Subject_train.txt")

# read testing data
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test<-read.table("./UCI HAR Dataset/test/Subject_test.txt")

# read features (X)
variable_names<-read.table("./UCI HAR Dataset/features.txt")

# read activity_labels (Y)
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

# TASK 1: merge the training and testing sets into one set
X_merged<-rbind(X_train,X_test)
Y_merged<-rbind(Y_train,Y_test)
Subject_merged<-rbind(Subject_train,Subject_test)

# TASK 2: extract only the measurements on mean and sd for each measurement
selected_variables<-variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_merged<-X_merged[,selected_variables[,1]]

# TASK 3: use descriptive activity names to name the activities in the dataset
colnames(Y_merged)<-"activity"
Y_merged$activitylabel<-factor(Y_merged$activity,labels=as.character(activity_labels[,2]))
activitylabel<-Y_merged[,-1]

# TASK 4: label the dataset with descriptive variable names
colnames(X_merged)<-variable_names[selected_variables[,1],2]

# TASK 5: Create a second independent tidy data set with the avg of each variable for each activity and each subject
colnames(Subject_merged)<-"subject"
total<-cbind(X_merged,activitylabel,Subject_merged)
total_mean<- total %>% group_by(activitylabel,subject) %>% summarise_each(funs(mean))
write.table(total_mean,file="./tidydata.txt", row.names=FALSE, col.names=TRUE)

