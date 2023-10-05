import random

from Date.DataVariable import DataVariable
from Facility import Facility
from Notification import Notification
from Service.CrewOnInterventionService import CrewOnInterventionService
from Service.InterventionService import InterventionService
from Service.TicketService import TicketService


class NotificationService:
    Notifications = []
    selectedNotifications = []

    LastIndex = 1

    TicketServ:TicketService
    IntventionServ:InterventionService
    CrewOnInterventionServ:CrewOnInterventionService

    def __init__(self,TS:TicketService,IS:InterventionService,COI:CrewOnInterventionService):
        self.Notifications = []
        self.selectedNotifications = []
        self.TicketServ = TS
        self.IntventionServ = IS
        self.CrewOnInterventionServ = COI

    def GenerateNotifiaction(self, fac:Facility, coutMin,coutMax,min,max):
        codeFacility = fac.code
        regionFacitily = fac.region
        cityFacility = fac.city
        xFacility = fac.x_corrdinate - random.randint(10,50)
        yFacility = fac.y_corrdinate - random.randint(10,50)
        NumberOfNotyfication = random.randint(coutMin, coutMax)

        for Work in range(1,NumberOfNotyfication+1):
            ilosc = random.randint(1, 3)
            for i in range(0, ilosc):
                time, date, idTicket = self.TicketServ.GenerateTicket(min, max, xFacility, yFacility)

            ilosc = random.randint(1,20)
            for i in range(0,ilosc):
                idIntervention = self.IntventionServ.GenerateIntervention(fac, time, date)
                idCOE = self.CrewOnInterventionServ.GenerateCOI(idIntervention, date, time, fac.code,self.LastIndex)

            NewNotifications = Notification(self.LastIndex,codeFacility,regionFacitily,cityFacility,idTicket,time,date,idCOE)
            self.LastIndex = self.LastIndex+1
            self.Notifications.append(NewNotifications)





    def GetNotyfications(self):
        return self.Notifications;