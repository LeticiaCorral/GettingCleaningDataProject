library(dplyr)
library(reshape2)

# 1. Reading activities file: 

df_activity <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep= " ")
df_activity.colnames <- c("activityid", "activityname")

# 2. Reading features file. 
df_features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep= " ")

# select features which names have "mean" or "std" string
v_featuresSelected <- grep(".*mean.*|.*std.*", df_features[,2])
v_featuresSelected.names <- df_features[v_featuresSelected,2]

# 3. Reading subject files (test and train)
df_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep= " ")
df_subject_test <- mutate(df_subject_test, group = "test")
colnames(df_subject_test) <- c("subject", "group")
df_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep= " ")
df_subject_train <- mutate(df_subject_train, group = "train")
colnames(df_subject_train) <- c("subject", "group")

# 4. Reading activities-observation file (test and train). We create a factor with acivity description
df_activity_row_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep= " ")
colnames(df_activity_row_test) <- c("activityid")
df_activity_row_test$activityid <- factor(df_activity_row_test$activityid, levels = df_activity[,1], labels = df_activity[,2])

df_activity_row_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep= " ")
colnames(df_activity_row_train) <- c("activityid")
df_activity_row_train$activityid <- factor(df_activity_row_train$activityid, levels = df_activity[,1], labels = df_activity[,2])

# 5. Reading features-observation file (test and train). 
df_measures_test <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
df_measures_train <- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)

# We only read column number in the features selected
df_measures_test2 <- df_measures_test[, v_featuresSelected]
colnames(df_measures_test2) <- v_featuresSelected.names
df_measures_train2 <- df_measures_train[, v_featuresSelected]
colnames(df_measures_train2) <- v_featuresSelected.names

# 6. We created a new data frame with the subjects, the activities and measures
df_test <- cbind(df_subject_test, df_activity_row_test, df_measures_test2)
df_train <- cbind(df_subject_train, df_activity_row_train, df_measures_train2)

# 7. Join data frame test y train
allData <- rbind(df_test, df_train)

# 8. Write he result in a .txt file
write.table(allData, "resultDataSet.txt", sep=" ", row.names = FALSE, quote = FALSE)

# 9. Get the average of each feature columns
mym <- melt(allData, id = c("subject", "group", "activityid"))
allDataAverage <- dcast(mym, subject + group + activityid ~ variable, mean)

write.table(allDataAverage, "resultAverage.txt", sep=" ", row.names = FALSE, quote = FALSE)




