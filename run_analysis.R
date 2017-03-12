#required libraries
require(dplyr)
require(sqldf)
require(data.table)

# ============================================================
# Merges the training and the test sets to create one data set.
#=============================================================
#Read the data
train <- read.table("./prj/train/X_train.txt", header=FALSE)
test <- read.table("./prj/test/X_test.txt", header=FALSE)
allData <- rbind(train,test)

#Save all data just in case....
write.table(allData,"./prj/trainAndTest.txt")

#Cleanup a little bit the features vector
features <- read.table("./prj/features.txt", header=FALSE)
features <- features[-c(1)]
names(features) <- c("Activities")
features[,1] <- gsub("[.,]","",gsub("std","Std",gsub("mean","Mean",gsub("[()-]","",features[,1]))))
write.table(features,"./prj/cleanedFeatures.txt")

# ========================================================================================
# Extracts only the measurements on the mean and standard deviation for each measurement.
# ========================================================================================
cols <- grep("[Mm]ean|[Ss]td", features[,1])
allDataMeanStd <- allData[,cols]
names(allDataMeanStd) <- features[cols,]
write.table(allDataMeanStd,"./prj/allDataMeanStd.txt")

# ====================================================================
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# ====================================================================
x <- read.table("./prj/train/subject_train.txt")
z <- read.table("./prj/train/y_train.txt")
subjectActivityTrain <- cbind(x,z)

x <- read.table("./prj/test/subject_test.txt")
z <- read.table("./prj/test/y_test.txt")
subjectActivityTest <- cbind(x,z)

subjectActivity <- rbind(subjectActivityTrain,subjectActivityTest)
names(subjectActivity) <- c("subject","activity")

al <- read.table("./prj/activity_labels.txt")
names(al) <- c("activity","label")

m <- sqldf("select subject, label from subjectActivity, al where subjectActivity.activity=al.activity")
names(m) <- c("subject","activity")

allDataMeanStdSubjectActivity <- cbind(m,allDataMeanStd)
write.table(allDataMeanStdSubjectActivity,"./prj/allDataMeanStdSubjectActivity.txt")

# ===============================================================================================================================
# Creates a second, independent tidy data set (allMeans.txt) with the average of each variable for each activity and each subject.
# ===============================================================================================================================
allDataMeanStdSubjectActivity <- as.data.table(allDataMeanStdSubjectActivity)
allMeans <- allDataMeanStdSubjectActivity[, lapply(.SD, mean), by=c("subject","activity")]
allMeans <- arrange(allMeans,subject)
write.table(allMeans,"./prj/allDataMeanStdSubjectActivity.txt")

