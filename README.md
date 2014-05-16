getting-and-cleaning-data
=========================
This is my course project for getting and cleaning data.

To get the tidy data,the script take six steps:

First, it reads "features.txt" in my working directory,and do some cleaning on the variable name.
it uses gsub() to replace "-" with "." and remove the "()" to make the names more readable.

Second, it reads "X_train.txt","Y_train.txt","subject_train.txt" to combine the training data and do the same thing to test data.

Third, after giving colnames to test data and training data ,it combines these two data sets by using cbind().

After that, it uses grep() to pattern match these colnames containing "mean"or"std" and extract the needed dataset.

Next, it labels the value of the column "activity" with its responding names.

Last, it uses aggregate() to calculate the group mean of the data set by activity and subject.
