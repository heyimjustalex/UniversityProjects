import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import classification_report
from sklearn.neighbors import KNeighborsClassifier
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
import seaborn as sns
from sklearn import metrics
from loading import *
import time


# main
mnist_train = pd.read_csv('mnist_train.csv')

x_data = mnist_train.values
y_data = mnist_train.values
y = x_data[:, 0]
x_data = x_data[:, 1:]

X_train, X_test, y_train, y_test = train_test_split(x_data, y, test_size=0.15)
model = KNeighborsClassifier(n_neighbors=15)
start = time.time()
# model fitting
model.fit(X_train, y_train)
end = time.time()
images, digits, n = load_digits()
my_digits_set_x = formatToTestSet(images)
my_digits_set_y = buildAnswersSetFromFiles(digits, n)

# rewrite to my own data
# Delete these 2 if you want data from MNIST to test
X_test = my_digits_set_x
y_test = my_digits_set_y

# Calculate predictions
y_prediction = model.predict(X_test)

error = 0
i = 0
for digit in range(len(digits)):
    for _ in range(len(digits[digit])):
        guess = y_prediction[i]
        actual = digit
        print("Prediction: " + str(guess))
        print("Correct answer: " + str(actual))
        if guess != actual:
            error += 1
        plt.imshow(images[i], cmap=plt.get_cmap('gray'))  # cmap - colormap
        plt.show()
        i += 1


# count mispredicitons and plot samples
howManyMis = howManyMisPredictions(X_test, y_test, y_prediction)

print("\nThis many mispredictions: ", howManyMis)
drawMisPredictedNumbers(X_test, y_test, y_prediction, 6)

# report
# report = classification_report(y_test, y_prediction)
# print(report)

#Check accuracy
accuracy = metrics.accuracy_score(y_test, y_prediction)
print("\nModel accuracy:", accuracy)

#Balanced accuracy
#model_balanced_acc = metrics.balanced_accuracy_score(y_test, y_prediction)
#print("Model balanced accuracy:", model_balanced_acc)

# confusion matrix
fig, ax = plt.subplots(figsize=(10, 10))
confusion_matrix = confusion_matrix(y_true=y_test, y_pred=y_prediction)

# heatmap
sns = sns.heatmap(confusion_matrix, annot=True, cmap='nipy_spectral_r', fmt='g')
sns.set_title("Confusion matrix")
plt.show()

print(end - start)
