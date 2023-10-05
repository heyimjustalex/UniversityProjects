import rstr

from Date.GeneratDate import TicketDataGenerator, ChecIsThisSameDay
from Date.TimeGenerator import generateTime, GenTimeEnd


class CrewOnIntervention:
    idActionCrew:int
    idIntervention:int #Klucz obcy
    idVehicle:int #Klucz obcy
    commander_pesel:int
    dateInterventionStart:str
    dateInterventionEnd:str
    report:str
    timeInterventionStart:str
    timeInterventionEnd:str
    dateArriveAtDyst:str
    timeArriveAtDyst:str
    idNotification:int
    def __init__(self,idActionCrew,idIntervention,idVehicle,time,date,masterPesel,idNoti):
        self.idActionCrew = idActionCrew
        self.idIntervention = idIntervention
        self.idVehicle = idVehicle
        self.idNotification = idNoti
        self.commander_pesel = masterPesel
        self.timeInterventionStart = time
        NextDay, self.timeInterventionEnd= GenTimeEnd(time)
        self.dateInterventionStart = date
        self.dateInterventionEnd = ChecIsThisSameDay(NextDay,date)
        self.report = "Nie wiem czy tu zawsze bedzie to samo"
        next, self.timeArriveAtDyst= GenTimeEnd(time)
        self.dateArriveAtDyst= ChecIsThisSameDay(next,date)

    def print(self):
        print("{0}|{1}|{2}|{3}|{4}|{5}".format(self.idIntervention, self.idIntervention, self.idVehicle, self.commander_pesel,self.report, self.dateArriveAtDyst))

    def toList(self):
        return [self.idActionCrew, self.idIntervention.id, self.idVehicle,self.idNotification, self.commander_pesel, self.dateInterventionStart.get(), self.dateInterventionEnd.get(), self.report,self.timeInterventionStart.get(),self.timeInterventionEnd.get(),self.dateInterventionStart.get(),self.timeArriveAtDyst.get()]