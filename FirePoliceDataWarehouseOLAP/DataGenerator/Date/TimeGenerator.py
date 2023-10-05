import random

from Date import Time
from Date.Time import TimeVariable

MIN_HOUR = 0
MAX_HOUR = 23
MIN_MINUTE = 0
MAX_MINUTE = 59

MAX_TIME_DURATION_HOUR = 2

def generateTime():
    IsThisSameDay = True;
    rndHour_start = random.randint(MIN_HOUR,MAX_HOUR)
    rndHour_end = random.randint(rndHour_start,MAX_HOUR+MAX_TIME_DURATION_HOUR)

    rndMinute_start = random.randint(MIN_MINUTE,MAX_MINUTE)
    rndMinute_end = random.randint(MIN_MINUTE,MAX_MINUTE)

    if rndMinute_start > rndMinute_end:
        rndHour_end =+1

    if rndHour_end > 23: #W przypadku gdy ticet zostanie zaznaczony w nastepnym dniu
        IsThisSameDay = False;
        rndHour_end = rndHour_end - 24

    TimeStart = TimeVariable(rndHour_start,rndMinute_start)
    TimeEnd = TimeVariable(rndHour_end,rndMinute_end)
    #print("{0}|{1}|{2}".format(TimeStart.get(),TimeEnd.get(),IsThisSameDay))

    return TimeStart,TimeEnd, IsThisSameDay

def GenTimeEnd(TimeStart:Time):

    hour,minute = TimeStart.getAll()
    rndHour_end = random.randint(hour, MAX_HOUR + MAX_TIME_DURATION_HOUR)
    rndMinute_end = random.randint(minute, MAX_MINUTE)

    IsThisSameDay = True;
    if minute > rndMinute_end:
        rndHour_end =+1

    if rndHour_end > 23: #W przypadku gdy ticet zostanie zaznaczony w nastepnym dniu
        IsThisSameDay = False;
        rndHour_end = rndHour_end - 24
    TimeEnd = TimeVariable(rndHour_end, rndMinute_end)
    return IsThisSameDay,TimeEnd