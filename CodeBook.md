# Introduction

This is a code book contains information to correspond to code found in the run_analysis.R file.  The following will describe variables found in the data set and how the data was manipulated using R Programming.  This project was completed based on requirements provided by Coursera Getting and Cleaning Data courses offered from Johns Hopkins.    

### Data Location

Students were asked to obtain Raw Data from UCI Machine Learning repository via web URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
Full details regarding this data set can be found via the URL 

### Data Set Details

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data Downloaded Files

The dataset includes the following files:

- 'README.txt'
- 'activity_labels.txt' Provides a link between class and activity name
- 'features_info.txt' Information on variables used on the feature vector
- 'features.txt' Complete Features list.
- 'test/X_test.txt' Test data set
- 'test/y_test.txt' Labels for the test data
- 'train/X_train.txt' Training data
- 'train/y_train.txt' Labels for the training data

### Attribute Details

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Run_analysis.R

Use the information in run_analysis.R to recreate the steps taken to obtain the final tidy data set.  

This file will provide specific code that allows for download of the file, merging of the training and test sets, obtaining the mean and standard deviation variables, creates a new column to allow for activity description, and finish with a tidy data set.  

### Variables

The final_data file contains the tidy data set.  When looking at the results within the file you will see the following. 

Subject field contains identifying information on who carried out the experiment.  

Description of the actual activity performed during the experiment, laying, sitting, walking, etc.  

Means calculated based on accelerometer and gyroscope 3 axial raw signal, which is numeric value.  

