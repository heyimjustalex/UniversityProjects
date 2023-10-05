from os import listdir
from os.path import isfile, join
from numpy import asarray
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np


def load_digits():
    directories = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    files = []
    for directory in directories:
        sub_dir = [f for f in listdir('digits/' + str(directory) + "/") if isfile(join('digits/' + str(directory) + "/", f))]
        files.append(sub_dir)

    images = []
    for i in directories:
        for file in files[i]:
            gray_image = np.zeros((28, 28), dtype=int)
            temp_image = Image.open('digits/' + str(i) + "/" + str(file))
            image_RGB = temp_image.convert('RGB')
            r, g, b = image_RGB.split()
            r = asarray(r)
            g = asarray(g)
            b = asarray(b)
            for j in range(28):
                for k in range(28):
                    pixel = r[j][k] * 0.299 + g[j][k] * 0.587 + b[j][k] * 0.114
                    negative = 255 - pixel
                    gray_image[j][k] = negative
            images.append(gray_image)

    return images, files, len(images)

def formatToTestSet(imagesArr):
    newImagesArr = np.zeros((len(imagesArr), 784), dtype=int)
    counterImagesArr = 0
    for image in imagesArr:
        newImage = np.zeros((784), dtype=int)
        counterPixels = 0
        for j in range(len(image)):
            for k in range(len(image)):
                newImage[counterPixels] = image[j][k]
                counterPixels += 1
        newImagesArr[counterImagesArr] = newImage
        counterImagesArr += 1
    return newImagesArr


def buildAnswersSetFromFiles(digits, n):
    answers = np.zeros((n), dtype=int)
    counter = 0
    whichNumber = 0

    for i in digits:
        for j in i:
            answers[counter] = whichNumber
            counter += 1
        whichNumber += 1
    return answers


def howManyMisPredictions(X_test, y_test, predicted):
    counter = 0
    for i in range(len(X_test)):
        if predicted[i] != y_test[i]:
            counter += 1
    return counter


def drawMisPredictedNumbers(X_test, y_test, predicted, howManyMisPredicitons):
    figure, axes = plt.subplots(1, howManyMisPredicitons, figsize=(15, 6))
    figure.suptitle('Badly predicted numbers', fontsize=16)
    counter = 0
    for i in range(len(X_test)):
        if predicted[i] != y_test[i]:
            # print("Predicted number: ", predicted[i], "Actual number: ", y_test[i])
            reshaped_x = np.reshape(X_test[i], (28, 28))
            axes[counter].imshow(reshaped_x, cmap=plt.cm.gray_r)
            axes[counter].set_title('Org: ' + str(y_test[i]) + " Pred:" + str(predicted[i]))
            counter += 1
            if counter >= howManyMisPredicitons:
                break
    plt.show()
