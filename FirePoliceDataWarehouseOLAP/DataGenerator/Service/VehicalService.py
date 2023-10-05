import random

from Vehicle import Vehicle

MAX_VEHICLE = 100

class VehicleService:
    Vehicles = []
    selectedVehicles = []

    LastIndex = 1

    def __init__(self):
        self.Vehicles = []
        self.selectedVehicles = []

    def GenerateVehicle(self, codeFacility, coutMin, coutMax):
        NumberOfVehicle = random.randint(coutMin, coutMax)
        for Work in range(1,NumberOfVehicle+1):
            NewWorker = Vehicle(self.LastIndex,codeFacility)
            self.LastIndex = self.LastIndex+1
            self.Vehicles.append(NewWorker)

    def GetVehicles(self):
        return self.Vehicles;

    def FindCar(self,codeFacility):
        self.selectedVehicles.clear()
        for veh in self.Vehicles:
            if codeFacility == veh.code_facility:
                self.selectedVehicles.append(veh)
        id = random.randint(0,len(self.selectedVehicles)-1)
        return self.selectedVehicles[id].vin_number

    def ChangeRegistrationNumberRandom(self):
        index = random.randint(0,len(self.Vehicles)-1)
        print("{0}:{1} -> {2}".format(index+1,self.Vehicles[index].registarion_number,"00000000" ))
        self.Vehicles[index].registarion_number = "00000000"


