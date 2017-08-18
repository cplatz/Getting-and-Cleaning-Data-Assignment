## The following script follows instruction given by Coursera to creates a run_analysis.R file with R script to complete the following requirements. 

## Create R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Provides flexible grammar of data manipulation. 

library(dplyr)

##Implements the split-apply-combine pattern in R

library(plyr)

##file reader and writer, aggregations, updates, equi, non-equi, rolling, range and interval joins

library(data.table)


##Set working directory where downloaded file containing the contents of UCI HAR Dataset File

# 1 - Merge training and test into one data set
###############################################################################

x_train <- read.table("train/X_train.txt")  ##create x_train with data from X_train.txt file.  

y_train <- read.table("train/y_train.txt")  ##Create y_train with data from y_train.txt

subject_train <- read.table("train/subject_train.txt")  ##Create subject_train with data from subject_train.txt



y_test <- read.table("test/y_test.txt")  ##Create y_test with data from y_test.txt

x_test <- read.table("test/x_test.txt")  ##Create x_test with data from x_test.txt

subject_test <- read.table("test/subject_test.txt")  ##Create subject_test with data from subject_test.txt



x_data <- rbind(x_train, x_test) ##Use rbind to combine x_train and x_test into one data set

y_data <- rbind(y_train, y_test)  ##Use rbind to combine y_train and y_test into one data set

subject_data <- rbind(subject_train, subject_test)  ##Use rbind to combine subject data into one data set


##2 - Extract only the measurements on the mean and standard deviation for each measurement.
################################################################################################

features <- read.table("features.txt")  ##Create features with data from features.txt

mean_std_features <- grep("-(mean|std)\\(\\)", features[,2])  ##select only thoes columns including mean or std

x_data <- x_data[, mean_std_features]  ##Use to subset the desired columns

names(x_data) <- features[mean_std_features, 2]  ##Makes corrections to the column names


## 3 - Uses descriptive activity names to name the activities in the data set
####################################################################################

activity_data <- read.table("activity_labels.txt")  ##Create activities with data from activity_labels.txt

y_data[,1] <- activities[y_data[, 1], 2]   ##Makes and update to correct activity names

names(y_data) <- "activity"  ##Makes an update to the column name


## 4 - Appropriately labels the data set with descriptive activity names.
###################################################################################

names(subject_data) <- "subject"  ##Makes update to column name

combined_data <- cbind(x_data, y_data, subject_data)  ##Use cbind to combine all data into one data set


## 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject
#######################################################################################################################

data_averages <- ddply(combined_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(data_averages, "tidy.txt", row.names = FALSE)
