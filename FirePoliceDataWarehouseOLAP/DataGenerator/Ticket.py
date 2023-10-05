import random

from Date.DataVariable import DataVariable
from Date.GeneratDate import TicketDataGenerator
from Date.Time import TimeVariable
from Date.TimeGenerator import generateTime

MIN_URGENCY_LEVEL = 0
MAX_URGENCY_LEVEL = 5

class Ticket:
    id:int
    caller_id:int #klucz obcy
    dispatcher_pesel_number:str #klucz obcy
    date_start:DataVariable
    date_end:DataVariable
    time_start:TimeVariable
    time_end:TimeVariable
    urgency_level:int
    report:str

    def __init__(self,id,caller_id,dispatcher_pesel_number,min,max):
        self.id = id
        self.caller_id = caller_id
        self.dispatcher_pesel_number = dispatcher_pesel_number
        self.time_start,self.time_end,NextDay= generateTime()
        self.date_start, self.date_end = TicketDataGenerator(NextDay,min,max)
        self.urgency_level = random.randint(MIN_URGENCY_LEVEL,MAX_URGENCY_LEVEL)
        self.report = "Tu sie coś wstawi"

    def toList(self):
        return [self.id, self.caller_id, self.dispatcher_pesel_number, self.date_start.get(),self.time_start.get(), self.date_end.get(), self.time_end.get(), self.urgency_level, self.report]