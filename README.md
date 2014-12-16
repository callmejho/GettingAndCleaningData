GettingAndCleaningData
======================
run_analysis.R performs the following steps to tidy up the wearable technology dataset collected from the accelerometers on the Samsung Galaxy S smartphone.

1. Import the subject_test, activity_type, features, X_test and Y_test data from the working directory.
2. Assign features as the name of X_test, activity_type as the name of Y_test and subject_id as the name of subject_test.
3. Combine subject_test, Y_test and X_test into one data frame.
4. Import the subject_train, X_train and Y_train data from the working directory.
5. Assign features as the name of X_train, activity_type as the name of Y_train and subject_id as the name of subject_train. 
6. Combine subject_test, Y_train and X_train into one data frame.
7. Combine the data from steps 3 and 6 into a single data frame.
8. Filter so that the only variables returned are related to the mean and standard deviation measurements.
9. Import the activity_labels and convert the activity_type variable to a factor and change the values to the activity names.
10. Improve the column names by removing parentheses and periods.
11. Use dplyr to group the data by activity and subject, then summarize the means of each variable grouped by activity and subject. 
12. Output the summary to the working directory and clean up variables. 