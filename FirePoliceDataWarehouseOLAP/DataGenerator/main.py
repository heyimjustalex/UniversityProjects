from Date.DataVariable import *
from Service.CallerService import CallerService
from Service.CrewOnInterventionService import CrewOnInterventionService
from Service.DiscpacherService import ServiceDispacher
from Service.InterventionService import InterventionService
from Service.NotirficationService import NotificationService
from Service.TicketService import TicketService
from Service.TypeService import TypeService
from Service.VehicalService import VehicleService
from Date.Phone import *
from Service.FacilityService import FacilityService
from Service.WorkerInActionService import WorkerInActionService
from Service.WorkerService import WorkerService

import csv

from Service.mechanicService import MechanicService


def GetRandomIndex(lista):
    index = random.randint(0, len(lista)-1)
    Res = lista[index]
    return Res

headerMechanic = ["id","vin_number","registration_number","date_sent_to_fic","date_fixed","milage","car_element_name","fault_severity","cost","mechanics_report"]

def SaveToCSVWithHeader(List,name,header):
    result = []
    result.append(header)
    for i in List:
        result.append(i.toList())
    # dopisac .csv
    with open('Generowane/' + name + '.csv', 'w', newline='') as f:
        writer = csv.writer(f,delimiter=';')
        writer.writerows(result)

def saveToCSV(List,name):
    result = []
    for i in List:
        result.append(i.toList())
    #dopisac .csv
    with open('Generowane/'+name+'.csv', 'w', newline='') as f:
        writer = csv.writer(f,delimiter=',')
        writer.writerows(result)

def genDate(name):
    DispacherList = DispacherServ.GetDispachers()
    saveToCSV(DispacherList, name+"/Dispatcher")
    FacilitysList = FacilityServ.GetFacilitys()
    saveToCSV(FacilitysList, name+"/Facility")
    WorkersList = WorkerServ.GetWorkers()
    saveToCSV(WorkersList, name+"/Worker")
    VehicleList = VehicleServ.GetVehicles()
    saveToCSV(VehicleList, name+"/Vehicle")
    NotyficationList = NotificationServ.GetNotyfications()
    saveToCSV(NotyficationList, name+"/Notification")
    CallerList = CallerServ.GetCallers()
    saveToCSV(CallerList, name+"/Caller")
    TicketList = TicketServ.GetTickets()
    saveToCSV(TicketList, name+"/Ticket")
    IOC = CrewOnInterventionServ.GetCOI()
    saveToCSV(IOC, name+"/CrewOnIntervention")
    InterventionList = InterventionServ.GetInter()
    saveToCSV(InterventionList, name+"/Intervention")
    TypeList = InterventionTypeServ.GetTypes()
    saveToCSV(TypeList, name+"/Types")
    WIASLIST = WIAS.GetWIAS()
    saveToCSV(WIASLIST, name + "/WorkerInAction")
    MechanicList = MechanicServ.GetRepair()
    SaveToCSVWithHeader(MechanicList, name + "/MechanicReport",headerMechanic)

T0 = DataVariable(2000, 6, 1)
T1 = DataVariable(2000, 12, 26)
T1_2 = DataVariable(2001, 1, 1)
T2 = DataVariable(2001,6,26)

DispacherServ = ServiceDispacher()
DispacherServ.GenerateDispacher()
print("Wygenerowano Dispacherow")
CallerServ = CallerService()
TicketServ = TicketService(CallerServ,DispacherServ)
InterventionTypeServ = TypeService()
InterventionServ = InterventionService(InterventionTypeServ)
WorkerServ = WorkerService()
VehicleServ = VehicleService()
WIAS = WorkerInActionService(WorkerServ)
CrewOnInterventionServ = CrewOnInterventionService(VehicleServ,WorkerServ,WIAS)
NotificationServ = NotificationService(TicketServ,InterventionServ,CrewOnInterventionServ)
FacilityServ = FacilityService(WorkerServ,VehicleServ,NotificationServ)
FacilityServ.GeneretFacility()
print("Wygenerowano Facility")
FacilityServ.GeneretWorkerForFacility()
print("Wygenerowano Wygenerowano Worker For Facility")
FacilityServ.GeneretVehicalForFacility()
print("ygenerowano Wygenerowano Vehical for facility")
FacilityServ.GeneratNotificationForFacility(T0,T1)
print("ygenerowano Wygenerowano notifikacje")

MechanicServ = MechanicService(VehicleServ)
MechanicServ.GenerateMechanicsReport(T0,T1)


genDate("T1")


FacilityServ.GenNewFac()


CallerServ.ChangeNameCaller(1,"ROMEK")
VehicleServ.ChangeRegistrationNumberRandom()
FacilityServ.GeneratNotificationForFacility(T1_2,T2)
MechanicServ.GenerateMechanicsReport(T1_2,T2)

genDate("T2")



exit()