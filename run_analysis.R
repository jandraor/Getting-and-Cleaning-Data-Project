## It is loaded the 'dplyr' package. If it is not installed, then it is done by this code
if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
}
## It is extracted the name of activities & variables
labelactivities<- read.table("./UCI HAR Dataset/activity_labels.txt",colClasses="character")
variables<- read.table("./UCI HAR Dataset/features.txt",colClasses="character")

## It is joined the test dataset with their variable names & activities names
rawtestdata<- read.table("./UCI HAR Dataset/test/X_test.txt",colClasses="numeric")
testcodeactivities<- read.table("./UCI HAR Dataset/test/y_test.txt",colClasses="numeric")
subjecttest<- read.table("./UCI HAR Dataset/test/subject_test.txt",colClasses="numeric")
temp<-cbind(subjecttest,testcodeactivities,rawtestdata)
testdata<-merge(labelactivities,temp, by.x=1,by.y=2)

## ## It is joined the train dataset with their variable names & activities names
rawtraindata<- read.table("./UCI HAR Dataset/train/X_train.txt",colClasses="numeric")
traincodeactivities<- read.table("./UCI HAR Dataset/train/y_train.txt",colClasses="numeric")
subjecttrain<- read.table("./UCI HAR Dataset/train/subject_train.txt",colClasses="numeric")
temp<-cbind(subjecttrain,traincodeactivities,rawtraindata)
traindata<-merge(labelactivities,temp, by.x=1,by.y=2)

## Train & test datasets are joined
data<- rbind(testdata,traindata)

## Mean() & Std() variables are extracted out along with 'NameActivity' & 'Subject'
## to create the first tidy dataset
colnames<-c("CodeActivity","NameActivity","Subject", variables[[2]])
colnames(data)<-colnames
temp<-grep("mean\\(\\(|std", colnames(data))
cleandata<-data[,c(2,3,temp)]

## First tidy dataset is put in .csv & .txt files
write.csv(cleandata, "JoinedDataSets.csv", row.names = FALSE)
write.table(cleandata, "JoinedDataSets.txt", row.names = FALSE)

## It is created an independent tidy data set with
## the average of each variable for each activity and each subject.
groupedData<-group_by(cleandata,NameActivity,Subject)
avgdata<-summarise_each(groupedData,funs(mean))

## Second tidy dataset is put in .csv & .txt files
write.csv(avgdata, "AvgData.csv", row.names = FALSE)
write.table(avgdata, "AvgData.txt", row.names = FALSE)                       