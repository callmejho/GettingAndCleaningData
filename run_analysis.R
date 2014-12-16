library(data.table)
library(dplyr)
## Import the test data, subject ids and activity IDs

xtest <- read.table("X_test.txt")
features <- read.table("features.txt")
names(xtest) <- features[, 2]
ytest <- read.table("Y_test.txt")
names(ytest) <- c("activity_type")
subtest <- read.table("subject_test.txt")
names(subtest) <- c("subject_id")
test <- cbind(subtest, ytest, xtest)

## Import the train data, subject ids and activity IDs

xtrain <- read.table("X_train.txt")
names(xtrain) <- features[, 2]
ytrain <- read.table("Y_train.txt")
names(ytrain) <- c("activity_type")
subtrain <- read.table("subject_train.txt")
names(subtrain) <- c("subject_id")
train <- cbind(subtrain, ytrain, xtrain)

## Combine test and train data sets

wearable_data <- rbind(test, train)

## Filter to only show mean and std columns

wearable_data <- wearable_data[ , grep("(subject)|(activity)|(mean\\(\\))|(std\\(\\))", names(wearable_data))]

## Convert Activity_Type to factor
activity_labels <- read.table("activity_labels.txt")
wearable_data$activity_type <- factor(wearable_data$activity_type)
levels(wearable_data$activity_type) <- activity_labels[, 2]

## Make names appropriate
names <- make.names(names(wearable_data))
names <- gsub("(\\.\\.\\.)", "_", names)
names <- gsub("\\.\\.", "", names)
names <- gsub("\\.", "_", names)
names(wearable_data) <- names

## Use dplyr to group and summarize the mean of each column by groupings 

wearable_data <- tbl_df(wearable_data)
wearable_data <- group_by(wearable_data, activity_type, subject_id)
summary <- summarise_each(wearable_data, funs(mean))

## Clean up unneeded variables

rm(xtest)
rm(ytest)
rm(subtest)
rm(xtrain)
rm(ytrain)
rm(subtrain)
rm(features)
rm(test)
rm(train)
rm(activity_labels)
rm(names)


## Write the table to a file
write.table(wearable_data, file = "wearable_data.txt", row.names = FALSE)

## Write Summary to a file
write.table(summary, file = "summary.txt", row.names = FALSE)