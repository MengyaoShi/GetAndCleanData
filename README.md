# GetAndCleanData

##Background
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. 

##How Files are arranged

###run_analysis.R script is the script does the analysis, it has several parts:

 1)Download dataset and gather training, testing sets separately
 
 2)Columns contain ActivityID was originally labeled as "V1", "V2"... I renamed it to "ActivityID" which range from 1 to 6
 and each means a different activity like "walking" "lying" and so on. Similar procedure was applied to subject, which range 
 from 1 to 30 meaning volunteers from 1 to 30.
 
 ActivityID is later translated to "activity" which is "Walking","Walking Upstairs"...
 
 3)Bind training and testing set together as "trainAndtest" table. I renamed variables accroding to features.txt and make sure each variable
 has an approximate descriptive name
 
 4)From "trainAndtest", I create a new tidy data set named "NewTable.txt" with the average of each variable for each activity and each subject.
 Notice new table is orderd according to "ActivityID"(or "activity") and "subject".
 
 
 
###NewTable.txt
 
 This is the result with average of each variable for each activity and each subject.
 
###testAndtrain.txt
 
 If you are curious how NewTable.txt is created, it is based on "testAndtrain.txt". This is a file before final step, contains both training and
 testing set; contains only the measurements on the mean and standard deviation for each measurement.
 
###Codebook.md
 
 Contains variables explanations and how original data set is transformed to current tidy data.

