Feature Selection (Code Book)
============================

#Background

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

#Identifying information
subject_id identifies the particular subject about whom the data was collected. activity_type documents the activity they were performing as they were being observed. These activities belong to one of the following:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

#Groupings

The data was grouped by activity_type and subject_id and the means of these observations were then taken with respect to these groupings. These means are stored in the columns named named by feature_estimate(_direction) e.g. tBodyAcc_mean_X or fBodyAccMag_std.

#Variables

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc_XYZ
* tGravityAcc_XYZ
* tBodyAccJerk_XYZ
* tBodyGyro_XYZ
* tBodyGyroJerk_XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc_XYZ
* fBodyAccJerk_XYZ
* fBodyGyro_XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals and had their means taken are: 

* mean: Mean value
* std: Standard deviation

The means of the estimates are stored in the columns named named by feature_estimate(_direction) e.g. tBodyAcc_mean_X or fBodyAccMag_std.
