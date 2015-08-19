## Coursera: Getting And Cleaning Data

#### How to use this script
* Successfully using ```run_analysis.R``` requires source files contained in ```getdata_projectfiles_UCI HAR Dataset.zip```
* Please download source files here: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzip ```getdata_projectfiles_UCI HAR Dataset.zip```
* Copy ```UCI HAR Dataset``` to the root of RStudio working directory
* Copy ```run_analysis.R``` to the root of RStudio working directory 
* Open ```run_analysis.R``` in RStudio and run the script
* ```run_analysis.R``` requires package ```reshape2``` and will automatically ```install.packages("reshape2")``` if it's not already installed


#### What ```run_analysis.R``` does (or should do)
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For more information please see CodeBook.md