import random

from Caller import Caller
from Facility import Facility
from Intervention import Intervention
from Service.TypeService import TypeService


class InterventionService:
    Intervents = []
    selectedIntervents = []

    LastIndex = 1

    TypeServ: TypeService

    def __init__(self,TS:TypeService):
        self.Intervents = []
        self.selectedIntervents = []
        self.TypeServ = TS

    def GenerateIntervention(self,fac:Facility,time1,date1):
        region = fac.region
        ccity = fac.city
        x_cord = fac.x_corrdinate + random.randint(10,30)
        y_cord = fac.y_corrdinate + random.randint(10,30)
        NewIntervent = Intervention(self.LastIndex, region,ccity,x_cord,y_cord,time1,date1)
        self.TypeServ.GenerTyp(self.LastIndex)
        self.LastIndex = self.LastIndex + 1
        self.Intervents.append(NewIntervent)
        return NewIntervent

    def GetInter(self):
        return self.Intervents;