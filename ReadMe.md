---
title: "Untitled"
author: "Me"
date: "03/05/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting and Cleaning Data Week 4 Course Project

### Data Description
The variables in X are sensor signals measured with waist-mounted smartphone for 30 subjects. 
The variable in Y indicates the activity that the subjects performed during recording.

### Code Explanation
The code combines the training and testing datasets and extracts the variables estimated from the mean and standard deviation to create another dataset with the averages for each subject and activity type.

### New dataset (Tidy Dataset)
The new dataset generated contains variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### Code Description
Read train and test datasets into R environment. Read variable names into R environment. Read subject indexes into R environment.

1. Merge the training and testing datasets to create one dataset. Use command 'rbind' to combine the training and testing sets.
2. Extract only the variables estimated on the mean and standard deviation for each measurement. Use 'grep' command to get column indexes for variable names containing "mean()" or "std()"
3. Use descriptive activity names to name the activities in the data set. Convert activity labels to characters.
4. Appropriately label the data set with descriptive variable names. Give the selected descriptive names to variable columns.
5. From the data set in step 4, create  a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with commands 'group_by' and 'summarize_each' in the dplyr package.