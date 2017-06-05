
###########################################################################################################
## Download & unzip data files 
###########################################################################################################

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileURL, destfile = "UCI_HAR_Dataset.zip") 
unzip("UCI_HAR_Dataset.zip") 

###########################################################################################################
## 1. Merge the training and the test sets to create one data set
###########################################################################################################

x_test_data <- read.table("UCI HAR Dataset/test/X_test.txt") 
y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt") 
subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt") 

x_train_data <- read.table("UCI HAR Dataset/train/X_train.txt") 
y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt") 
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt") 

# create a data set for 'x' data
x_dataset <- rbind(x_train_data, x_test_data) 
# create a data set for 'y' data
y_dataset <- rbind(y_train_data, y_test_data) 
# create a data set for 'subject' data
subject_dataset <- rbind(subject_train_data, subject_test_data) 

###########################################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
###########################################################################################################

features <- read.table("UCI HAR Dataset/features.txt") 

# get only columns with "mean" or "std" in their names 
features_Mean_STD <- grep("*mean*|*std*", features[,2])

# subset the desired columns 
x_dataset <- x_dataset[, features_Mean_STD] 

# update the column names 
names(x_dataset) <- features[features_Mean_STD, 2] 

###########################################################################################################
## 3. Use descriptive activity names to name the activities in the data set.
###########################################################################################################

activities <- read.table("UCI HAR Dataset/activity_labels.txt") 

# update values with correct activity names 
y_dataset[, 1] <- activities[y_dataset[, 1], 2] 

# correct column name 
names(y_dataset) <- "Activity" 

###########################################################################################################
## 4. Appropriately label the data set with descriptive variable names.
###########################################################################################################

# correct column name 
names(subject_dataset) <- "Subject" 

# combine all the data in a single data set 
alldata <- cbind(subject_dataset, y_dataset, x_dataset) 

###########################################################################################################
## 5. Create a second, tidy data set with the average of each variable for each activity and each subject.
###########################################################################################################

average_data <- ddply(alldata, .(Subject, Activity), function(x) colMeans(x[, 3:81])) 
write.table(average_data, "TidyDataSet.txt", row.name=FALSE) 



