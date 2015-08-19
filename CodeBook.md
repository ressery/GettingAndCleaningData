#### Overview of class project

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
>
>One of the most exciting areas in all of data science right now is wearable computing - see for example this  [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


#### List of variables in ```run_analysis.txt```

Variable Name  | Class | Use
------------- | ------------- | -------------
subject_train  | data.frame  |  stores subject_train.txt
subject_test  | data.frame  |  stores subject_test.txt
subject_dataset | data.frame | merges subject_train & subject_test
y_train  |  data.frame  | stores y_train.txt
y_test   | data.frame  | stores y_test.txt
activity_dataset | data.frame | merges y_train & y_test
x_train |  data.frame | stores X_train.txt
x_test | data.frame | stores X_test.txt
measurements_dataset | data.frame | merges x_train & x_test
features | data.frame | stores features.txt
extract_measurements | integer | stores indices of features containing ```mean``` & ```std```
activity_labels  | data.frame | stores activity_labels.txt
tidy_dataset | data.frame | merges subject_dataset, activity_dataset, and measurements_dataset
id_labels | character | stores id label values for melt function
measurement_labels | character | stores measure labels for melt function  
melt_dataset | data.frame | result after running melt. See ```?melt``` for more information
tidy_dataset | data.frame | dataset output as tidy_dataset.txt


#### Steps taken to derive features from ```features.txt```
* ```read.table("./features.txt")```
* remove open and close paranthese: ```gsub("\\(|\\)", " ",features)```
* remove whitespace ```gsub("\\s", "",features)```
* remove hyphens ```gsub("-", " ",features)```
* extract all features where feature name contains ```mean``` or ```std```
* retained feautes ```meanFreq.XYZ``` this might be wrong but I did it anyway


#### List of features in ```tidy_dataset.txt```


* subject
* activity
* tBodyAcc mean X
* tBodyAcc mean Y
* tBodyAcc mean Z   
* tBodyAcc std X               
* tBodyAcc std Y               
* tBodyAcc std Z                
* tGravityAcc mean X           
* tGravityAcc mean Y           
* tGravityAcc mean Z            
* tGravityAcc std X            
* tGravityAcc std Y             
* tGravityAcc std Z             
* tBodyAccJerk mean X          
* tBodyAccJerk mean Y           
* tBodyAccJerk mean Z           
* tBodyAccJerk std X           
* tBodyAccJerk std Y            
* tBodyAccJerk std Z            
* tBodyGyro mean X             
* tBodyGyro mean Y              
* tBodyGyro mean Z              
* tBodyGyro std X              
* tBodyGyro std Y               
* tBodyGyro std Z               
* tBodyGyroJerk mean X         
* tBodyGyroJerk mean Y          
* tBodyGyroJerk mean Z          
* tBodyGyroJerk std X          
* tBodyGyroJerk std Y           
* tBodyGyroJerk std Z           
* tBodyAccMag mean             
* tBodyAccMag std              
* tGravityAccMag mean           
* tGravityAccMag std           
* tBodyAccJerkMag mean          
* tBodyAccJerkMag std           
* tBodyGyroMag mean            
* tBodyGyroMag std              
* tBodyGyroJerkMag mean         
* tBodyGyroJerkMag std         
* fBodyAcc mean X               
* fBodyAcc mean Y               
* fBodyAcc mean Z              
* fBodyAcc std X                
* fBodyAcc std Y                
* fBodyAcc std Z               
* fBodyAcc meanFreq X           
* fBodyAcc meanFreq Y           
* fBodyAcc meanFreq Z          
* fBodyAccJerk mean X           
* fBodyAccJerk mean Y           
* fBodyAccJerk mean Z          
* fBodyAccJerk std X            
* fBodyAccJerk std Y            
* fBodyAccJerk std Z           
* fBodyAccJerk meanFreq X      
* fBodyAccJerk meanFreq Y       
* fBodyAccJerk meanFreq Z      
* fBodyGyro mean X              
* fBodyGyro mean Y              
* fBodyGyro mean Z             
* fBodyGyro std X              
* fBodyGyro std Y               
* fBodyGyro std Z              
* fBodyGyro meanFreq X         
* fBodyGyro meanFreq Y          
* fBodyGyro meanFreq Z         
* fBodyAccMag mean              
* fBodyAccMag std               
* fBodyAccMag meanFreq         
* fBodyBodyAccJerkMag mean      
* fBodyBodyAccJerkMag std       
* fBodyBodyAccJerkMag meanFreq 
* fBodyBodyGyroMag mean         
* fBodyBodyGyroMag std          
* fBodyBodyGyroMag meanFreq    
* fBodyBodyGyroJerkMag mean     
* fBodyBodyGyroJerkMag std      
* fBodyBodyGyroJerkMag meanFreq


