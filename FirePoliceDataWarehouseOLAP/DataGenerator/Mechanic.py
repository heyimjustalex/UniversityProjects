# Column A - vin_number
# Column B - registration_number
# Column C - date_send_to_fix
# Column D - date_fixed
# Column E - milage
# Column F - car_element_name
# Column G - fault_severity
# Column H - cost(zł)
# Column I - mechanics_report
import random

from Date.DataVariable import DataVariable
from Date.GeneratDate import GenerateDateMechanicCar
from Vehicle import Vehicle


ElementsCar = ["Silnik","Hamulce","Wydech","Warczy"]


class Mechanic:
    id:int
    vin_number:str
    registration_number:int
    date_sent_to_fic:int
    date_fixed:int
    milage:int
    car_element_name:str
    fault_severity:int
    cost:int
    mechanics_report:str



    def __init__(self,id,car:Vehicle,date:DataVariable):
        self.id = id
        self.vin_number = car.vin_number
        self.registration_number = car.registarion_number
        self.date_sent_to_fic = GenerateDateMechanicCar(date,2,0)
        self.date_fixed = GenerateDateMechanicCar(self.date_sent_to_fic,0,10)
        self.milage = car.milageMechanic+random.randint(1000,2000)
        self.car_element_name = self.GetRandomElement()
        self.cost = random.randint(100, 10000)
        self.mechanics_report = "Komentarz mechanika"
        self.fault_severity = random.randint(1,10)

    def GetRandomElement(self):
        index = random.randint(0,len(ElementsCar)-1)
        return ElementsCar[index]

    def toList(self):
        return [str(self.id), str(self.vin_number), str(self.registration_number), self.date_sent_to_fic.get(), self.date_fixed.get(), str(self.milage),
                str(self.car_element_name), str(self.fault_severity),str(self.cost),str(self.mechanics_report)]