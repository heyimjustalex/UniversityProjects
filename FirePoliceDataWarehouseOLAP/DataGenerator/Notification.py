from Date.DataVariable import DataVariable
from Date.GeneratDate import TicketDataGenerator, ChecIsThisSameDay
from Date.TimeGenerator import generateTime, GenTimeEnd


class Notification:
    id:int
    code_facility:str #Klucz obcy
    id_ticket:id #Klucz obcy
    id_action_crew:id #Klucz obcy
    date_start:str
    date_end:str
    time_start:str
    time_end:str
    city:str
    region:str

    def __init__(self,id,code,region,city,idTicket,time,date,idc):
        self.id = id
        self.id_ticket = idTicket
        self.id_action_crew = idc
        self.code_facility = code
        self.time_start = time
        thisSameDay, self.time_end = GenTimeEnd(time)
        self.date_start = date
        self.date_end = ChecIsThisSameDay(thisSameDay,self.date_start)
        self.city = city
        self.region = region

    def print(self):
        print("{0}|{1}|{2}|{3}|{4}|{5}".format(self.id,self.id_ticket,self.id_action_crew,self.code_facility,self.city,self.region))

    def toList(self):
        return [self.id, self.code_facility, self.id_ticket, self.date_start.get(), self.date_end.get(),self.time_start.get(),self.time_end.get(),self.city,self.region]




