# Getting and Cleaning Data Project

The goal of this project is to prepare tidy data that can be used for later analysis.


## The Dataset

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data used for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R

The R script called run_analysis.R does the following:

1. Verifies whether the package "dplyr" is installed. If it is not, then it is installed & loaded.
2. It is extracted the name of activities & variables
3. It is joined the test dataset with variable names & activities names
4. It is joined the train dataset with variable names & activities names
5. Train & test datasets are joined
6. Mean() & Std() variables are extracted out along with 'NameActivity' & 'Subject' to create the first tidy dataset
7. First tidy dataset is put in .csv & .txt files
8. It is created an independent tidy data set from the first data set with the average of each variable for each activity and each subject.
9. Second tidy data set is put in .csv & .txt files

