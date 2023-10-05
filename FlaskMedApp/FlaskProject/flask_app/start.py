from app import app
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from sqlalchemy.orm import relationship
from app.database.database import db
from app.models.Meeting import Meeting
from app.models.Patient import Patient
from app.models.Doctor import Doctor
from app.models.Medical_interview import Medical_interview
from datetime import datetime
from app.routes.routes import blueprint
import pandas as pd


def load_data_from_csv():
    print("START LOADINAAAAAAAAAAAAAAa")
    doctors_csv = pd.read_csv(r"./sample_data/doctors.csv", delimiter=";")
    global doctors_df
    doctors_df = pd.DataFrame(
        doctors_csv,
        columns=[
            "pesel",
            "name",
            "surname",
            "email",
            "phone_num",
            "born",
            "address",
            "disability",
            "medical_specialization",
        ],
    )

    patients_csv = pd.read_csv(r"./sample_data/patients.csv", delimiter=";")
    global patients_df
    patients_df = pd.DataFrame(
        patients_csv,
        columns=[
            "pesel",
            "name",
            "surname",
            "email",
            "phone_num",
            "born",
            "address",
            "disability",
            "medical_offer",
        ],
    )

    medical_interviews_csv = pd.read_csv(
        r"./sample_data/medicalInterviews.csv", delimiter=";"
    )
    global medical_interviews_df
    medical_interviews_df = pd.DataFrame(
        medical_interviews_csv,
        columns=[
            "id_meeting",
            "hygiene",
            "treatment_story",
            "email",
            "interview_description",
        ],
    )

    meetings_csv = pd.read_csv(r"./sample_data/meetings.csv", delimiter=";")
    global meetings_df
    meetings_df = pd.DataFrame(
        meetings_csv,
        columns=["id_doctor", "id_patient", "meeting_time", "meeting_description"],
    )

    print(doctors_df)
    print(patients_df)
    print(medical_interviews_df)
    print(meetings_df)

    print("STOP LOADINGGGGGGGGGGGGGGGGGGGGGGGGGGGG")


def create_db_schema():
    with app.app_context():
        db.drop_all()
    with app.app_context():
        db.create_all()
        db.session.commit()


def load_doctors_to_database_from_global_df():
    with app.app_context():
        for index, row in doctors_df.iterrows():
            db.session.add(
                Doctor(
                    pesel=row["pesel"],
                    name=row["name"],
                    surname=row["surname"],
                    email=row["email"],
                    phone_num=row["phone_num"],
                    born=datetime.strptime(str(row["born"]), "%b %d %Y"),
                    address=row["address"],
                    disablity=bool(row["disability"]),
                    medical_specialization=row["medical_specialization"],
                )
            )
        db.session.commit()


def load_patients_to_database_from_global_df():
    with app.app_context():
        for index, row in patients_df.iterrows():
            db.session.add(
                Patient(
                    pesel=row["pesel"],
                    name=row["name"],
                    surname=row["surname"],
                    email=row["email"],
                    phone_num=row["phone_num"],
                    born=datetime.strptime(str(row["born"]), "%b %d %Y"),
                    address=row["address"],
                    disablity=bool(row["disability"]),
                    medical_offer=row["medical_offer"],
                )
            )
        db.session.commit()


def load_meetings_to_database_from_global_df():
    with app.app_context():
        for index, row in meetings_df.iterrows():
            db.session.add(
                Meeting(
                    id_doctor=row["id_doctor"],
                    id_patient=row["id_patient"],
                    meeting_time=datetime.strptime(
                        str(row["meeting_time"]), "%b %d %Y %I:%M%p"
                    ),
                    meeting_description=row["meeting_description"],
                )
            )
        db.session.commit()


def load_medical_interviews_to_database_from_global_df():
    with app.app_context():
        for index, row in medical_interviews_df.iterrows():
            db.session.add(
                Medical_interview(
                    id_meeting=row["id_meeting"],
                    hygiene=row["hygiene"],
                    treatment_story=row["treatment_story"],
                    interview_description=row["interview_description"],
                )
            )
        db.session.commit()


def setup_database_and_load_small_data():

    with app.app_context():

        db.session.add(
            Patient(
                pesel="111",
                name="jack",
                surname="sparrow",
                email="asd@asd.pl",
                phone_num="790231432",
                born=datetime.strptime("Jun 1 2005", "%b %d %Y"),
                address="asdasd",
                disablity=1,
                medical_offer="test",
            )
        )
        db.session.add(
            Patient(
                pesel="222",
                name="jack2",
                surname="sparrow2",
                email="asd2@asd.pl",
                phone_num="791231432",
                # born=datetime.strptime("Jun 3 2006 1:33PM", "%b %d %Y %I:%M%p"),
                born=datetime.strptime("Jun 3 2006", "%b %d %Y"),
                address="asdsadasd",
                disablity=0,
                medical_offer="test1",
            )
        )

        db.session.add(
            Patient(
                pesel="333",
                name="jack3",
                surname="sparrow3",
                email="asd3@asd.pl",
                phone_num="711232312",
                born=datetime.strptime("May 12 2015", "%b %d %Y"),
                address="asdplplplpl",
                disablity=0,
                medical_offer="test2",
            )
        )

        db.session.add(
            Doctor(
                pesel="1111",
                name="jack3Doctor",
                surname="sparrow3Doctor",
                email="asd4@asd.pl",
                phone_num="7asd232312",
                born=datetime.strptime("May 13 2015", "%b %d %Y"),
                address="asdplplplpl",
                disablity=0,
                medical_specialization="cardio",
            )
        )

        db.session.add(
            Doctor(
                pesel="2222",
                name="jack4Doctor",
                surname="sparrow34Doctor",
                email="asd5@asd.pl",
                phone_num="7aasgg232312",
                born=datetime.strptime("May 16 2015", "%b %d %Y"),
                address="asdplplplpasssl",
                disablity=1,
                medical_specialization="dentist",
            )
        )

        db.session.add(
            Meeting(
                id_doctor=1,
                id_patient=1,
                meeting_time=datetime.strptime("Jun 3 2006 1:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )
        db.session.add(
            Meeting(
                id_doctor=1,
                id_patient=1,
                meeting_time=datetime.strptime("Jun 5 2006 1:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )

        db.session.add(
            Meeting(
                id_doctor=1,
                id_patient=3,
                meeting_time=datetime.strptime("Jun 5 2004 2:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )

        db.session.add(
            Meeting(
                id_doctor=2,
                id_patient=1,
                meeting_time=datetime.strptime("Jun 5 2005 3:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )

        db.session.add(
            Meeting(
                id_doctor=2,
                id_patient=3,
                meeting_time=datetime.strptime("May 5 2005 3:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )

        db.session.add(
            Meeting(
                id_doctor=2,
                id_patient=3,
                meeting_time=datetime.strptime("May 8 2009 3:33PM", "%b %d %Y %I:%M%p"),
                meeting_description="asopoassagpj poasjs ap s apjogsaposagpo",
            )
        )

        db.session.add(
            Medical_interview(
                id_meeting=1,
                hygiene="hyg1",
                treatment_story="treatemenentt1",
                interview_description="desc1",
            )
        )

        db.session.add(
            Medical_interview(
                id_meeting=2,
                hygiene="hyg2",
                treatment_story="treatemenentt2",
                interview_description="desc2",
            )
        )
        db.session.add(
            Medical_interview(
                id_meeting=1,
                hygiene="hyg33",
                treatment_story="treatemenentt233",
                interview_description="desc233",
            )
        )
        db.session.add(
            Medical_interview(
                id_meeting=2,
                hygiene="hyg24444",
                treatment_story="treatemenentt244",
                interview_description="desc244",
            )
        )
        db.session.commit()


app = Flask(__name__, template_folder="app/templates")
app.config.from_object("app.config.Config")
db.init_app(app)
app.register_blueprint(blueprint, url_prefix="/")
migrate = Migrate(app, db)
load_data_from_csv()
create_db_schema()
load_doctors_to_database_from_global_df()
load_patients_to_database_from_global_df()
load_meetings_to_database_from_global_df()
load_medical_interviews_to_database_from_global_df()
# setup_database_and_load_small_data()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)


# def configure_dependencies(binder):
#     binder.bind(SQLAlchemy, to=db, scope=flask_injector.singleton)

# flask_injector.FlaskInjector(app=app, modules=[configure_dependencies])
# print("DONE")
