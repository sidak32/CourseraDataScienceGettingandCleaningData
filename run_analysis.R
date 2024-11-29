setwd("C:/Users/abhir/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
# Required Package
if (!require("reshape2")) {
  install.packages("reshape2")
}
library(reshape2)

# Define the function
run_analysis <- function() {
  
  # Check if all required files are in the current working directory
  required_files <- c(
    "./train/X_train.txt", "./test/X_test.txt", 
    "./train/y_train.txt", "./test/y_test.txt", 
    "./train/subject_train.txt", "./test/subject_test.txt", 
    "features.txt", "activity_labels.txt"
  )
  missing_files <- required_files[!file.exists(required_files)]
  
  if (length(missing_files) > 0) {
    stop("The following files are missing: ", paste(missing_files, collapse = ", "), "\nPlease ensure all files are in the working directory.")
  }
  
  # Step 1: Merge the training and test sets
  cat("\nStep 1: Merging the training and test sets\n")
  traindata <- read.table("./train/X_train.txt")
  testdata <- read.table("./test/X_test.txt")
  joindata <- rbind(traindata, testdata)
  
  trainlabel <- read.table("./train/y_train.txt")
  testlabel <- read.table("./test/y_test.txt")
  joinlabel <- rbind(trainlabel, testlabel)
  
  trainsubject <- read.table("./train/subject_train.txt")
  testsubject <- read.table("./test/subject_test.txt")
  joinsubject <- rbind(trainsubject, testsubject)
  
  # Step 2: Extract measurements on mean and standard deviation
  cat("Step 2: Extracting measurements on mean and standard deviation\n")
  features <- read.table("features.txt")
  meanstdindex <- grep("-(mean|std)\\(\\)", features[, 2])
  joindatanew <- joindata[, meanstdindex]
  colnames(joindatanew) <- features[meanstdindex, 2]
  colnames(joindatanew) <- gsub("[()]", "", colnames(joindatanew))
  colnames(joindatanew) <- gsub("-", ".", colnames(joindatanew))
  colnames(joindatanew) <- tolower(colnames(joindatanew))
  
  # Step 3: Use descriptive activity names
  cat("Step 3: Applying descriptive activity names\n")
  activity <- read.table("activity_labels.txt")
  activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
  joinlabel[, 1] <- activity[joinlabel[, 1], 2]
  colnames(joinlabel) <- "activity"
  
  # Step 4: Label data set with descriptive variable names
  cat("Step 4: Labeling data set with descriptive variable names\n")
  colnames(joinsubject) <- "subject"
  cleandata <- cbind(joinsubject, joinlabel, joindatanew)
  
  # Save merged clean data for optional output
  write.table(cleandata, "combinedcleandata.txt", row.names = FALSE)
  
  # Step 5: Create a tidy data set with the average of each variable
  cat("Step 5: Creating tidy data set with the average of each variable\n")
  meltdfrm <- melt(cleandata, id = c("activity", "subject"))
  tidydfrm <- dcast(meltdfrm, activity + subject ~ variable, mean)
  
  # Save the tidy data
  write.table(tidydfrm, "tidy_average_data.txt", row.names = FALSE, sep = "\t")
  
  cat("DONE: A tidy data file has been created in the working directory as 'tidy_average_data.txt'\n")
  return("TRUE")
}

# Run the function
run_analysis()
