The script  run_analysis.R performs the steps described in the project's definition and reiterasted in the ReadMe.md file.

* First the data packaged is downloaded and unzipped
* Next, I load the data files and I use the rbind() function to combine the files based on those that have the same columns.
* Then, I extract only those columns with the mean and standard deviation measures, and update the column names.
* Then, I update the labels for the activities byt combining the "Y dataset" with the "activity labels" file.
* Then, I combine all the data together and ensure all names are updates.
* Finally, I generate a new dataset with all the average measures for each subject and activity type and output the result to TidyDataSet.txt.

Variables Used:

x_test_data - loaded from x_test.txt
x_train_data - loaded from x_train.txt
x_dataset - merged data from x_test_data and x_train_data
y_test_data - loaded from y_test.txt
y_train_data - loaded from y_train.txt
y_dataset - merged data from y_test_data and y_train_data
subject_test_data - loaded from subject_test.txt
subject_train_data - loaded from subject_train.txt
subject_dataset - merged data from subject_test_data and subject_train_data

features - loaded from features.txt and contains the column names for the x_dataset
activities - loaded from activity_labels.txt and contains the real names for values in the y_dataset

alldata - merged data from the updated versions of x_dataset, y_dataset, and subject_dataset.
average_data - contains the averages which will be sent to TidyDataSet.txt. (use fo the ddply() function is used and requires the plyr package to be installed and loaded).

