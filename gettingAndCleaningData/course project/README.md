Getting and Cleaning Data - Course Project
==========================================

This submission for the Getting and Cleaning Data Course Project contains 3 parts:

1) R script (run_analysis.r) completing the necessary steps to transform the sample data from raw to tidy.
2) This README.md file that outlines the steps taken to perform the transformation.
3) The CODEBOOK.md which outlines the column names and descriptions of the tidy data set 'diep,h_course_project_tidy_table.txt'.

---

The R script assumes that the UCI HAR Dataset is exported to the same working directory.

That is, the working directory should contain the following:

1. R script
2. UCI HAR Dataset (which contains i) test ii) train iii) activity_labels.txt iv) features v) features_info.txt vi) README.txt)

---

Outlined below are the steps taken for the transformation based on the course project instructions.

I. Create one R script called run_analysis.R that does the following. 
* Created an R script file called 'run_analysis.R' and saved it in the working directory along with the sample data.

1. Merges the training and the test sets to create one data set.
   * Read in the 6 files (3 test, 3 train) that contained the subject, activity, and feature data. 
   * Once the data was stored in memory, the feature data was merged with the suject and activity data for test and train respectively. 
   * Both the merged test and train data was merged further to create the final full data set. 
   * The column headings for the features was added along with the subject and activity heading.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   * The index was determined for the columns that contained Find the associated column headings with mean() and std()
   * Subset the data frame for only the columns with mean() or std() using the index found
   * Include the subject and activity columns

3. Uses descriptive activity names to name the activities in the data set
   * Read the activity labels legend file and replace the activity labels in the subset data frame

4. Appropriately labels the data set with descriptive activity names. 
   * Make the headings more user friendly by:
   * i. Indicate X, Y, and Z as axis (respectively)
   * ii. Remove the () from the headers
   * iii. Remove the - from the headers and replace with .

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
   * The final step consisted of rearranging the columns to place subject and activity at the left which prepares the data to be melted and recast as a tidy data set
   * The tidy data set was created by melting and casting the subset from step 2 above, taking the mean of each variable, and exporting the results to a text file.
   
---

Houtsin Diep