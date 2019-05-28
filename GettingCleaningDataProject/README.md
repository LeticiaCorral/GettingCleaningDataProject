The purpose of the project is studying the info and the files from "Human Activity Recognition Using Smartphones" and summarize the data in one file with the relevant information.  

To elaborate this data set we have the files:
- activity_labels.txt: Contains identifiers and names of the activities
- features.txt: Contains identifiers and names of the features
- two groups of observations: test and train. For each group we have:
		- subject.txt (subject_test.txt and subject_train.txt respectively): Contains the identifier of the volunteer in the test or train group, for each observation
		- y.txt (y_test.txt and y_train.txt respectively): Contains the identifier of the activity for each observation
		- x.txt (x_test.txt and x_train.txt respectively): Contains the observations. There are one column for each feature of the observation.
		
The purpose is create a file with the volunteer id, the volunteer group (test or train), the activity name and the feaures referring to means and typical deviations

Packages used: dplyr, reshape2

Reading activities configuration file

	read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep= " ")
	
Reading features configuration file. We select mean and std features. (id and names)

	read.table("UCI HAR Dataset/features.txt", header = FALSE, sep= " ")
	grep(".*mean.*|.*std.*", df_features[,2])
	
Reading subject files (test and train) to get the subject in each observation. In the result, we add a column with the group (test or train)

	read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep= " ")
	mutate(df_subject_test, group = "test")
	
	read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep= " ")
	mutate(df_subject_train, group = "train")
	
Reading activities-observation file (test and train) to get the activity id in each observation

	read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep= " ")
	read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep= " ")
	
Reading features-observation file (test and train) to get the measures for each feature and observation. We don't read all columns. We select columns which number column is in the selected features (mean and std features)

	read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
	df_measures_test[, v_featuresSelected]
	
	read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)
	df_measures_train[, v_featuresSelected]

For the result data frame with the observations, we add subject, group subject, activity id and activity name. We create a factor with activity names
We put the name of the column according to the selected features.

	factor(df_activity_row_test$activityid, levels = df_activity[,1], labels = df_activity[,2])
	factor(df_activity_row_train$activityid, levels = df_activity[,1], labels = df_activity[,2])

	cbind(df_subject_test, df_activity_row_test, df_measures_test2)
	cbind(df_subject_train, df_activity_row_train, df_measures_train2)

Merge test and train info
	
	rbind(df_test, df_train)
	
Write result file, resultDataSet.txt

	write.table(allData, "resultDataSet.txt", sep=" ", row.names = FALSE, quote = FALSE)

To get the mean of each feature columns, save the result in resultAverage.txt

	melt(allData, id = c("subject", "group", "activityid"))
	dcast(mym, subject + group + activityid ~ variable, mean)
	write.table(allDataAverage, "resultAverage.txt", sep=" ", row.names = FALSE, quote = FALSE)
