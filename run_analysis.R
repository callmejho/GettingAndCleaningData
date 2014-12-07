library(data.table)

## Import the test data, subject ids and activity IDs

xtest <- read.table("X_test.txt")
features <- read.table("features.txt")
names(xtest) <- features[, 2]
ytest <- read.table("Y_test.txt")
names(ytest) <- c("Activity_Type")
subtest <- read.table("subject_test.txt")
names(subtest) <- c("Subject_ID")
test <- cbind(subtest, ytest, xtest)

## Import the train data, subject ids and activity IDs

xtrain <- read.table("X_train.txt")
names(xtrain) <- features[, 2]
ytrain <- read.table("Y_train.txt")
names(ytrain) <- c("Activity_Type")
subtrain <- read.table("subject_train.txt")
names(subtrain) <- c("Subject_ID")
train <- cbind(subtrain, ytrain, xtrain)

## Combine test and train data sets

wearable_data <- rbind(test, train)

## Filter to only show mean and std columns

wearable_data <- wearable_data[ , grep("(Subject)|(Activity)|(mean\\(\\))|(std\\(\\))", names(wearable_data))]

## Convert Activity_Type to factor
activity_labels <- read.table("activity_labels.txt")
wearable_data$Activity_Type <- factor(wearable_data$Activity_Type)
levels(wearable_data$Activity_Type) <- activity_labels[, 2]

## Convert to a data.table

wearable_data <- data.table(wearable_data)

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

## Write the table to a file

write.table(wearable_data, file = "wearable_data.txt", row.names = FALSE)
