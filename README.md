---
title: "README"
author: "Vishnu Gupta"
date: "Saturday, April 25, 2015"
# runanalysis
---

The file processes the data available for a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

The R programming Script does the follwoing 
=========================================

----------------------------------------------
Data Processing

activities and features are combined into one set.
This information is then merged with measurement in x data frame, giving activity, features and measurement information together.
The Measurements names have special characters "(" and ")" which are cleaned for processing.
After this the data was melted into tidy long dataset for all the measurements, measurements becoming the values.
Measurememnts are broken into two sets angular and non-angular based on the information on the features.
Measurements features have three levels of information, this is broken down by strsplit function for both angular and non-angular.
- There could be better way of doing it. But for now, to keep it simple during the available time, I used this approach.
The angular and non-angular datasets are merged to make a complete dataset into "mdfinal".


For requirement 2- 
the dataset was reduced using subset for "mean","std" of the measurements.

For requirement 3- 
Descripting names were applied to the column name "activityname" based on the information available in the activities dataset.

For requirement 4 - 
The has already been tidied with melting for each measuement. Variable names were accordingly changed to ensure the proper names.

For Requirement 5 -
For the final data set created in above, aggregate function was used to create tidy dataset with average of each variable for each activity and each subject



The Code Book- 

The code uses the following libraries
library(dplyr)
library(reshape2)
library(memisc)

Variables 
subject - data frame, Stores All subject information with ID


- Get the following data from both test and training sets.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt', 'total_acc_y_train.txt' and 'total_acc_z_train.txt'  

- 'train/Inertial Signals/body_acc_x_train.txt','body_acc_y_train.txt','body_acc_z_train.txt' 

- 'train/Inertial Signals/body_gyro_x_train.txt','body_gyro_y_train.txt','body_gyro_y_train.txt'

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/Inertial Signals/total_acc_x_test.txt', 'total_acc_y_test.txt' and 'total_acc_z_test.txt'  

- 'test/Inertial Signals/body_acc_x_test.txt','body_acc_y_test.txt','body_acc_z_test.txt' 

- 'test/Inertial Signals/body_gyro_x_test.txt','body_gyro_y_test.txt','body_gyro_y_test.txt'

Merged data is available at 

- 'final/subject.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'final/x.txt' data sets

- 'final/y.txt' labels

- 'final/Inertial Signals/total_acc_x.txt', 'total_acc_y.txt' and 'total_acc_z.txt'  

- 'final/Inertial Signals/body_acc_x.txt','body_acc_y.txt','body_acc_z.txt' 

- 'final/Inertial Signals/body_gyro_x.txt','body_gyro_y.txt','body_gyro_y.txt'

features - all features values are stored in this.
meltdt - melted tiny data set is stored into this.

sss, sss2 - Stores the stripped columns from field variable.

xfinal - final dataset with including subject and activity information.

mdt_ms - Final combined melted data set for only mean and standard deviation measure variables, with columns
("rowid", "activityID" ,"SubjectID","Originalvar","value","sensorsignal", "measurevariable", "measureofaxis" , "activityname" )


tidyaveragedata is final data set output for requirement 5 delivering the average of each variable for each activity and each subject


