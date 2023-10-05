import random

class TimeVariable:
    hour:int
    minute:int
    secund:int

    def __init__ (self, hour:int,minute:int):
        self.hour = hour
        self.minute = minute
        self.secund = "00"

    def get(self) -> str:
        strhour = str(self.hour) if self.hour > 9 else "0" + str(self.hour)
        strminute = str(self.minute) if self.minute > 9 else "0" + str(self.minute)
        return (strhour + ":" + strminute +":"+self.secund)

    def getAll(self):
        return self.hour,self.minute