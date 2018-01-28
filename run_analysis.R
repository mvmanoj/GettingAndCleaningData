
# The easiest way to get dplyr is to install the whole tidyverse:
install.packages("tidyverse")
library(dplyr)


# Step1: Download the zip file after checking if it hasn't been downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

#Download the Zip file
if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

#Unzip zip file if it doesnt already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}
##Tested above Code


#Step2: Reading Training Data
trainSubjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainValues <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainActivities <- read.table(file.path(dataPath, "train", "y_train.txt"))
##Tested above Code


#Step3: Reasing Test Data
testSubjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValues <- read.table(file.path(dataPath, "test", "X_test.txt"))
testActivities <- read.table(file.path(dataPath, "test", "y_test.txt"))
##Tested above Code



#Step4: Reading Features
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

##Tested above Code



#Step5: Reading Activity Labels
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")
##Tested above Code



#Step6: Merge Individual Tables and Create a single Table
subjectActivity <- rbind(
  cbind(trainSubjects, trainValues, trainActivities),
  cbind(testSubjects, testValues, testActivities)
)
colnames(subjectActivity) <- c("subject", features[, 2], "activity")
columnsToKeep <- grepl("subject|activity|mean|std", colnames(subjectActivity))
subjectActivity <- subjectActivity[, columnsToKeep]
subjectActivity$activity <- factor(subjectActivity$activity, 
                                   levels = activities[, 1], labels = activities[, 2])
subjectActivityColumns <- colnames(subjectActivity)

#Removing noise
subjectActivityColumns <- gsub("[\\(\\)-]", "", subjectActivityColumns)


#Step7: Cleanse the Names
subjectActivityColumns <- gsub("^f", "frequencyDomain", subjectActivityColumns)
subjectActivityColumns <- gsub("^t", "timeDomain", subjectActivityColumns)
subjectActivityColumns <- gsub("Acc", "Accelerometer", subjectActivityColumns)
subjectActivityColumns <- gsub("Gyro", "Gyroscope", subjectActivityColumns)
subjectActivityColumns <- gsub("Mag", "Magnitude", subjectActivityColumns)
subjectActivityColumns <- gsub("Freq", "Frequency", subjectActivityColumns)
subjectActivityColumns <- gsub("mean", "Mean", subjectActivityColumns)
subjectActivityColumns <- gsub("std", "StandardDeviation", subjectActivityColumns)
subjectActivityColumns <- gsub("BodyBody", "Body", subjectActivityColumns)

colnames(subjectActivity) <- subjectActivityColumns
##Teted above Code

#Step8: Creating a second Tidy Data set
subjectActivityMeans <- subjectActivity %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))


#Writing "tidy_data.txt"
write.table(subjectActivityMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
##Tested above Code