import random

from Service.WorkerService import WorkerService
from Worker import Worker
from Worker_in_action import WorkerInAction


class WorkerInActionService:
    WorkerInActions = []
    selectedWorkerInActions = []

    LastIndex = 1

    WorkerServ = WorkerService()

    def __init__(self,WS:WorkerService):
        self.WorkerInActions = []
        self.selectedWorkerInActions = []
        self.WorkerServ = WS

    def GenerTyp(self, interventionid,master:Worker,code):
        cout = random.randint(1, 3)
        PeselMaster = master
        List = self.WorkerServ.FindWorkerByCode(code)
        newInterventionTyp = WorkerInAction(self.LastIndex, interventionid, PeselMaster)
        self.WorkerInActions.append(newInterventionTyp)
        self.LastIndex = self.LastIndex + 1
        value = 0
        for i in List:
            if value>cout:
                break
            elif(i.peselNumber != PeselMaster):
                newInterventionTyp = WorkerInAction(self.LastIndex, interventionid, i.peselNumber)
                self.WorkerInActions.append(newInterventionTyp)
                self.LastIndex = self.LastIndex + 1
                value = value + 1

    def GetWIAS(self):
        return self.WorkerInActions;