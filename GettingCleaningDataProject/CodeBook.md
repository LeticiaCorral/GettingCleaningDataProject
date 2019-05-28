We hav 30 subjects id, divided in two groups: test and train.
21 subjects in train group
9 subjects in test group

We have 5 activities: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

We have 561 features. The selected features are = 79

tBodyAcc-mean()-X/Y/Z --> Mean of the time variable for body acceleration on X/Y/Z axis. 
tBodyAcc-std()-X/Y/Z --> Standard Deviation of the time variable for body acceleration on X/Y/Z axis  
tGravityAcc-mean()-X/Y/Z --> Mean of the time variable for gravity acceleration on X/Y/Z axis 	 
tGravityAcc-std()-X/Y/Z	--> Standard Deviation of the time variable for body acceleration on X/Y/Z axis   
tBodyAccJerk-mean()-X/Y/Z --> Mean of Jerk signals derived from acceleration on X/Y/Z axis
tBodyAccJerk-std()-X/Y/Z --> Standard Deviation	of Jerk signals derived from acceleration on X/Y/Z axis 
tBodyGyro-mean()-X/Y/Z--> Mean of Angular signals on X/Y/Z axis 
tBodyGyro-std()-X/Y/Z --> Standard Deviation of Angular signals on X/Y/Z axis 
tBodyGyroJerk-mean()-X/Y/Z --> Mean of Jerk signals derived from angular velocity on X/Y/Z axis
tBodyGyroJerk-std()-X/Y/Z --> Standard Deviation of Jerk signals derived from angular velocity on X/Y/Z axis
 
tBodyAccMag-mean() --> Mean of the magnitude body Acceleration 
tBodyAccMag-std() --> Standard Deviation of the magnitude for body Acceleration 
tGravityAccMag-mean() --> Mean of the magnitude for gravity Acceleration 
tGravityAccMag-std() --> Standard Deviation of the magnitude for gravity Acceleration 
tBodyAccJerkMag-mean() --> Mean of Time Variable magnitude for jerk signals from Acceleration 
tBodyAccJerkMag-std() --> Standard Deviation of the time variable for magnitude of jerk signals from Acceleration 
tBodyGyroMag-mean() --> Mean of the magnitude of the Angular velocity time variable
tBodyGyroMag-std() --> Standard Deviation of the magnitude of the Angular velocity time variable
tBodyGyroJerkMag-mean()	--> Mean of Time Variable magnitude for angular velocity jerk signals 
tBodyGyroJerkMag-std() --> Standard Deviation of Time Variable magnitude for angular velocity jerk signals 

fBodyAcc-mean()-X/Y/Z --> Mean for frequency variable for acceleration on X/Y/Z axis 
fBodyAcc-std()-X/Y/Z --> Standard Deviation for frequency variable for acceleration on X/Y/Z axis 
fBodyAcc-meanFreq()-X/Y/Z --> Mean for frequency variable for acceleration on X/Y/Z axis 
fBodyAccJerk-mean()-X/Y/Z --> Mean for frequency variable jerk signals for acceleration on X/Y/Z axis
fBodyAccJerk-std()-X --> Standard Deviation for frequency variable jerk signals for acceleration on X/Y/Z axis 
fBodyAccJerk-meanFreq()-X/Y/Z --> Mean of the jerk signals for the frequency variable when accelerating on X/Y/Z axis 
fBodyGyro-mean()-X/Y/Z --> Mean of the for the frequency variable for angular velocity on X/Y/Z axis 
fBodyGyro-std()-X/Y/Z --> Standard Deviation of the for the frequency variable for angular velocity on X/Y/Z axis 
fBodyGyro-meanFreq()-X/Y/Z --> Mean of the for the frequency variable for angular velocity on X/Y/Z axis 

fBodyAccMag-mean() --> Mean for	frequency variable of the magnitude for body Acceleration 
fBodyAccMag-std() --> Standard Deviation for frequency variable of the magnitude for body Acceleration
fBodyAccMag-meanFreq() --> Mean for the frequency variable of the magnitude for acceleration 
fBodyBodyAccJerkMag-mean() --> Mean of Frequency Variable magnitude for jerk signals from Acceleration 
fBodyBodyAccJerkMag-std() --> Standard Deviation of Frequency Variable magnitude for jerk signals from Acceleration 

fBodyBodyAccJerkMag-meanFreq() --> Mean of Frequency Variable magnitude for jerk signals from Acceleration 
fBodyBodyGyroMag-mean()	--> Mean of the magnitude of the Angular velocity frequency variable
fBodyBodyGyroMag-std() --> Standard Deviation of the magnitude of the Angular velocity frequency variable

fBodyBodyGyroMag-meanFreq()	--> Mean of the magnitude of the Angular velocity frequency variable
fBodyBodyGyroJerkMag-mean()	--> Mean of Frequency Variable magnitude for angular velocity jerk signals 
fBodyBodyGyroJerkMag-std() --> Standard Deviation of Frequency Variable magnitude for angular velocity jerk signals 
fBodyBodyGyroJerkMag-meanFreq()	--> Mean of Frequency Variable magnitude for angular velocity jerk signals 


We have 2947 observations in the test group and 7352 in the train group

The result data set will have the columns:
subject --> volunteer id
Group --> Subject Group: Test or Train
activityname --> Activity Name
Features --> The features described above

Finally, we will have a second data set with the average features for each subject and activity