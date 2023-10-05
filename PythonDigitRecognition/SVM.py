import pandas as pd
from sklearn import svm, metrics
from sklearn.model_selection import train_test_split
from loading import *
import seaborn as sns
import time


# mnist_train - 60000 rows x 785 columns (785 columns - the first value is the label (a number from 0 to 9) and the
# remaining 784 values are the pixel values (a number from 0 to 255))
mnist_train = pd.read_csv('mnist_train.csv')

# mnist_test - 10000 rows x 785 columns
mnist_test = pd.read_csv('mnist_test.csv')

x_data_train = mnist_train.iloc[:, 1:]
y_data_train = mnist_train.iloc[:, 0]

x_train, x_test, y_train, y_test = train_test_split(x_data_train, y_data_train, test_size=0.15)

#Create and train calssifier
classifier = svm.SVC(C=0.95)
start = time.time()
classifier.fit(x_train, y_train)

end = time.time()

# Load hand written images from disk
images, digits, n = load_digits()

# Format photos to proper format for classifier
my_digits_set_x = formatToTestSet(images)
my_digits_set_y = buildAnswersSetFromFiles(digits, n)

# Rewrite testing set to the disk data
# Delete if you want to test with MNIST
x_test = my_digits_set_x
y_test = my_digits_set_y

#Prediction
y_prediction = classifier.predict(x_test)

# count mispredicitons and plot samples
howManyMis = howManyMisPredictions(x_test, y_test, y_prediction)

print("This many mispredictions: ", howManyMis)
drawMisPredictedNumbers(x_test, y_test, y_prediction, howManyMis)

#Check accuracy
accuracy = metrics.accuracy_score(y_test, y_prediction)
print("Accuracy = {}".format(accuracy))

#Balanced accuracy
#model_balanced_acc = metrics.balanced_accuracy_score(y_test, y_prediction)
#print("Model balanced accuracy:", model_balanced_acc)


# confusion matrix
fig, ax = plt.subplots(figsize=(10, 10))
confusion_matrix = metrics.confusion_matrix(y_true=y_test, y_pred=y_prediction)

# heatmap
sns = sns.heatmap(confusion_matrix, annot=True, cmap='nipy_spectral_r', fmt='g')
sns.set_title("Confusion matrix")
plt.show()

print(end - start)

