#Dokończyć kordy

from Date.GeneratPerson import *
from Date.Phone import *

class Caller:
    id:int
    name:str
    surname:str
    sex:str
    report:str
    x_coordinate:float
    y_coordinate:float
    phone_number:int

    def __init__(self,id,x,y):
        self.id = id
        self.name,self.surname,self.sex = personGenerate()
        self.phone_number = phoneGenerate()
        self.report = "Przykladowy text"
        self.x_coordinate = x
        self.y_coordinate = y
    def print(self):
        print("{5}|{0}|{1}|{2}|{3}|{4}".format(self.name,self.surname,self.sex,self.phone_number,self.report,self.id))

    def toList(self):
        return [str(self.id),self.name,self.surname,self.sex,self.report,str(self.x_coordinate),str(self.y_coordinate),str(self.phone_number)]