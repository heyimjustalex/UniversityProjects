import random
import rstr
from Date.GeneratDate import generateDate
from Date.GeneratPerson import personGenerate


JOBS_LIST_WORK = ["Stazak"]

class Worker:
    peselNumber:str
    code_facality:str #Klucz obcy
    name:str
    surname:str
    sex:str
    join_date:str
    brith_date:str
    job_name:str

    def __init__(self,id,code_facality):
        id = id + 100000
        self.peselNumber = rstr.xeger('^[9]{1}[0-9]{4}$') + str(id)
        self.name,self.surname,self.sex = personGenerate()
        self.join_date,self.brith_date = generateDate()
        self.job_name = self.generateJobName()
        self.code_facality = code_facality

    def generateJobName(self):
        rndJobs = random.randint(0,len(JOBS_LIST_WORK)-1)
        NameJob = JOBS_LIST_WORK[rndJobs]
        return NameJob

    def print(self):
        print("{2}|{0}|{1}|{3}".format(self.peselNumber, self.name, self.job_name, self.code_facality.code))

    def toList(self):
        return [self.peselNumber, self.code_facality, self.name, self.surname, self.sex, self.join_date,self.brith_date,self.job_name]


