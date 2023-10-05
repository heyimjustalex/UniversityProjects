from CrewOnIntervention import CrewOnIntervention
from Service.VehicalService import VehicleService
from Service.WorkerInActionService import WorkerInActionService
from Service.WorkerService import WorkerService


class CrewOnInterventionService:
    CrewOnInterventionServices = []
    selectedCrewOnInterventionServices = []

    LastIndex = 1

    VehicalServ:VehicleService
    WorkerServ:WorkerService
    WIAServ:WorkerInActionService

    def __init__(self,VS:VehicleService,WS:WorkerService,WAS:WorkerInActionService):
        self.CrewOnInterventionServices = []
        self.selectedCrewOnInterventionServices = []
        self.VehicalServ = VS
        self.WorkerServ = WS
        self.WIAServ = WAS

    def GenerateCOI(self, idInterv,date,time,code,idNoti):
        idVehicle = self.VehicalServ.FindCar(code)
        pesel = self.WorkerServ.FindMaster(code)
        NewCrewOnIntervention = CrewOnIntervention(self.LastIndex,idInterv,idVehicle,time,date,pesel,idNoti)
        self.CrewOnInterventionServices.append(NewCrewOnIntervention)
        self.LastIndex = self.LastIndex + 1
        self.WIAServ.GenerTyp(self.LastIndex,pesel,code)
        return self.LastIndex
    def GetCOI(self):
        return self.CrewOnInterventionServices;