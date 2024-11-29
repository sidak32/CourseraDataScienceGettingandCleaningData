## Peer-Graded Assignment: Getting and Cleaning Data Course Project

### Project Overview

This project showcases the ability to collect, manipulate, and clean a dataset, fulfilling specific academic criteria. 
The evaluation will focus on the tidiness of the dataset, the presence of required scripts in a GitHub repository, the comprehensiveness of a codebook, and the clarity of the README file.

### Project Objectives

The objective of this project is to prepare tidy data for subsequent analysis. The tasks include:

1. Merging training and test datasets into a single dataset.
2. Extracting measurements that reflect the mean and standard deviation.
3. Using descriptive names for activities in the dataset.
4. Appropriately labeling the dataset with clear variable names.
5. Creating an independent tidy dataset that averages each variable for each activity and subject.

### Data Source

The project utilizes data collected from the accelerometers of Samsung Galaxy S smartphones, which can be accessed through the following link: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The dataset can be downloaded from: [Dataset Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### Script Requirements

An R script named `run_analysis.R` must be created to perform the following steps:

1. Combine training and test sets into a single dataset.
2. Filter only the measurements that correspond to the mean and standard deviation for each measurement.
3. Assign descriptive activity names to the dataset.
4. Label the dataset with clear variable names.
5. Generate a second tidy dataset that contains the average of each variable grouped by activity and subject.

### Steps to Create Tidy Data

1. **Data Acquisition**: Download the raw dataset and unzip the files to a specified working directory.
2. **Executing the Script**: To run the script in RStudio, use the following commands:
   ```R
   source("run_analysis.R")  # Load the script
   run_analysis()             # Execute the script
   ```

3. **Step Breakdown in `run_analysis.R`**:
   - **Step 1**: Merge training and test datasets (e.g., `X_train.txt`, `y_train.txt`, `subject_train.txt`).
   - **Step 2**: Extract measurements related to the mean and standard deviation using the `grep` function.
   - **Step 3**: Map descriptive activity names to a new column in the dataset.
   - **Step 4**: Label the dataset accurately, producing a clean data frame called `cleandata`.
   - **Step 5**: Create a tidy dataset that averages the measurements for each activity and subject, outputting to `tidyDataSet.txt`.

### Acknowledgments and Licensing

This dataset was developed by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. The dataset is available under the following reference for any publications:

- **Reference**: Anguita, D., Ghio, A., Oneto, L., Parra, X., & Reyes-Ortiz, J. L. (2012). Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain.

The dataset is distributed without any guarantees, and the authors are not responsible for any misuse. Commercial use of this dataset is prohibited.

### Repository Structure

Your GitHub repository must include:
- The script `run_analysis.R`.
- The output tidy dataset as a `.txt` file.
- A `README.md` explaining the analysis workflow and the code's functionality.
