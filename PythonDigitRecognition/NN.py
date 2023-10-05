import seaborn as sns
import tensorflow as tf
import matplotlib.pyplot as plt
import numpy as np
import time
from sklearn.metrics import confusion_matrix


from keras.datasets import mnist
from sklearn.model_selection import train_test_split

from loading import load_digits, buildAnswersSetFromFiles, howManyMisPredictions, drawMisPredictedNumbers

(x_train, y_train), (x_test, y_test) = mnist.load_data()

x_train, X_test, y_train, Y_test = train_test_split(x_train, y_train, test_size=0.15)

print(x_train.shape)
print(x_test.shape)

x_train = tf.keras.utils.normalize(x_train, axis=1)

for train in range(len(x_train)):
    for row in range(28):
        for i in range(28):
            if x_train[train][row][i] != 0:
                x_train[train][row][i] = 1

model = tf.keras.models.Sequential()  # it creates an empty model object

model.add(tf.keras.layers.Flatten())  # it converts an N-dimentional layer to a 1D layer

# hidden layers
model.add(tf.keras.layers.Dense(256, activation='relu'))
model.add(tf.keras.layers.Dense(128, activation='sigmoid'))

# output layer - the number of neurons must be equal to the number of classes
model.add(tf.keras.layers.Dense(10, activation='softmax'))

model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
start = time.time()
model.fit(x_train, y_train, epochs=10)
end = time.time()
model.save('model.model')

print("Model saved\n")

# TESTING

model = tf.keras.models.load_model('model.model')

images, digits, n = load_digits()

images = tf.keras.utils.normalize(images, axis=1)

for i in range(n):
    for j in range(28):
        for k in range(28):
            if images[i][j][k] != 0:
                images[i][j][k] = 1

predictions = model.predict(images[:n])
y_prediction = []
error = 0
i = 0
for digit in range(len(digits)):
    for _ in range(len(digits[digit])):
        guess = (np.argmax(predictions[i]))  # max argument
        actual = digit
        print("Prediction: " + str(guess))
        print("Correct answer: " + str(actual))
        y_prediction.append(guess)
        if guess != actual:
            error += 1
        plt.imshow(images[i], cmap=plt.get_cmap('gray'))  # cmap - colormap
        plt.show()
        i += 1

print("\nAccuracy = " + str(((len(predictions)-error)/len(predictions)) * 100) + "%")

answers = buildAnswersSetFromFiles(digits, n)


# confusion matrix
fig, ax = plt.subplots(figsize=(10, 10))
confusion_matrix = confusion_matrix(y_true=answers, y_pred=y_prediction)

# heatmap
sns = sns.heatmap(confusion_matrix, annot=True, cmap='nipy_spectral_r', fmt='g')
sns.set_title("Confusion matrix")
plt.show()
