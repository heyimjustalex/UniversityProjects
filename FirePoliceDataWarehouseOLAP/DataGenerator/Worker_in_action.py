class WorkerInAction:
    idAction:int
    idCrew:int #Klucz obcy
    idWorkerPeselNumber:str #Klucz obcy

    def __init__(self,id,idCrew,idWorkerPeselNumber):
        self.idAction = id
        self.idCrew = idCrew
        self.idWorkerPeselNumber = idWorkerPeselNumber

    def print(self):
        print("{0}|{1}|{2}|{3}".format(self.idAction, self.idCrew, self.idWorkerPeselNumber))

    def toList(self):
        return [self.idAction, self.idCrew, self.idWorkerPeselNumber]