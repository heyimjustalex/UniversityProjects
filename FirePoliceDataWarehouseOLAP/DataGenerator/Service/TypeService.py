import random

from InterventionType import InteventionType


class TypeService:
    TypeInterventions = []
    selectedTypeIntervention = []

    LastIndex = 1

    def __init__(self):
        self.TypeInterventions = []
        self.selectedTypeIntervention = []

    def GenerTyp(self,interventionid):
        cout = random.randint(1,3)
        for i in range(0,cout):
            newInterventionTyp = InteventionType(self.LastIndex,interventionid)
            self.TypeInterventions.append(newInterventionTyp)
            self.LastIndex = self.LastIndex + 1

    def GetTypes(self):
        return self.TypeInterventions;