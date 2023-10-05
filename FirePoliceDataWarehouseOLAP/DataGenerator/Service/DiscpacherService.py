import random

from Dispacher import Dispacher

COUT_DISPACHER = 5000

class ServiceDispacher:
    Dispachers = []
    selectedDispacher = []

    LastIndex = 1

    def __init__(self):
        self.Dispachers = []
        self.selectedDispacher = []

    def GenerateDispacher(self):
        for Dis in range(0,COUT_DISPACHER):
            NewDispacher = Dispacher(self.LastIndex)
            self.LastIndex = self.LastIndex+1
            self.Dispachers.append(NewDispacher)

    def GetRandomDispacher(self):
        rndindex = random.randint(0,len(self.Dispachers)-1)
        result = self.Dispachers[rndindex]
        return result

    def GetDispachers(self):
        return self.Dispachers;