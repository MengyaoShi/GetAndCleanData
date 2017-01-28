#Download file
if(!file.exists("./FinalData")){dir.create("./FinalData")}
Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, destfile = './FinalData/FinalData.zip')
unzip(zipfile = './FinalData/FinalData.zip',exdir = "./FinalData")

##Following code obtains train and test set, and rename some parameters use descriptive names.
subject.train<-read.table('./FinalData/UCI HAR Dataset/train/subject_train.txt')
names(subject.train)<- 'subject'
X.train<-read.table('./FinalData/UCI HAR Dataset/train/X_train.txt')

y.train<-read.table('./FinalData/UCI HAR Dataset/train/y_train.txt')
names(y.train)<-'activityID'

#Bind train and test set separately, and rename parameters using activity_labels.txt
train<-cbind(subject.train, y.train, X.train)
train$isTest<-FALSE
activity.labels<-read.table('./FinalData/UCI HAR Dataset/activity_labels.txt')
features<-read.table('./FinalData/UCI HAR Dataset/features.txt')

X.test<-read.table('./FinalData/UCI HAR Dataset/test/X_test.txt')
y.test<-read.table('./FinalData/UCI HAR Dataset/test/y_test.txt')
names(y.test)<-'activityID'
subject.test<-read.table('./FinalData/UCI HAR Dataset/test/subject_test.txt')
names(subject.test)<-'subject'
test<-cbind(subject.test,y.test,X.test)

#Add one new column to differ whether it is originally from train or test set
test$isTest<-TRUE

#1.Merges the training and the test sets to create one data set.
trainAndtest<-rbind(train, test)

#4.Appropriately labels the data set with descriptive variable names.
features[,'V2']<-sapply(features[,'V2'], as.character)
for(i in c(1:561)){
  colnames(trainAndtest)[i+2]<-features$V2[i]
}

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
c<-grep('*mean*|*std*', features$V2)
c<-c+2
trainAndtest<-trainAndtest[,c(1,2,c,564)]

#3.Uses descriptive activity names to name the activities in the data set
activity.labels[,'V2']<-sapply(activity.labels[,'V2'], as.character)
for(i in 1:length(trainAndtest$activityID)){
  trainAndtest$newActivity[i]<-(activity.labels$V2[trainAndtest$activityID[i]])
}
trainAndtest<-trainAndtest[, c(1,2,83, 82,3:81)]

#Write trainAndtest into a table
write.table(trainAndtest,"trainAndtest.txt", row.names = FALSE)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
NewTable<-aggregate(. ~subject+activityID+newActivity, trainAndtest[,c(1,2,3,5:83)], mean)

write.table(NewTable,"NewTable.txt",row.names = FALSE)
