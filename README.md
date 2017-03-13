---
title: "Getting and Cleaning Data"
output: html_document
---


#### Cleaning data from wearable computing

The analyzed data concern measurement done trough wearable sensors on subjects doing 6 different acivities. Data have been collected from the accelerometers from the Samsung Galaxy S smartphone. More detailed descriptions are availabkle here <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


#### The input analysis files 

The input files represents the measures of 561 various characteristics during 6 different activities ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) of 30 different subjects within an age bracket of 19-48 years over a certain period of time. These data have been separated into training data and test data by taking 70% of the subjects dedicated to training data measuremenst and 30% for test data. In the dataset the subjects and the activities were coded with intergers. 1...30 for subjects and 1...6 for activities. For the activities, the mapping with "readable names" has been provided in a separated file.

#### The goal in the project
---
Learn, clean and propose a tidy suset version of the original dataset. This subset should contain only data representing mean and standard deviation for original each measurement. Then, based on that dataset, propose a new tidy dataset compiled in order to show the average of each variable for each activity and each subject per row.

Here more info can be found: <https://github.com/italia2006/gcdata.git>

Produced data and script:

The first cleaned and tidy dataset is : allDataMeanStd.txt
The second tidy set is                : allMeansOnly.txt
The script that, when run, output the two above files: run_analysis.R

Info on original measured features    : features_info.txt

#### The Code Book
---
The code book CoddBook.md found here <https://github.com/italia2006/gcdata.git> describes the variables, the data, and any transformations or work that you performed to clean up the data 



