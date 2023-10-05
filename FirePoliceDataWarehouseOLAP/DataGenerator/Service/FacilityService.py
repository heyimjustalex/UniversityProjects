import random

from Date.DataVariable import DataVariable
from Service.NotirficationService import NotificationService
from Service.TicketService import TicketService
from Service.WorkerService import WorkerService
from Service.VehicalService import VehicleService
from Facility import Facility

MAX_FACILITY = 600
MIN_WORKER_IN_FACILITY = 10
MAX_WORKER_IN_FACILITY = 30
MIN_VEHICAL_IN_FACILITY = 3
MAX_VEHICAL_IN_FACILITY = 10
MIN_NOTIFICATION_FOR_FACILITY = 50
MAX_NOTIFICATION_FOR_FACILITY = 500


class FacilityService:
    Facilitys = []
    selectedFacilites = []

    WorkerServ:WorkerService
    VehicleServ:VehicleService
    NotificationServ:NotificationService
    #TicketServ:TicketService

    LastIndex = 1
    def __init__(self,WS:WorkerService,VS:VehicleService,NS:NotificationService):
        self.WorkerServ = WS
        self.VehicleServ = VS
        self.NotificationServ = NS
        #self.TicketServ = TS

    def GeneretFacility(self):
        for i in range(1, MAX_FACILITY):
            NewFacility = Facility(i)
            self.Facilitys.append(NewFacility)
            self.LastIndex = self.LastIndex+1

    def GeneretWorkerForFacility(self):
        for fac in self.Facilitys:
            CodeFacility = fac.code
            self.WorkerServ.GenerateWorker(CodeFacility, MIN_WORKER_IN_FACILITY, MAX_WORKER_IN_FACILITY)


    def GeneratNotificationForFacility(self,dateStart,dateEnd):
        for fac in self.Facilitys:
            self.NotificationServ.GenerateNotifiaction(fac,MIN_NOTIFICATION_FOR_FACILITY,MAX_NOTIFICATION_FOR_FACILITY,dateStart,dateEnd)


    def GeneretVehicalForFacility(self):
        for fac in self.Facilitys:
            CodeFacility = fac.code
            self.VehicleServ.GenerateVehicle(CodeFacility,MIN_VEHICAL_IN_FACILITY,MAX_VEHICAL_IN_FACILITY)


    def GenNewFac(self):
        NewFacility = Facility(self.LastIndex)
        self.LastIndex = self.LastIndex + 1
        self.Facilitys.append(NewFacility)
        CodeFacility = NewFacility.code
        self.WorkerServ.GenerateWorker(CodeFacility, MIN_WORKER_IN_FACILITY, MAX_WORKER_IN_FACILITY)
        self.VehicleServ.GenerateVehicle(CodeFacility, MIN_VEHICAL_IN_FACILITY, MAX_VEHICAL_IN_FACILITY)
        print("{0} - Nowy wymiar".format(CodeFacility))


    def GetFacilitys(self):
        return self.Facilitys

###################################################################################
    def getAllFacilityByCity(self,CityName):
        self.selectedFacilites.clear()
        for fac in self.Facilitys:
            if CityName == fac.city:
                self.selectedFacilites.append(fac)
        self.print()
        return self.selectedFacilites

    def getRandomValueWithAll(self):
        rndIndex = random.randint(1, len(self.Facilitys)-1)
        result = self.Facilitys[rndIndex]
        return result

    def getRandomFacilityWithSelectedFacilities(self):
        rndIndex = random.randint(1, len(self.selectedFacilites)-1)
        result = self.selectedFacilites[rndIndex]
        return result

    def print(self):
        for i in self.selectedFacilites:
            i.print()

