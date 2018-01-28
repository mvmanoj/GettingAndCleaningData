# GettingAndCleaningData

Getting and Cleaning Data Course Project
----------------------------------------
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

# This repository contains the following files:

1) README.md:  Provides an overview of the data set and how it was created.
2) tidy_data.txt:  Contains the cleansed reformatted data set.
3) CodeBook.md:  The code bookdescribing the contents of the data set.
4) run_analysis.R:  R script that to create the data set

# Study design
The source data set that this project was based on was obtained from the Human Subject Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Training and test data were first merged together to create one data set, then the measurements on the mean and standard deviation were extracted for each measurement (79 variables extracted from the original 561), and then the measurements were averaged for each subject and activity, resulting in the final data set.

# Creating the data set
The following steps were used in the R script to create the tidy dataset.


#The easiest way to get dplyr is to install the whole tidyverse:
install.packages("tidyverse")
library(dplyr)

#Step1: Download the zip file after checking if it hasn't been downloaded
#Download the Zip file
#Unzip zip file if it doesnt already exist

#Step2: Reading Training Data

#Step3: Reasing Test Data

#Step4: Reading Features

#Step5: Reading Activity Labels

#Step6: Merge Individual Tables and Create a single Table
#Removing noise

#Step7: Cleanse the Names

#Step8: Creating a second Tidy Data set
#Writing "tidy_data.txt"

