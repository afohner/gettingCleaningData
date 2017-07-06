#Part 1: merging test and training data sets

#read in common info
setwd("C:/Users/E613797/dataScienceCourse/UCI HAR Dataset")
activitylabs <- read.table("activity_labels.txt")
features<-read.table("features.txt")
require("dplyr")


#read in test data set
setwd("C:/Users/E613797/dataScienceCourse/UCI HAR Dataset/test")
xtestdata <-read.table("X_test.txt")
testdata <- read.table("y_test.txt")
subjecttest<- read.table("subject_test.txt")
colnames(subjecttest) <- "subject"
#first setting up test data frame
#labelin each of 516 columns
excol <- as.vector(features$V2)
colnames(xtestdata) <- excol
testcombo <- cbind(subjecttest,labelstestdata, xtestdata)


#set director to get training files
setwd("C:/Users/E613797/dataScienceCourse/UCI HAR Dataset/train")
xtrainingdata <- read.table("X_train.txt")
labelstrainingdata <- read.table("y_train.txt")
subjecttrain <- read.table("subject_train.txt")
colnames(subjecttrain) <- "subject"
colnames(xtrainingdata) <- excol
trainingcombo <- cbind(subjecttrain, labelstrainingdata, xtrainingdata)

#merge test and training 
combodata <- rbind(testcombo, trainingcombo)

#part 2: extracting mean and standard dev
#remove duplicated columns
combodatasub<- combodata[, !duplicated(colnames(combodata))]

combomean <- select(combodatasub, contains("mean"))
combostd <- select(combodatasub, contains("std"))
assign("V1", combodatasub$V1)
assign("subjects", combodata$subject)
combobind <- cbind(subjects, V1, combomean, combostd)


#Part 3: add descriptive names to activities
#replace 1-5 with names of activity in column V1

combobind$V1 <- gsub("1","walking" , combobind$V1)
combobind$V1 <-gsub("2", "walking_upstairs", combobind$V1)
combobind$V1 <-gsub("3", "walking_downstairs", combobind$V1)
combobind$V1 <-gsub("4", "sitting", combobind$V1)
combobind$V1 <-gsub("5", "standing", combobind$V1)
combobind$V1 <-gsub("6", "laying", combobind$V1)


#Part 4 appropriately label variable names -- acceleration measures are already done
colnames(combobind)[2] <- "Activity"

#Part 5: create a second tidy dataset from dataset in part 4 with average of each variable for each activity and subject
#Group by activity and subject

summaryactivity <- combobind %>% group_by(subjects, Activity)  %>% summarise_all(funs(mean))

#write new datafile
write.table(summaryactivity, file = "activity summary.txt")
