import rstr

from Date.GeneratDate import generateDate
from Date.GeneratPerson import personGenerate
from Date.Phone import phoneGenerate


class Dispacher:
    pesel_number:str
    name:str
    surname:str
    sex:str
    join_date:str
    brith_date:str

    def __init__ (self,id):
        id = id + 10000
        self.pesel_number = rstr.xeger('^[9]{1}[0-9]{5}$') + str(id)
        self.name,self.surname,self.sex = personGenerate()
        self.phone_number = phoneGenerate()
        self.join_date,self.brith_date = generateDate()

    def print(self):
        print("{0}|{1}|{2}|{3}|{4}|{5}".format(self.pesel_number,self.name,self.surname,self.sex,self.join_date,self.brith_date))

    def toList(self):
        return [self.pesel_number, self.name, self.surname, self.sex, self.join_date, self.brith_date]