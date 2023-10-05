from Caller import Caller

class CallerService:
    Callers:Caller = []
    selectedCaller = []

    LastIndex = 1

    def __init__(self):
        self.Callers = []
        self.selectedCaller = []

    def GenerateCaller(self, x_cord,y_cord):
        NewCaller = Caller(self.LastIndex, x_cord,y_cord)
        self.LastIndex = self.LastIndex+1
        self.Callers.append(NewCaller)
        return NewCaller.id

    def GetCallers(self):
        return self.Callers;

    def ChangeNameCaller(self,id,name):
       for i in self.Callers:
           if i.id == id:
               print("{0}:{1} -> {2}".format(i.id,i.name,name))
               i.name = name