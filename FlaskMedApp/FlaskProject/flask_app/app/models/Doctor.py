from app.database.database import db
from sqlalchemy.orm import relationship
from app.models.Person import Person


class Doctor(Person):
    __tablename__ = "Doctor"
    medical_specialization = db.Column(db.String(128), unique=False, nullable=True)
    meetings = relationship("Meeting", lazy="select")

    def __init__(
        self,
        pesel,
        name,
        surname,
        email,
        phone_num,
        born,
        address,
        disablity,
        medical_specialization,
    ):
        self.pesel = pesel
        self.name = name
        self.surname = surname
        self.email = email
        self.phone_num = phone_num
        self.born = born
        self.address = address
        self.disability = disablity
        self.medical_specialization = medical_specialization
