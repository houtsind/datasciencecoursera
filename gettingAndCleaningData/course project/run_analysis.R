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

#setting up the location
getwd()
setwd("..")
setwd("course project/")
list.files()
rm(list=ls())

#reading in the data
test.subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
test.x<-read.table("UCI HAR Dataset/test/X_test.txt")
test.y<-read.table("UCI HAR Dataset/test/y_test.txt")
train.subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
train.x<-read.table("UCI HAR Dataset/train/X_train.txt")
train.y<-read.table("UCI HAR Dataset/train/y_train.txt")

#merging to 1 data frame
test.full.table<-cbind(test.x,test.subject,test.y)
train.full.table<-cbind(train.x,train.subject,train.y)
UCI.df<-rbind(test.full.table,train.full.table)

#reading in the column headings
features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

#getting relevant column headings (mean(),std())
column.names<-features[,2]
columns<-c(which(grepl("mean\\(\\)|std\\(\\)",features[,2])))
columns.to.extract<-c(columns,dim(UCI.df)[2]-1,dim(UCI.df)[2])

#adding headings
column.names<-c(column.names,"subject","activity")
names(UCI.df)<-column.names

#get subset with only mean() and std()
UCI.df.subset<-UCI.df[,columns.to.extract]

#reading in activity labels
activity.labels<-read.table("UCI HAR Dataset/activity_labels.txt",
                            stringsAsFactors=FALSE)

#replacing activity labels
for (i in 1:6) {
        rows.to.replace<-UCI.df.subset[,68] %in% activity.labels[i,1]
        UCI.df.subset[rows.to.replace,68]<-activity.labels[i,2]
}

#renaming headings
temp.names<-names(UCI.df.subset)
temp.names<-sapply(temp.names, gsub, pattern="-X", replacement=".xAxis")
temp.names<-sapply(temp.names, gsub, pattern="-Y", replacement=".yAxis")
temp.names<-sapply(temp.names, gsub, pattern="-Z", replacement=".zAxis")
temp.names<-sapply(temp.names, gsub, pattern="\\(\\)",replacement="")
temp.names<-sapply(temp.names, gsub, pattern="-", replacement=".")
names(UCI.df.subset)<-temp.names

#rearranging columns to place subject and activity at the left
column.rearrange<-c(ncol(UCI.df.subset)-1,ncol(UCI.df.subset),1:(ncol(UCI.df.subset)-2))
UCI.df.subsetr<-UCI.df.subset[,column.rearrange]

#melt and cast back into new table
library(reshape2)
tidy.table<-melt(UCI.df.subsetr,id=c("subject","activity"))
tidy.table<-dcast(tidy.table,subject+activity~variable,mean)

