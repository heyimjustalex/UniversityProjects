
class DataVariable:
    day:int
    month:int
    year:int

    def __init__ (self, year:int,month:int,day:int):
        self.year = year
        self.month = month
        self.day = day

    def get(self) -> str:
        strmonth = str(self.month) if self.month > 9 else "0" + str(self.month)
        strday = str(self.day) if self.day > 9 else "0" + str(self.day)
        stryear = str(self.year)
        #return str(self.year) + "-" + str(self.mounth) + "-" + str(self.day)
        return stryear + "-" + strmonth + "-" + strday

    def GetAll(self):
        return self.year,self.month,self.day
