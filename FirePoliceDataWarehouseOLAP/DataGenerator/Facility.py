import random

region = ["dolnośląskie","kujawsko-pomorskie","lubelskie","lubuskie","łódzkie","małopolskie","mazowieckie","opolskie"] #,"podkarpackie","podlaskie","pomorskie","śląskie","świętokrzyskie","warmińsko-mazurskie","wielkopolskie","zachodniopomorskie"]

citydolonoslaskie = ["Wrocław","Wałbrzych","Legnica","Jelenia Góra","Bardo","Bielawa","Bierutów","Bogatynia","Boguszów-Gorce","Bolesławiec"]

citykujawskopomorskie = ["Bydgoszcz","Toruń","Włocławek","Grudziądz","Inowrocław","Koronowo","Brodnica","Tuchola","Świecie","Ciechocinek"]

cityLubelskie =  ["Lublin","Pulawy","Biała Podlaska","Krasnystaw","Deblin","Luków","Chełm","Hrubieszów","Kazimierz Dolny","Zamość"]

cityLubuskie = ["Zielona Gora","Gorzów Wielkopolski","Kostrzyn nad Odrą","Żagań","Skwierzyna","Żary","Gozdnica","Nowa Sól","Gubin","Słubice"]

citylodzkie = ["Łódź","Piotrków Trybunalski","Pabianice","Tomaszów Mazowiecki","Bełchatów","Zgierz","Skierniewice","Radomsko","Kutno","Sieradz"]

citymalopolskie = ["Kraków","Tarnów","Nowy Sącz","Oświęcim","Chrzanów","Olkusz","Gorlice","Zakopane","Skawina","Wieliczka"]

citymazowieckie = ["Warszawa","Radom","Płock","Siedlce","Pruszków","Legionowo","Ostrołęka","Piaseczno","Otwock","Ciechanów"]

cityopolskie = ["Opole","Nysa","Brzeg","Kluczbork","Prudnik","	Namysłów","Krapkowice","Głuchołazy","Głubczyce","Zdzieszowice"]

Code = ["DSK","KPM","LUB","LUK","LOD","MAL","MAZ","OPO"] #8

class Facility:
    code:str #AAA-123
    name:str #Straż
    region:str #województwo
    city:str   #miejscowość
    district:int # 0 - 10
    x_corrdinate:float
    y_corrdinate:float

    def __init__(self,id):

        self.name = "Straż"
        self.region = self.randomNameFromList(region)
        self.city = self.getRandomCityFromRegion()
        self.code = self.getCodeRegion() + str(id+100)
        self.district = self.getNumberDystrictFromRegion()

        self.x_corrdinate = random.randint(100,500)
        self.y_corrdinate = random.randint(100,500)

    def print(self):
        print("{2}|{0}|{1}|{3}".format(self.region, self.city, self.code, self.district))

    def randomNameFromList(self,listElement):
        rndIndex = random.randint(0,len(listElement)-1)
        result = listElement[rndIndex]
        return result

    def getRandomCityFromRegion(self):
        CityInRegion = self.getListOfCityFromRegion()
        result = self.randomNameFromList(CityInRegion)
        return result

    def getListOfCityFromRegion(self):
        return {
            "dolnośląskie": citydolonoslaskie,
            "kujawsko-pomorskie": citykujawskopomorskie,
            "lubelskie": cityLubelskie,
            "lubuskie": cityLubuskie,
            "łódzkie": citylodzkie,
            "małopolskie": citymalopolskie,
            "mazowieckie": citymazowieckie,
            "opolskie": cityopolskie,
        }[self.region]

    def getCodeRegion(self):
        return {
            "dolnośląskie": Code[0],
            "kujawsko-pomorskie": Code[1],
            "lubelskie": Code[2],
            "lubuskie": Code[3],
            "łódzkie": Code[4],
            "małopolskie": Code[5],
            "mazowieckie": Code[6],
            "opolskie": Code[7],
        }[self.region]

    def getNumberDystrictFromRegion(self):
        indexValue = region.index(self.region)+1
        return indexValue

    def toList(self):
        return [self.code, self.name, self.region, self.city, self.district, self.x_corrdinate,self.y_corrdinate]
