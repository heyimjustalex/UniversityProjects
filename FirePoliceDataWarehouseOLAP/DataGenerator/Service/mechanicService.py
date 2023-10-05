import random

from Date.GeneratDate import DateStartSmallerThanEnd
from Mechanic import Mechanic
from Service.VehicalService import VehicleService


class DateStartBigherThanEnd:
    pass


class MechanicService:
    MechanicsServ = []

    LastIndex = 1

    VehicleServ:VehicleService

    def __init__(self,VS:VehicleService):
        self.MechanicsServ = []
        self.VehicleServ = VS

    def GenerateMechanicsReport(self,DateStart,DateEnd):
        Allcars = self.VehicleServ.Vehicles
        for veh in Allcars:
            cout = random.randint(0,4)
            StartDT = DateStart
            for i in range(0,cout):
                NewMechanic = Mechanic(self.LastIndex, veh, StartDT)
                StartDT = NewMechanic.date_fixed
                self.LastIndex = self.LastIndex + 1
                self.MechanicsServ.append(NewMechanic)
                if(DateStartSmallerThanEnd(StartDT,DateEnd)):
                    break

    def GetRepair(self):
        return self.MechanicsServ;