import random

from Date.DataVariable import DataVariable
MIN_MONTH = 1
MAX_MONTH = 12
monthToDay = {1:31,2:27,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31}

MIN_AGE_JOIN = 18
MAX_AGE_JOIN = 60
MIN_YEAR_BIRTH = 1956   #wiek 60
MAX_YEAR_BIRTH = 1996   #wiek 20
CURRENT_YEAR = 2016


def generateDate():
    rndBirthYear = random.randint(MIN_YEAR_BIRTH,MAX_YEAR_BIRTH)
    agePerson = CURRENT_YEAR - rndBirthYear
    rndAgeJoin = random.randint(MIN_AGE_JOIN,agePerson)
    joinYear = CURRENT_YEAR - (rndAgeJoin - MIN_AGE_JOIN)

    rndMounth = random.randint(1, MAX_MONTH)
    rndDay = random.randint(1, monthToDay.get(rndMounth))

    rndMounth2 = random.randint(1, MAX_MONTH)
    rndDay2 = random.randint(1, monthToDay.get(rndMounth2))

    DateJoin = DataVariable(joinYear,rndMounth,rndDay)
    DateBirth = DataVariable(rndBirthYear,rndMounth2,rndDay2)

    return DateJoin.get(),DateBirth.get()


MIN_YEAR_START_TICKET = 2017
MAX_YEAR_START_TICKET = 2021



def TicketDataGenerator(ThisSameDay,DataVariableMin,DataVariableMax):
    year_min,month_min,day_max = DataVariableMin.GetAll()
    year_max,month_max,day_max = DataVariableMax.GetAll()

    rndYearStart = random.randint(year_min, year_max)
    rndMonthStart = random.randint(month_min, month_max)
    rndDayStart = random.randint(day_max, day_max)

    rndYearEnd = rndYearStart
    rndMonthEnd = rndMonthStart
    rndDayEnd = rndDayStart

    if ThisSameDay==False:
        rndDayEnd += 1
        DaysInMonth = monthToDay.get(rndMonthStart)
        if(rndDayEnd > DaysInMonth):
            rndDayEnd -= DaysInMonth
            rndMonthEnd += 1
            if(rndMonthEnd > MAX_MONTH):
                rndMonthEnd -= MAX_MONTH
                rndYearEnd += 1

    DateStartTicket = DataVariable(rndYearStart,rndMonthStart,rndDayStart)
    DateEndTicket = DataVariable(rndYearEnd,rndMonthEnd, rndDayEnd)

    return DateStartTicket, DateEndTicket

MIN_DATE_OF_PRODUCTION_CAR = 1930
MAX_DATE_OF_PRODUCTION_CAR = 1990


def ChecIsThisSameDay(day,date:DataVariable):
    rndYearEnd, rndMonthEnd, rndDayEnd = date.GetAll()

    if day==False:
        rndDayEnd += 1
        DaysInMonth = monthToDay.get(rndMonthEnd)
        if(rndDayEnd > DaysInMonth):
            rndDayEnd -= DaysInMonth
            rndMonthEnd += 1
            if(rndMonthEnd > MAX_MONTH):
                rndMonthEnd -= MAX_MONTH
                rndYearEnd += 1
    DateEndTicket = DataVariable(rndYearEnd, rndMonthEnd, rndDayEnd)
    return DateEndTicket

def GenerateDateOfProductionCar():
    rndYearStart = random.randint(MIN_DATE_OF_PRODUCTION_CAR, MAX_DATE_OF_PRODUCTION_CAR)
    rndMonthStart = random.randint(MIN_MONTH, MAX_MONTH)
    rndDayStart = random.randint(MIN_MONTH, monthToDay.get(rndMonthStart))

    DateOfProductionCar = DataVariable(rndYearStart, rndMonthStart, rndDayStart)

    return DateOfProductionCar.get()


class DateOfMechanics:
    pass


def GenerateDateMechanicCar(dateToSend:DataVariable,monthRepair,dayToRepair):
    year,month,day = dateToSend.GetAll()

    rndYearStart = random.randint(year, year)
    rndMonthStart = random.randint(month, month+monthRepair)
    rndDayStart = random.randint(day, day+dayToRepair)

    DaysInMonth = monthToDay.get(rndMonthStart)
    if(rndDayStart > 28):
        rndDayStart -= 28
        rndMonthStart += 1
        if(rndMonthStart > MAX_MONTH):
            rndMonthStart -= MAX_MONTH
            rndYearStart += 1

    DateOfProductionCar = DataVariable(rndYearStart, rndMonthStart, rndDayStart)

    return DateOfProductionCar

def DateStartSmallerThanEnd(start,end):
    year, month, day = start.GetAll()
    year2, month2, day2 = end.GetAll()

    if(year2<year):
        if(month2<month):
            if(day2<day):
                return True
    return False




