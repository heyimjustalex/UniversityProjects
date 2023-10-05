import random

from Date.GeneratDate import TicketDataGenerator, ChecIsThisSameDay
from Date.TimeGenerator import generateTime, GenTimeEnd


class Intervention:
    id:int
    number_of_impacted_peopole:int
    number_of_dead_people:int
    closes_city:str
    region:str
    x_cordinate:float
    y_cordinate:float
    time_intervention_start:str
    time_intervention_end:str
    date_intervention_start:str
    date_intervention_end:str

    def __init__(self,id,region,city,xcor,ycor,time,date):
        self.id = id
        self.number_of_dead_people = random.randint(0,2)
        self.number_of_impacted_peopole = random.randint(0,10)
        self.region = region
        self.closes_city = city
        self.x_cordinate = xcor
        self.y_cordinate = ycor
        self.time_intervention_start = time
        isThis,self.time_intervention_end = GenTimeEnd(time)
        self.date_intervention_start = date
        self.date_intervention_end = ChecIsThisSameDay(isThis,date)

    def toList(self):
        return [self.id, self.number_of_impacted_peopole, self.number_of_dead_people, self.closes_city, self.region, self.x_cordinate, self.y_cordinate, self.time_intervention_start.get(), self.time_intervention_end.get(), self.date_intervention_start.get() ,self.date_intervention_end.get()]