import random

from Caller import Caller
from Dispacher import Dispacher
from Service import CallerService
from Service.CallerService import CallerService
from Service.DiscpacherService import ServiceDispacher
from Ticket import Ticket

MAX_CALLERS = 50
MAX_DISPACHER = 50
MAX_TICKET = 1500



class TicketService:
    Tickets:Ticket = []
    selectTicket = []

    LastIndex = 1

    CallerServ:CallerService
    DispacherServ:ServiceDispacher

    def __init__(self,CS:CallerService,DC:ServiceDispacher):
        self.Callers = []
        self.selectTicket = []

        self.CallerServ = CS
        self.DispacherServ = DC


    def GenerateTicket(self,min,max,cordX,cordY):
        DispacherForTicker:Dispacher = self.DispacherServ.GetRandomDispacher()
        idCaller = self.CallerServ.GenerateCaller(cordX,cordY)

        NewTicket = Ticket(self.LastIndex, idCaller, DispacherForTicker.pesel_number, min, max)
        self.LastIndex = self.LastIndex + 1
        self.Tickets.append(NewTicket)

        return NewTicket.time_end,NewTicket.date_end,NewTicket.id

    def GetTickets(self):
        return self.Tickets;
