getting-and-cleaning-data
=========================
This is my course project for getting and cleaning data.

To get the tidy data,I take six steps:

First, I read "features.txt" in my working directory,and do some cleaning on the variable name.
I use gsub() to replace "-" with "." and remove the "()" to make the names more readable.

Second, I read "X_train.txt","Y_train.txt","subject_train.txt" to combine the training data and do the same thing to test data.

Third, after giving colnames to test data and training data ,I combine these two data sets by using cbind().

After that, I use grep() to pattern match these colnames containing "mean"or"std" and extract the needed dataset.

Next, I label the value of the column "activity" with its responding names.

Last, I use aggregate() to calculate the group mean of the data set by activity and subject.
