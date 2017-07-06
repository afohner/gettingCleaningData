# gettingCleaningData
Final course project materials


The dataset includes the following files:
=========================================

- 'README.txt'

- 'activity summary.txt': Is the cleaned data set with each acceleration metric mean and standard deviation, summarized by activity, for each subject included in the study.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Analysis Performed:
=====
-Part 1: merging test and training data sets
-read in information from original data sets
-combine the data to make each test and training data set have appropriate activity and subject labels
- merge the training and test data sets


-part 2: extracting mean and standard dev
- remove duplicated columns
- keep only the columns that include either "mean" or "std", and that have the subject and activity IDs

-Part 3: add descriptive names to activities
-replace 1-5 with names of activity in column pertaining to the activity



-Part 4 appropriately label variable names -- acceleration measures are already done, so just changes the column heading to activity


-Part 5: create a second tidy dataset from dataset in part 4 with average of each variable for each activity and subject
