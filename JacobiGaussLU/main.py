import numpy
import time
from matplotlib import pyplot

N = 984
e = 0
a1 = 5+e
a2 = -1
a3 = -1


def generate_B_vector(b):
    n = 1
    f = 6
    for i in b:
        for j in i:
            b[n - 1][0] = round(numpy.sin(n * (f + 1)), 2)
            n += 1
    return b


def generate_A_matrix(A):
    i_iterator = 0
    j_iterator = 0

    for i in A:
        for _ in i:

            if i_iterator == j_iterator:
                A[i_iterator][j_iterator] = a1

            elif i_iterator == (j_iterator + 1) or (i_iterator + 1) == j_iterator:
                A[i_iterator][j_iterator] = a2

            elif i_iterator == (j_iterator + 2) or (i_iterator + 2) == j_iterator:
                A[i_iterator][j_iterator] = a3

            j_iterator += 1
        j_iterator = 0
        i_iterator += 1


def print_matrix(b):
    for i in b:
        for j in i:
            print(j, end=' ')
        print("\n")


def write_matrix_to_file(M, name):
    f = open(name + ".txt", "w")

    for i in M:
        for j in i:
            f.write(str(j) + ",")
        f.write("\n")


def jacobi_method(A, b, x, x_prev):
    print(N)
    max_n = 10 ** -9
    n = 1.0
    counter = 0
    while n > max_n:
        for i in range(0, N):
            temp = 0.0
            for j in range(0, N):
                if i != j:
                    temp += x_prev[j][0] * A[i][j]
            x[i][0] = (b[i][0] - temp) / A[i][i]

        for i in range(0, N):
            x_prev[i] = x[i];

        res = resiudual(A, b, x)
        n = calc_norm(res)
        counter += 1

        if(n>10**9):
            print("jacobi - norm res inf")
            return x, -1

    return x, counter


def gauss_seidl_method(A, b,x,x_prev):

    max_n = 10 ** -9
    n = 1.0
    counter = 0
    while n > max_n:
        for i in range(0, N):
            temp = 0.0
            for j in range(0, i):
                    temp += x[j][0] * A[i][j]

            for j in range(i + 1, N):
                    temp += x_prev[j][0] * A[i][j]

            x[i][0] = (b[i][0] - temp) / A[i][i]

        for i in range(0, N):
            x_prev[i] = x[i];

        res = resiudual(A, b, x)
        n = calc_norm(res)
        counter += 1

        if (n > 10 ** 9):
            print("gauss-seidl - norm res inf")
            return x, -1

    return x, counter


def calc_norm(res):
    s = 0
    for i in res:
        for j in i:
            s += pow(j, 2)
    return numpy.sqrt(s)


def resiudual(A, b, x):
    res = numpy.matmul(A, x)
    for i in range(0, N):
        res[i] -= b[i]

    return res


def lu_factorization(A,b,L,U):

    counter = 0
    for i in range(0, N - 1):
        for j in range(i + 1, N):
            L[j][i] = U[j][i] / U[i][i]

            if i < j:
                L[i][j] = 0

            for k in range(i, N):
                U[j][k] = U[j][k] - L[j][i] * U[i][k]
        counter += 1

    y = forward_substitution(L, b)
    x = backward_subsitution(U, y)
    res = resiudual(A, b, x)
    n = calc_norm(res)

    return x, counter



def forward_substitution(L, b):
    y = numpy.zeros(shape=(N, 1))
    y[0][0] = b[0][0] / L[0][0]

    for i in range(0, N):
        sum = 0
        for j in range(0, i):
            sum += L[i][j] * y[j][0]

        y[i] = (b[i][0] - sum) / L[i][i]

    return y


def backward_subsitution(U, y):
    x = numpy.zeros(shape=(N, 1))
    x[N - 1] = y[N - 1] / U[N - 1][N - 1]

    for i in range(N - 2, -1, -1):
        sum = 0
        for j in range(i + 1, N):
            sum += U[i][j] * x[j]
        x[i] = (y[i] - sum) / U[i][i]

    return x

def testCase(new_N, time_jacobi_l, time_gauss_l, time_LU_l):
    global N
    N = new_N
    b = numpy.zeros(shape=(N, 1))
    A = numpy.zeros(shape=(N, N))

    x_prev = numpy.ones(shape=(N, 1))
    x = numpy.ones(shape=(N, 1))

    generate_B_vector(b)
    generate_A_matrix(A)

    # JACOBI METHOD CALL AND TIME CALCULATION
    time_jacobi_start = time.process_time()
    x_jacobi, counter_jacobi = jacobi_method(A, b, x, x_prev)
    time_jacobi_stop = time.process_time()

    # Renew X and X temp
    x_prev = numpy.ones(shape=(N, 1))
    x = numpy.ones(shape=(N, 1))

    # GAUSS-SEIDL CALL AND TIME CALCULATION
    time_gs_start = time.process_time()
    x_gauss_seidl, counter_gauss_seidl = gauss_seidl_method(A, b, x, x_prev)
    time_gs_stop = time.process_time()

    # Renew X and X temp
    x_prev = numpy.ones(shape=(N, 1))
    x = numpy.ones(shape=(N, 1))

    # LU CALL AND TIME CALCULATION
    U = numpy.copy(A)
    L = numpy.ones(shape=(N, N))
    time_lu_start = time.process_time()
    x_lu, counter_lu = lu_factorization(A,b, L, U)
    time_lu_stop = time.process_time()

    time1 = time_jacobi_stop - time_jacobi_start
    time2 = time_gs_stop - time_gs_start
    time3 =  time_lu_stop - time_lu_start

    time_jacobi_l.append(time1)
    time_gauss_l.append(time2)
    time_LU_l.append(time3
                     )
    print("Jacobi")
    print("Iterations: " + str(counter_jacobi))
    print("Time: " + str(time1) + "\n")

    print("Gauss-Seidl")
    print("Iterations: " + str(counter_gauss_seidl))
    print("Time: " + str(time2) + "\n")

    print("LU")
    print("Iterations: " + str(counter_lu))
    print("Time: " + str(time3) + "\n")

def drawPlot(N_l, time_jacobi_l, time_gauss_l, time_LU_l):

    pyplot.figure(1)
    pyplot.plot(N_l, time_jacobi_l, 'royalblue', label="Jacobi method")
    pyplot.plot(N_l, time_gauss_l, 'limegreen', label="Gauss-seidel method")
    pyplot.plot(N_l, time_LU_l, 'darkviolet', label="LU fact method")
    pyplot.legend()
    pyplot.title("How much time to calculate N-size matrix")
    pyplot.xlabel("N")
    pyplot.ylabel("Time [s]")
    pyplot.savefig("output.png")
    print("done")
    pyplot.show()


if __name__ == '__main__':

    N_list = [100,150,200,300,400]

    time_jacobi_l = []
    time_gauss_l = []
    time_LU_l = []

    for n in N_list:
        testCase(n,time_jacobi_l,time_gauss_l,time_LU_l)

    print("TIMES per N:")
    print(time_jacobi_l)
    print(time_gauss_l)
    print(time_LU_l)

    drawPlot(N_list,time_jacobi_l,time_gauss_l,time_LU_l)


