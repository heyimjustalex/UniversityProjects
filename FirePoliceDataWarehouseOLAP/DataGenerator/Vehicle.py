import random
import rstr

from Date.GeneratDate import GenerateDateOfProductionCar

BRAND_LIST = ["Brand1","Brand2","Brand3","Brand4"]
MODEL_LIST = ["Model1","Model2","Model3","Model4"]
SIZE_VEHICLE = ["SMALL","MEDIUM","BIG","LARGE"]

MIN_MILAGE = 10000
MAX_MILAGE = 20000

MIN_DEPARTURES_NUMBER = 100
MAX_DEPARTURES_NUMBER = 200


class Vehicle:
    vin_number:str
    code_facility:str #Klucz obcy
    brand_name:str
    model:str
    size:str
    registarion_number:str
    date_of_production:str
    departures_number:int
    milage:int

    milageMechanic: int

    def __init__ (self,id,code_facility):
        self.vin_number = rstr.xeger('^[A-Z]{1}[0-9]{2}[A-Z]{5}[0-9]{2}$') + str(id+100000)
        self.code_facility = code_facility
        self.brand_name = self.randomNameFromList(BRAND_LIST)
        self.model = self.randomNameFromList(MODEL_LIST)
        self.milage = self.randomNumberForRange(MIN_MILAGE,MAX_MILAGE)
        self.departures_number = self.randomNumberForRange(MIN_DEPARTURES_NUMBER,MAX_DEPARTURES_NUMBER)
        self.size = self.randomNameFromList(SIZE_VEHICLE)
        self.date_of_production = GenerateDateOfProductionCar()
        self.registarion_number = rstr.xeger('^[A-Z]{1}[0-9]{1}$') + str(id+100000)
        self.code_facility = code_facility
        self.milageMechanic = self.milage

    def randomNameFromList(self,listElement):
        rndIndex = random.randint(0,len(listElement)-1)
        result = listElement[rndIndex]
        return result

    def randomNumberForRange(self,min,max):
        result = random.randint(min,max)
        return result

    def print(self):
        print("{0}|{1}|{2}|{3}".format(self.vin_number, self.registarion_number, self.model, self.code_facility.code))

    def toList(self):
        return [self.vin_number, self.code_facility,self.brand_name, self.model, self.size, self.registarion_number, self.date_of_production,self.departures_number,self.milage]
