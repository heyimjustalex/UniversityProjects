import pandas as pd
from matplotlib import pyplot
import numpy
import scipy.linalg


def loadData(fileName):
    df = pd.read_csv(fileName)

    num_arr = df.to_numpy()
    num_arr_x = num_arr[:, 0]
    num_arr_y = num_arr[:, 1]

    return num_arr_x, num_arr_y


def lagrange_interpolation(chosen_points_x, chosen_points_y):
    def f(x):
        result = 0
        n = len(chosen_points_x)
        for i in range(n):
            xi = chosen_points_x[i]
            yi = chosen_points_y[i]
            base = 1
            for j in range(n):
                if i == j:
                    continue
                else:
                    xj = chosen_points_x[j]
                    base *= (float(x) - float(xj)) / float(float(xi) - float(xj))
            result += float(yi) * base
        return result

    return f


def lagrangeInterpolation(x, y, xp):
    m = len(x)
    n = m - 1
    yp = 0
    for i in range(n + 1):
        p = 1
        for j in range(n + 1):
            if j != i:
                p *= (xp - x[j]) / (x[i] - x[j])
        yp += y[i] * p

    return xp, yp


def interpolate_Lagrange_ex1(k, x, y, fileName):
    chosen_points_x = x[::k]
    chosen_points_y = y[::k]

    F = lagrange_interpolation(chosen_points_x, chosen_points_y)


    lagrange_x = []
    lagrange_y = []
    interpolated_y = []

    for i in x:
        interpolated_y.append(F(float(i)))

    for i in chosen_points_x[1:]:
        lagrange_x.append(float(i))
        lagrange_y.append(F(float(i)))

    pyplot.semilogy(x, y, 'k.', markersize=4, label='Original data')
    pyplot.semilogy(lagrange_x, lagrange_y, 'r.', markersize=8, label='Chosen data')
    pyplot.semilogy(x, interpolated_y, color='chartreuse', markersize=8, label='Lagrange polynomial')

    pyplot.legend()
    pyplot.suptitle(fileName)
    pyplot.ylabel('Height')
    pyplot.xlabel('Width')
    pyplot.grid()
    pyplot.show()


def spline_interpolation_ex2(k, x, y, fileName):
    x_org = x
    y_org = y

    x = x[::k]
    y = y[::k]
    n = len(x) - 1

    A = numpy.zeros(shape=(4 * n, 4 * n))
    b = numpy.zeros(shape=(4 * n, 1))

    for i in range(0, n):

        A[i][4 * i] = x[i] ** 3
        A[i][4 * i + 1] = x[i] ** 2
        A[i][4 * i + 2] = x[i]
        A[i][4 * i + 3] = 1

        b[i] = y[i]

        A[n + i][4 * i] = x[i + 1] ** 3
        A[n + i][4 * i + 1] = x[i + 1] ** 2
        A[n + i][4 * i + 2] = x[i + 1]
        A[n + i][4 * i + 3] = 1
        b[n + i] = y[i + 1]

        if i == 0:
            continue

        # f'(x)

        A[2 * n + (i - 1)][4 * (i - 1)] = 3 * x[i] ** 2
        A[2 * n + (i - 1)][4 * (i - 1) + 1] = 2 * x[i]
        A[2 * n + (i - 1)][4 * (i - 1) + 2] = 1
        A[2 * n + (i - 1)][4 * (i - 1) + 4] = -3 * x[i] ** 2
        A[2 * n + (i - 1)][4 * (i - 1) + 1 + 4] = -2 * x[i]
        A[2 * n + (i - 1)][4 * (i - 1) + 2 + 4] = -1
        b[2 * n + (i - 1)] = 0

        # f''(x)

        A[3 * n + (i - 1)][4 * (i - 1) + 0] = 6 * x[i]
        A[3 * n + (i - 1)][4 * (i - 1) + 1] = 2
        A[3 * n + (i - 1)][4 * (i - 1) + 0 + 4] = -6 * x[i]
        A[3 * n + (i - 1)][4 * (i - 1) + 1 + 4] = -2
        b[3 * n + (i - 1)] = 0

    A[3 * n - 1 + 0][0 + 0] += 6 * x[i]
    A[3 * n - 1 + 0][0 + 1] += 2
    b[3 * n - 1 + 0] += 0

    A[3 * n + n - 1][4 * (n - 1) + 0] += 6 * x[i]
    A[3 * n + n - 1][4 * (n - 1) + 1] += 2
    b[3 * n + n - 1] += 0

    # calculate X
    lu, piv = scipy.linalg.lu_factor(A)
    X = scipy.linalg.lu_solve((lu, piv), b)

    iterator = 0
    x_spl = []
    y_spl = []

    # calculate splies
    for k in range(0, len(x_org)):
        for i in range(0, len(x)-1):
            if x_org[k] <= x[i+1]:
                x_spl.append(x_org[k])
                sum = X[i*4+0] * (x_org[k] ** 3) + X[i*4 + 1] * (x_org[k] ** 2) + X[i*4 + 2] * (x_org[k]) + X[i*4 + 3]
                y_spl.append(sum[0])
                break
            iterator += 1
        iterator = 0

    print("Points number " + str(len(x)))

    pyplot.semilogy(x_org, y_org, 'r.', markersize=4, label='Original data')
    pyplot.semilogy(x_spl, y_spl, color='chartreuse', markersize=0.5, label='Spline')
    pyplot.semilogy(x, y, 'k.', markersize=5, label='Chosen data')
    pyplot.legend()
    pyplot.suptitle(fileName)
    pyplot.ylabel('Height')
    pyplot.xlabel('Width')
    pyplot.grid()
    pyplot.show()


def main():
    filenames = ["MountEverest.csv","DeathValley.csv", "Greenwich.csv"]
    everyKpoints = 10
    for i in range(len(filenames)):
        x, y = loadData(filenames[i])
        interpolate_Lagrange_ex1(everyKpoints, x, y, filenames[i])
        spline_interpolation_ex2(everyKpoints, x, y, filenames[i])


if __name__ == "__main__":
    main()
