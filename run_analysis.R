### ----------------------------------------
###   What this R script does (or should do)
### ----------------------------------------

# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.

### ----------------------------------------
###   How to use this script
### ----------------------------------------

# run_analysis.R requires source files contained in 'getdata_projectfiles_UCI HAR Dataset.zip'
# Please download source files here: 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
# Please place run_analysis.R and the unziped source files into your working directory.

### ----------------------------------------
###   run_analysis.R Dependency
### ----------------------------------------

# reshape2 package is required to 'melt' a new tidy dataset. Please see ?melt for more information.
if (!require("reshape2")) { 
  install.packages("reshape2") 
} 
require("reshape2")


# 1.Merges the training and the test sets to create one data set.

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## Merge Subject train & test data
subject_dataset  <- rbind(subject_train, subject_test)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt")
## Merge 'Activity' train & test data
activity_dataset  <- rbind(y_train, y_test)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test  <- read.table("./UCI HAR Dataset/test/X_test.txt")
## Merge 'Measurements' train & test data
measurements_dataset  <- rbind(x_train, x_test) #561 cols, 10299 rows

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./UCI HAR Dataset/features.txt")[,2]
### ----------------------------------------
### cleanup features data
## remove '()'
features <- gsub("\\(|\\)", " ",features)
## remove , '\\s' (whitespace)
features <- gsub("\\s", "",features)
## remove '-'
features <- gsub("-", " ",features)
### ----------------------------------------

## name all columns in measurement dataset with appropriate feature labels
names(measurements_dataset) <- features

## find all features representing mean and standard deviation. 
extract_measurements <- grep("mean|std", features)

## now we extract mean and standard deviation features and reassign to measurements_dataset
measurements_dataset <- measurements_dataset[, extract_measurements]

# 3.Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
## remove '_' from activity_labels and make lowercase
activity_labels[,2] <- gsub("_", " ", tolower(activity_labels[,2]))
## map activity labels to y_dataset
activity_dataset[,1] <- activity_labels[activity_dataset[,1],2]

# 4.Appropriately labels the data set with descriptive variable names. 

names(subject_dataset) <- "subject"
names(activity_dataset) <- "activity"
## mege all 3 data sets into 1
tidy_dataset <- cbind(subject_dataset, activity_dataset, measurements_dataset)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.

## name fist two columns to melt on
id_labels <- c("subject", "activity")

## extract measurement labels for melt measure.vars
measurement_labels <- setdiff(colnames(tidy_dataset), id_labels) 
## i'm melting...
melt_dataset <- melt(tidy_dataset, id = id_labels, measure.vars = measurement_labels) 
## set the average of each variable for each subject and each activity
tidy_dataset <- dcast(melt_dataset, subject + activity ~ variable, mean) 
## output our new tidy dataset as a file
write.table(tidy_dataset, file = "./tidy_dataset.txt", row.names = FALSE)