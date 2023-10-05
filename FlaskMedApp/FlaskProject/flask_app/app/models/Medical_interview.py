from app.database.database import db


class Medical_interview(db.Model):
    __tablename__ = "Medical_interview"

    id = db.Column(db.Integer, primary_key=True, unique=True, autoincrement=True)
    id_meeting = db.Column(db.Integer, db.ForeignKey("Meeting.id"))
    hygiene = db.Column(db.String(50), unique=False, nullable=True)
    treatment_story = db.Column(db.String(350), unique=False, nullable=True)
    interview_description = db.Column(db.String(350), unique=False, nullable=True)

    def __init__(
        self,
        id_meeting,
        hygiene,
        treatment_story,
        interview_description,
    ):
        self.id_meeting = id_meeting
        self.hygiene = hygiene
        self.treatment_story = treatment_story
        self.interview_description = interview_description
