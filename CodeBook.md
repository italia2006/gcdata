---
title: "Code Book"
output: html_document
---
The data represents Human Activity Recognition Using Smartphones Dataset and have been initialliy produced by the following team :

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

From these original data we have regrouped the training and test data in a unique dataset file. Then we have extracted only variables representing means and standard deviations. Finally we have created a tidy dataset containing in each row the Subject identifyer, The name of the activity , and 86 variables each representing the mean of the above (mean or std) variables.

A full description is available at the site where the data was obtained:  <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Original raw data: 
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


#### The Variables

Each variable is named by : <prefix>Mean or Std <suffix> (suffix may be emopty). But careful, the values of these
variables represent means of original mean and std values. For example:

tBodyAccMeanY  in the file allDataMeanStdSubjectActivity.txt  represent the mean 
"subject"     "activity"  "tBodyAccMeanY"
    1         "STANDING"   0.278917629056604

Means that 0.278917629056604 is the mean of the values of the "associated" variable tBodyAcc-mean()-Y in the original file for the subject No 1 and computed with measured during his STANDING activity.

#### The CleanUp and Transformations

* First of all, all the data train and test have been merge in a unique file called trainAndTest.txt. 

* The name of the variables have then been cleaned and set more "readable" e.g "tBodyAcc-mean()-X" has been transformed into "tBodyAccMeanX".

* Only the varaibles concerning a mean or standard deviation have been extracted into a new file allDataMeanStd.txt

* Create a file where each row has the two first column representing user id and activity name in order to get something like
"subject"     "activity"  "tBodyAccMeanX"      .............
    1         "STANDING"   0.278917629056604   .............
    
all the variabkles being the originla ones.


#### Dataset generation

* Finally from the above formatted file generates a new file with unique keys (subject;activity) and values representing the mean of the
original associated value measurements. E.g. for subject = 1 and the variable tBodyAccMeanX we got:

| subject | activity           | tBodyAccMeanX |
|---------|--------------------|---------------|
| 1       | STANDING           | 0.2789176     |
| 1       | SITTING            | 0.2612376     |
| 1       | LAYING             | 0.2215982     |
| 1       | WALKING            | 0.2773308     |
| 1       | WALKING_DOWNSTAIRS | 0.2891883     |
| 1       | WALKING_UPSTAIRS   | 0.2554617     |











