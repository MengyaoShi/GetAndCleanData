In Readme.md there is a clear description on structure of my R script. I will focus more on explaining each variable's meaning, and how 
this tidy dataset is obtained

#Variables
`subject.train`: subjects of training set, with dimension: 7352 by 1

`X.train`:training set load from 'train/X_train.txt',

`y.train`: training labels of activityID, from 1 to 6 means different activities

`train` is obtained from binding subject.train, X.train, and y.train into a table. train is basically training set

similar explanation applies to testing set variables.

`activityID`

`trianAndtest`: data.frame training and testing set bind together

`activity.labels`: data.frame, dimension 6 by 2 with each activity ID map to an activity, for example 1 'Walking'

`activityID`, `activity`: interger range from 1 to 6 versus 6 different kind of activities.

`trainAndtest$isTest`: bool value denoting if data is originally from training or testing set

`NewTable`: data.frame tidy data set with the average of each variable for each activity and each subject.

In trainAndtest all variables are labeld using features.txt data, and each looks like `tBodyAcc-mean()-X` or `*Gyro*` etc.

Units have same explanation/Units as file come along with data.

total_acc_x_train: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

body_acc_x_train : The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

body_gyro_x_train: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


#How workflow was

I first get training set data combined with "subjects" and "activityID", and absorb everything into `train`, similar procedure is 
applied on testing set.
Then I combine the two, and notice labeling are "V1" "V2" "V3..., therefore I relabel variables using features.txt information

After this is done, I extract information we are interested: mean and standard deviation of each variable.
 
 Another thing I did is translate activity ID 1 to 6 to real activities, such as "Walking", "walking upstairs"..., and also differ training set and
 testing set by a bool value `isTest`. FALSE means the row of data is training set, otherwise, it is testing data.
 
 At this point I already have a data.frame cleaned up called `trainAndtest`, what I did is creates a second, independent tidy data set with the average of
 each variable for each activity and each subject.


