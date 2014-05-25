# Course Project Instructions
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
#    ignore iertial signals folder
#
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
#
# 3. Uses descriptive activity names to name the activities in the data set
#
# 4. Appropriately labels the data set with descriptive activity names. 
#
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 

# Reading in the UCI data and organize by test and train
test.subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
test.x<-read.table("UCI HAR Dataset/test/X_test.txt")
test.y<-read.table("UCI HAR Dataset/test/y_test.txt")
train.subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
train.x<-read.table("UCI HAR Dataset/train/X_train.txt")
train.y<-read.table("UCI HAR Dataset/train/y_train.txt")

# Merge all the data (test and train) into 1 data frame for further analysis
test.full.table<-cbind(test.x,test.subject,test.y)
train.full.table<-cbind(train.x,train.subject,train.y)
UCI.df<-rbind(test.full.table,train.full.table)

# Read the features file to get the column headings
features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

# Find the associated column headings with mean() and std()
column.names<-features[,2]
columns<-c(which(grepl("mean\\(\\)|std\\(\\)",features[,2])))
columns.to.extract<-c(columns,dim(UCI.df)[2]-1,dim(UCI.df)[2])

# Add the headings, including the subject and activity, to the merged dataframe
column.names<-c(column.names,"subject","activity")
names(UCI.df)<-column.names

# Subset the data frame for only the columns with mean() or std()
# Include the subject and activity columns
UCI.df.subset<-UCI.df[,columns.to.extract]

# Read the activity labels legend file
activity.labels<-read.table("UCI HAR Dataset/activity_labels.txt",
                            stringsAsFactors=FALSE)

# Replace the activity labels in the subset data frame
for (i in 1:6) {
        rows.to.replace<-UCI.df.subset[,68] %in% activity.labels[i,1]
        UCI.df.subset[rows.to.replace,68]<-activity.labels[i,2]
}

# Make the headings more user friendly
# 1. Indicate X, Y, and Z as axis (respectively)
# 2. Remove the () from the headers
# 3. Remove the - from the headers and replace with .
temp.names<-names(UCI.df.subset)
temp.names<-sapply(temp.names, gsub, pattern="-X", replacement=".xAxis")
temp.names<-sapply(temp.names, gsub, pattern="-Y", replacement=".yAxis")
temp.names<-sapply(temp.names, gsub, pattern="-Z", replacement=".zAxis")
temp.names<-sapply(temp.names, gsub, pattern="\\(\\)",replacement="")
temp.names<-sapply(temp.names, gsub, pattern="-", replacement=".")
names(UCI.df.subset)<-temp.names

# Rearranging columns to place subject and activity at the left
column.rearrange<-c(ncol(UCI.df.subset)-1,ncol(UCI.df.subset),
		    1:(ncol(UCI.df.subset)-2))
UCI.df.subsetr<-UCI.df.subset[,column.rearrange]

# Create tidy data set with mean of each column based on subject and activity
library(reshape2)
tidy.table<-melt(UCI.df.subsetr,id=c("subject","activity"))
tidy.table<-dcast(tidy.table,subject+activity~variable,mean)
write.table(tidy.table,file="tidy_table.txt")
