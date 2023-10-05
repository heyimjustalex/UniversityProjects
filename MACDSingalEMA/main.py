import pandas as pd
import numpy as np
import matplotlib.pyplot as mtp

def loadCSV(filename):
    return pd.read_csv(filename)[['Date','Close']]

def calculateSMA(closeVal,days):
    sma_values = []
    temp_val = 0
    arr_len = len(closeVal)
    for i in range(arr_len):
        if i >= days:
            sma_values.append(temp_val/days)
            x = i-days
            temp_val -= closeVal[x]
        temp_val += closeVal[i]
    return sma_values

def calculateAVGdays(closeVal,days):
    avg = 0
    temp_val = 0
    arr_len = len(closeVal)
    for i in range(arr_len):
        z = closeVal[i]
        temp_val+=closeVal[i]
        if i >= days-1:
            return (temp_val/days)

    return -1


def calcualteEMA(sma_values, close_values,days):
    arr_len = len(close_values)

    ema_calculations = []
    avg = sma_values[0]

    k = 2/(days+1)
    ema_calculations.append(avg)
    prev_value = avg
    for i in range(arr_len-2):
        if(i>=days-1):
            ema_val = sma_values[i-days+2]*k + prev_value*(1-k)
            ema_calculations.append(ema_val)
            prev_value = ema_val
    return ema_calculations

def calculate_macd(close_values):

    sma_values12 = calculateSMA(close_values,12)
    sma_values26 = calculateSMA(close_values,26)

    ema12 = calcualteEMA(sma_values12,close_values,12)
    ema26 = calcualteEMA(sma_values26,close_values,26)

    len_ema = len(close_values)-26

    macd_values = []
    for i in range(len_ema):
        if(i >= 25):
            macd_values.append(ema12[i-11]-ema26[i-25])

    return macd_values

def calculateSingal(macd_values):
    return calculateSMA(macd_values,9)

def calculateHistogram(macd_values, signal_values):
    histogram_values = []
    for i in range(len(macd_values)-1):
        if i >= 9:
            histogram_values.append(macd_values[i]-signal_values[i-9])
    print(histogram_values)
    return histogram_values

def getDateAsArr(data):
    x = data.Date
    return x.to_numpy()

def getCloseAsArr(data):
    x = data.Close
    return x.to_numpy()

def shiftListRight(shitft_val,list):
    new_list = []
    for i in range (len(list)):
        if i >=shitft_val:
            new_list.append(list[i-shitft_val])
        else:
            new_list.append(None)
    return new_list

def shiftListRight2(shitft_val,list):
    new_list = []
    for i in range (len(list)):
        if i >=shitft_val:
            new_list.append(list[i-shitft_val])
        else:
            new_list.append(0)
    return new_list

def drawChart(date_values,close_values, macd_values,signal_values,hist_values):

    x_values = (list(date_values))[-1000:]
    y_values = (list(close_values))[-1000:]

    window, charts = mtp.subplots(2)

    macd_values = list(macd_values)[-1000:]
    signal_values = list(signal_values)[-1000:]
    hist_values = list(hist_values)[-1000:]

    macd_values = shiftListRight(26,macd_values)
    signal_values = shiftListRight(35,signal_values)
    hist_values = shiftListRight2(35,hist_values)


    charts[0].plot(x_values, macd_values, "royalblue", label="macd")
    charts[0].plot(x_values, signal_values, "springgreen", label="signal")
    charts[0].bar(x_values, hist_values, color='tomato', width=0.8, label="histogram")

    charts[0].set_xticks(np.arange(0, len(y_values), 135))
    charts[0].legend(loc="lower left")
    charts[0].set_xlabel("Date format: (YYYY-MM-DD)")

    charts[1].plot(x_values, y_values, color="deepskyblue", label="orignial stock values")
    charts[1].set_ylabel("close price")
    charts[1].set_xlabel("Date format: (YYYY-MM-DD)")
    charts[1].set_xticks(np.arange(0, len(y_values), 135))
    charts[1].legend(loc="upper left")

    window.set_figwidth(13)
    window.set_figheight(6)
    window.tight_layout()

    mtp.axhline(linewidth=2, color='gray', linestyle='dashed')  # y = 0

    mtp.show()



if __name__== '__main__':
    filename = "TSLA.csv"
    data = loadCSV(filename)

    dates_arr = getDateAsArr(data)
    close_val_arr = getCloseAsArr(data)

    macd_values = calculate_macd(close_val_arr)
    signal_values = calculateSingal(macd_values)
    histogram_values = calculateHistogram(macd_values,signal_values)
    print(histogram_values)

    drawChart(dates_arr,close_val_arr,macd_values,signal_values,histogram_values)