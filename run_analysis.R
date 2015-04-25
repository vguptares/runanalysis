# run_analysis.R
library(dplyr)
library(reshape2)
library(memisc)
temp <- "getdata-projectfiles-UCI HAR Dataset.zip";
######################################## START
# Create Activity and subject set for test and Train
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE);
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE);
subject<-rbind(subject_train,subject_test);
#write.table(subject, "UCI HAR Dataset/final/subject.txt", sep=" ",row.name=FALSE)
names(subject)<-c("SubjectID");
subject$rowid<-1:nrow(subject)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE);
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE);
y<-rbind(y_train,y_test)
#write.table(y, "UCI HAR Dataset/final/y.txt", sep=" ",row.name=FALSE)
names(y)<-c("activityID");
y$rowid<-1:nrow(y)
rm(y_test,x_test)
subjectactivity<-merge(y,subject,by=c("rowid"));
subjectactivity$rowid<-1:nrow(subjectactivity)

########################################  subjectactivity    END


########################################

# Merge acceleration signal data
total_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE);
total_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=FALSE);
total_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE);
total_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE);
total_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header=FALSE);
total_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=FALSE);

total_acc_x<-rbind(total_acc_x_train,total_acc_x_test)
total_acc_y<-rbind(total_acc_y_train,total_acc_y_test)
total_acc_z<-rbind(total_acc_z_train,total_acc_z_test)
rm(total_acc_x_test,total_acc_y_test,total_acc_z_test,total_acc_x_train,total_acc_y_train,total_acc_z_train)
#write.table(total_acc_x, "UCI HAR Dataset/final/Inertial Signals/total_acc_x.txt", sep=" ",row.name=FALSE)
#write.table(total_acc_y, "UCI HAR Dataset/final/Inertial Signals/total_acc_y.txt", sep=" ",row.name=FALSE)
#write.table(total_acc_z, "UCI HAR Dataset/final/Inertial Signals/total_acc_z.txt", sep=" ",row.name=FALSE)

total_acc_x$rowid<-1:nrow(total_acc_x)
total_acc_y$rowid<-1:nrow(total_acc_y)
total_acc_z$rowid<-1:nrow(total_acc_z)

body_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE);
body_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE);
body_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE);
body_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=FALSE);
body_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=FALSE);
body_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=FALSE);

body_acc_x<-rbind(body_acc_x_train,body_acc_x_test)
body_acc_y<-rbind(body_acc_y_train,body_acc_y_test)
body_acc_z<-rbind(body_acc_z_train,body_acc_z_test)
rm(body_acc_x_test,body_acc_y_test,body_acc_z_test,body_acc_x_train,body_acc_y_train,body_acc_z_train);
#write.table(body_acc_x, "UCI HAR Dataset/final/Inertial Signals/body_acc_x.txt", sep=" ",row.name=FALSE)
#write.table(body_acc_y, "UCI HAR Dataset/final/Inertial Signals/body_acc_y.txt", sep=" ",row.name=FALSE)
#write.table(body_acc_z, "UCI HAR Dataset/final/Inertial Signals/body_acc_z.txt", sep=" ",row.name=FALSE)

body_acc_x$rowid<-1:nrow(body_acc_x)
body_acc_y$rowid<-1:nrow(body_acc_y)
body_acc_z$rowid<-1:nrow(body_acc_z)

body_gyro_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE);
body_gyro_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE);
body_gyro_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE);
body_gyro_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=FALSE);
body_gyro_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=FALSE);
body_gyro_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=FALSE);

body_gyro_x<-rbind(body_gyro_x_train,body_gyro_x_test)
body_gyro_y<-rbind(body_gyro_y_train,body_gyro_y_test)
body_gyro_z<-rbind(body_gyro_z_train,body_gyro_z_test)
rm(body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,body_gyro_x_train,body_gyro_y_train,body_gyro_z_train);
#write.table(body_gyro_x, "UCI HAR Dataset/final/Inertial Signals/body_gyro_x.txt", sep=" ",row.name=FALSE)
#write.table(body_gyro_y, "UCI HAR Dataset/final/Inertial Signals/body_gyro_y.txt", sep=" ",row.name=FALSE)
#write.table(body_gyro_z, "UCI HAR Dataset/final/Inertial Signals/body_gyro_z.txt", sep=" ",row.name=FALSE)

body_gyro_x$rowid<-1:nrow(body_gyro_x)
body_gyro_y$rowid<-1:nrow(body_gyro_y)
body_gyro_z$rowid<-1:nrow(body_gyro_z)


##########################################

x_test <- read.table("UCI HAR Dataset/test/x_test.txt",header=FALSE);
x_train <- read.table("UCI HAR Dataset/train/x_train.txt",header=FALSE);
x<-rbind(x_train,x_test)
#write.table(x, "UCI HAR Dataset/final/x.txt", sep=" ",row.name=FALSE)
##################################################    MErging Data sets complete and saved to file.

activities <- read.table("UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE);
names(activities)<-c("activityID","activityname");
features <- read.table("UCI HAR Dataset/features.txt",sep=" ",header=FALSE);
features$V2<-sub("\\(\\)","",features$V2);
features$V2<-sub("\\(","",features$V2);
names(x)<-features[,2];
x$rowid<-1:nrow(x)
xfinal<-merge(x,subjectactivity,by=c("rowid"));
#mer<-subset(mergetestfinal,rowid<2);
meltdt<-melt(xfinal,id=c("rowid","activityID","SubjectID"),measure.vars=features[,2]);
nrow(meltdt)
meltdt$rowid<-1:nrow(meltdt)
meltdt$angle<-grepl("angle",meltdt$variable)
meltdt1<-subset(meltdt,angle==TRUE);
meltdt2<-subset(meltdt,angle==FALSE);
sss<-data.frame(meltdt1$variable, do.call(rbind, strsplit(as.character(meltdt1$variable), split = ",")))
names(sss)<-c("variableval","signal","signalmeasure");
sss$rowid<-1:nrow(sss)
sss$signalmeasureof<-"";
sss$signal<-sub("\\(","",sss$signal);
sss$signalmeasure<-sub("\\)","",sss$signalmeasure);
meltdt2$variable<-paste(meltdt2$variable,"-TEST")
sss2<-data.frame(meltdt2$variable, do.call(rbind, strsplit(as.character(meltdt2$variable), split = "-")))
names(sss2)<-c("variableval","signal","signalmeasure","signalmeasureof","remove");
sss2<-sss2[c("variableval","signal","signalmeasure","signalmeasureof")]
sss$rowid<-1:nrow(sss)
sss2$rowid<-1:nrow(sss2)
meltdt1$rowid<-1:nrow(meltdt1)
meltdt2$rowid<-1:nrow(meltdt2)

mdt1<-merge(meltdt1,sss,by=c("rowid"))
mdt2<-merge(meltdt2,sss2,by=c("rowid"))
mdfinal<-rbind(mdt1,mdt2);
mdfinal$rowid<-1:nrow(mdfinal);
rm(meltdt1,meltdt2);
mdt_ms<-subset(mdfinal,signalmeasure %in% c("mean","std"),select=c("rowid","activityID","SubjectID","variable","value","signal","signalmeasure","signalmeasureof"));
mdt_ms$activityname<-activities$activityname[match(mdt_ms$activityID,activities$activityID)];
rm(mdfinal)
names(mdt_ms)<-c("rowid","activityID","SubjectID","Originalvar","value","sensorsignal","measurevariable","measureofaxis","activityname");
nrow(mdt_ms)
tidyaveragedata<-aggregate(mdt_ms$value, list(SubjectID=mdt_ms$SubjectID,activityID=mdt_ms$activityID,measurevariable=mdt_ms$measurevariable), FUN=mean);
write.table(tidyaveragedata, "tidyaveragedata.txt", sep=" ",row.name=FALSE)
nrow(tidyaveragedata)