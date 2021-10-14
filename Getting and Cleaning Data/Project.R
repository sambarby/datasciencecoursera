library(dplyr)
features <- read.table("features.txt")
colNames <- sapply(features[, 2], as.character) #use sapply instead of lapply since we want vector
X_train <- read.table("train/X_train.txt")#, col.names = colNames)
X_test <- read.table("test/X_test.txt")#, col.names = colNames)
X <- rbind(X_train, X_test) #merge by rows
names(X) <- colNames

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject <- c(subject_train[, 1], subject_test[, 1])
X$subject <- subject

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

#want to convert column names to lower case
names(X) <- tolower(names(X))

#can grep "mean" to find all columns containing this.
meanCols <- grep("mean", x = names(X))
stdCols <- grep("std", x = names(X))
desired_cols <- c(meanCols, stdCols)

mean_std_table <- X %>% select(all_of(desired_cols), subject)

#to me the rest of the instructions are not clear
