import random
from Worker import Worker

class WorkerService:
    Workers = []
    selectedWorkers = []
    LastIndex = 1

    def __init__(self):
        self.Worker = []
        self.selectedWorkers = []

    def GenerateWorker(self, codeFacility, coutMin, coutMax):
        NumberOfEployees = random.randint(coutMin, coutMax)
        for Work in range(1,NumberOfEployees+1):
            NewWorker = Worker(self.LastIndex,codeFacility)
            self.LastIndex = self.LastIndex+1
            self.Workers.append(NewWorker)

    def GetWorkers(self):
        return self.Workers;

    def FindMaster(self,codeFacility):
        self.selectedWorkers.clear()
        for veh in self.Workers:
            if codeFacility == veh.code_facality:
                self.selectedWorkers.append(veh)
        id = random.randint(0,len(self.selectedWorkers)-1)
        return self.selectedWorkers[id].peselNumber

    def FindWorkerByCode(self,codeFacility):
        self.selectedWorkers.clear()
        for veh in self.Workers:
            if codeFacility == veh.code_facality:
                self.selectedWorkers.append(veh)
        return self.selectedWorkers
