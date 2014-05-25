## CODEBOOK for Getting and Cleaning Data Course Project
Created by Houtsin Diep

The tidy data set contained within the working directory has the following variables set averaged (mean taken) by subject and activity.

* 1                    subject: id for test subject (from 1-6)
* 2                   activity: activity performed by test subject
* 3        tBodyAcc.mean.xAxis: mean of body accelerometer by time by the x axis
* 4        tBodyAcc.mean.yAxis: mean of body accelerometer by time by the y axis
* 5        tBodyAcc.mean.zAxis: mean of body accelerometer by time by the z axis
* 6         tBodyAcc.std.xAxis: std of body accelerometer by time by the x axis
* 7         tBodyAcc.std.yAxis: std of body accelerometer by time by the y axis
* 8         tBodyAcc.std.zAxis: std of body accelerometer by time by the z axis
* 9     tGravityAcc.mean.xAxis: mean of gravity accelerometer by time by the x axis
* 10    tGravityAcc.mean.yAxis: mean of gravity accelerometer by time by the y axis
* 11    tGravityAcc.mean.zAxis: mean of gravity accelerometer by time by the z axis
* 12     tGravityAcc.std.xAxis: std of gravity accelerometer by time by the x axis
* 13     tGravityAcc.std.yAxis: std of gravity accelerometer by time by the y axis
* 14     tGravityAcc.std.zAxis: std of gravity accelerometer by time by the z axis
* 15   tBodyAccJerk.mean.xAxis: mean of body accelerometer jerk signals by time by the x axis
* 16   tBodyAccJerk.mean.yAxis: mean of body accelerometer jerk signals by time by the y axis
* 17   tBodyAccJerk.mean.zAxis: mean of body accelerometer jerk signals by time by the z axis
* 18    tBodyAccJerk.std.xAxis: std of body accelerometer jerk signals by time by the x axis
* 19    tBodyAccJerk.std.yAxis: std of body accelerometer jerk signals by time by the y axis
* 20    tBodyAccJerk.std.zAxis: std of body accelerometer jerk signals by time by the z axis
* 21      tBodyGyro.mean.xAxis: mean of body gyroscope by time by the x axis
* 22      tBodyGyro.mean.yAxis: mean of body gyroscope by time by the y axis
* 23      tBodyGyro.mean.zAxis: mean of body gyroscope by time by the z axis
* 24       tBodyGyro.std.xAxis: std of body gyroscope by time by the x axis
* 25       tBodyGyro.std.yAxis: std of body gyroscope by time by the y axis
* 26       tBodyGyro.std.zAxis: std of body gyroscope by time by the z axis
* 27  tBodyGyroJerk.mean.xAxis: mean of body gyroscope jerk signals by time by the x axis
* 28  tBodyGyroJerk.mean.yAxis: mean of body gyroscope jerk signals by time by the y axis
* 29  tBodyGyroJerk.mean.zAxis: mean of body gyroscope jerk signals by time by the z axis
* 30   tBodyGyroJerk.std.xAxis: std of body gyroscope jerk signals by time by the x axis
* 31   tBodyGyroJerk.std.yAxis: std of body gyroscope jerk signals by time by the y axis
* 32   tBodyGyroJerk.std.zAxis: std of body gyroscope jerk signals by time by the z axis
* 33          tBodyAccMag.mean: mean of body accelerometer magnitude by time
* 34           tBodyAccMag.std: std of body accelerometer magnitude by time
* 35       tGravityAccMag.mean: mean of gravity accelerometer magnitude by time
* 36        tGravityAccMag.std: std of gravity accelerometer magnitude by time
* 37      tBodyAccJerkMag.mean: mean of body accelerometer magnitude jerk signals by time
* 38       tBodyAccJerkMag.std: std of body accelerometer magnitude jerk signals by time
* 39         tBodyGyroMag.mean: mean of body gyroscope magnitude by time
* 40          tBodyGyroMag.std: std of body gyroscope magnitude by time
* 41     tBodyGyroJerkMag.mean: mean of body gyroscope jerk signals magnitude by time
* 42      tBodyGyroJerkMag.std: std of body gyroscope jerk signals magnitude by time
* 43       fBodyAcc.mean.xAxis: mean of body accelerometer by frequency domain signal by the x axis
* 44       fBodyAcc.mean.yAxis: mean of body accelerometer by frequency domain signal by the y axis
* 45       fBodyAcc.mean.zAxis: mean of body accelerometer by frequency domain signal by the z axis
* 46        fBodyAcc.std.xAxis: std of body accelerometer by frequency domain signal by the x axis
* 47        fBodyAcc.std.yAxis: std of body accelerometer by frequency domain signal by the y axis
* 48        fBodyAcc.std.zAxis: std of body accelerometer by frequency domain signal by the z axis
* 49   fBodyAccJerk.mean.xAxis: mean of body accelerometer jerk signals by frequency domain signal by the x axis
* 50   fBodyAccJerk.mean.yAxis: mean of body accelerometer jerk signals by frequency domain signal by the y axis
* 51   fBodyAccJerk.mean.zAxis: mean of body accelerometer jerk signals by frequency domain signal by the z axis
* 52    fBodyAccJerk.std.xAxis: std of body accelerometer jerk signals by frequency domain signal by the x axis
* 53    fBodyAccJerk.std.yAxis: std of body accelerometer jerk signals by frequency domain signal by the y axis
* 54    fBodyAccJerk.std.zAxis: std of body accelerometer jerk signals by frequency domain signal by the z axis
* 55      fBodyGyro.mean.xAxis: mean of body gyroscope by frequency domain signal by the x axis
* 56      fBodyGyro.mean.yAxis: mean of body gyroscope by frequency domain signal by the y axis
* 57      fBodyGyro.mean.zAxis: mean of body gyroscope by frequency domain signal by the z axis
* 58       fBodyGyro.std.xAxis: std of body gyroscope by frequency domain signal by the x axis
* 59       fBodyGyro.std.yAxis: std of body gyroscope by frequency domain signal by the y axis
* 60       fBodyGyro.std.zAxis: std of body gyroscope by frequency domain signal by the z axis
* 61          fBodyAccMag.mean: mean of body accelerometer magnitude by frequency domain signal
* 62           fBodyAccMag.std: std of body accelerometer magnitude by frequency domain signal
* 63  fBodyBodyAccJerkMag.mean: mean of body accelerometer jerk signals magnitude by frequency domain signal
* 64   fBodyBodyAccJerkMag.std: std of body accelerometer jerk signals magnitude by frequency domain signal
* 65     fBodyBodyGyroMag.mean: mean of body body gyroscope magnitude by frequency domain signal
* 66      fBodyBodyGyroMag.std: std of body body gyroscope magnitude by frequency domain signal
* 67 fBodyBodyGyroJerkMag.mean: mean of body body gyroscope jerk signals magnitude by frequency domain signal
* 68  fBodyBodyGyroJerkMag.std: std of body body gyroscope jerk signals magnitude by frequency domain signal

Original feature notes
---
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
