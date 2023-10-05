import random

NameOfIntervention = ["Pozar","Wybuch","Bomba","Powodz","Wybuch gazu", "Wyciek plynow", "Wypadek","Epidemia", "Sanitarne","Zwierzeta", "Drogowe","Kolizja","Inne"]
MIN_SEVERITY = 1
MAX_SEVERITY = 5

class InteventionType:
    code:int
    interventionId:int
    name:str
    severity:int

    def __init__(self,code,interventionId):
        self.code = code
        self.interventionId = interventionId
        self.name = self.randomNameFromList(NameOfIntervention)
        self.severity = self.randomNumberForRange(MIN_SEVERITY,MAX_SEVERITY)

    def randomNameFromList(self,listElement):
        rndIndex = random.randint(0,len(listElement)-1)
        result = listElement[rndIndex]
        return result

    def randomNumberForRange(self,min,max):
        result = random.randint(min,max)
        return result

    def print(self):
        print("{0}|{1}|{2}|{3}".format(self.code, self.interventionId, self.name, self.severity))

    def toList(self):
        return [str(self.code),self.interventionId,self.name,self.severity]