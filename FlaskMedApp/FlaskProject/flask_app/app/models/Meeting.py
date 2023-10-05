from app.database.database import db
from sqlalchemy.orm import relationship


class Meeting(db.Model):
    __tablename__ = "Meeting"

    id = db.Column(db.Integer, primary_key=True)
    id_doctor = db.Column(db.Integer, db.ForeignKey("Doctor.id"))
    id_patient = db.Column(db.Integer, db.ForeignKey("Patient.id"))
    meeting_time = db.Column(db.DateTime, unique=False, nullable=True)
    meeting_description = db.Column(db.String(350), unique=False, nullable=True)
    interviews = relationship("Medical_interview", lazy='select')

    def __init__(self, id_doctor, id_patient, meeting_time, meeting_description):
        self.id_doctor = id_doctor
        self.id_patient = id_patient
        self.meeting_time = meeting_time
        self.meeting_description = meeting_description
