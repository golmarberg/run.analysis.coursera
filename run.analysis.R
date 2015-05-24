# run.analysis.coursera
#run_analysis

library(car)
library(plyr)
library(dplyr)
library(reshape)
library(reshape2)


## Download and unzip dataset archive
datasetPath <- 'UCI HAR Dataset'

downloadDataset <- function() {
  url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url, 'Dataset.zip')
  
  unzip('Dataset.zip')
}

## read & merge test and train
read.data<-function(file, name= FALSE){
  data<-data.frame()
  
  for(folder in c('test', 'train')){
    filename<-sprintf('%s/%s/%s/%s.txt', datasetPath, folder, file, folder)
    data <- rbind(data, read.table(filename))
  }
  if (name != FALSE){
    colnames(data)<- name
  
  }
  data
}
#download dataset
downloadDataset()

#read Features
features <-read.table(sprintf("%s/features.txt", datasetPath))

#Read activity labels
activityLabels <- read.table(sprintf('%s/activity_labels.txt', datasetPath))

##Read files
Y_test<-read.table(sprintf('%s/test/y_test.txt',datasetPath))
Y_train<-read.table(sprintf('%s/train/y_train.txt',datasetPath))

X_test<-read.table(sprintf('%s/test/X_test.txt',datasetPath))
X_train<-read.table(sprintf('%s/train/X_train.txt',datasetPath))

Sub_test<-read.table(sprintf('%s/test/subject_test.txt',datasetPath))
Sub_train<-read.table(sprintf('%s/train/subject_train.txt',datasetPath))

## bind files
X_bound <- rbind(X_test, X_train)
Y_bound <- rbind(Y_test, Y_train)
Sub_bound <- rbind(Sub_test,Sub_train)


## rename x columns using transpose of features
t_feat<- t(features)
colnames(X_bound)<- t_feat[2,]

##recode activity labels
Y_bound$V1<- recode(Y_bound$V1, "1:1 ='walking';2:2 ='walking_upstairs';3:3 = 'walking_downstairs';4:4='sitting';5:5='standing';6:6='laying'")

##rename y and sub columns
colnames(Y_bound)<-"Activity_lables"
colnames(Sub_bound)<- "Subject"


## extract columns with mean,std
data_set<- subset(X_bound, select = grep("mean|std|Mean", colnames(X_bound)))

## delete column pretaining to frequancy 
new_data<- data_set[,-grep("freq|Freq", colnames(data_set))]

##bind all columns
Full_Data<- cbind(Sub_bound,Y_bound,new_data)

## create new tidy data set with average of each variable for each subject+activity

tidy_data2<- aggregate(Full_Data, by=list(Full_Data$Subject, Full_Data$Activity_lables), FUN=mean)

tidy_data2$Activity_lables <- NULL
tidy_data2$Subject <- NULL
names(tidy_data2)[names(tidy_data2)=='Group.1']<- 'Subject'
names(tidy_data2)[names(tidy_data2)=='Group.2']<- 'Activity_lables'

## write files
write.table(Full_Data, "Full_Data", row.names= FALSE)
write.table(tidy_data2, "Tidy_Data", row.names= FALSE)
