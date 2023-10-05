from flask import render_template, request, url_for, redirect
from app.models.Meeting import Meeting
from app.models.Doctor import Doctor
from app.models.Patient import Patient
from app.models.Medical_interview import Medical_interview
from app.database.database import db
from sqlalchemy import asc

ROWS_PER_PAGE = 50


def meetings():

    page = request.args.get("page", 1, type=int)
    meetings = Meeting.query.paginate(page=page, per_page=ROWS_PER_PAGE)
    needed_doctors = {}
    needed_patients = {}
    for meeting in meetings.items:
        needed_doctors[meeting.id_doctor] = Doctor.query.get_or_404(meeting.id_doctor)
        needed_patients[meeting.id_patient] = Patient.query.get_or_404(
            meeting.id_doctor
        )

    return render_template(
        "meetings.html",
        doctors=needed_doctors,
        meetings=meetings,
        patients=needed_patients,
    )


def meeting(id):
    interviews = Medical_interview.query.filter(Medical_interview.id_meeting == id)
    # print("HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE" + str(interviews[0]))
    meeting = Meeting.query.get_or_404(id)

    doctor = Doctor.query.get_or_404(meeting.id_doctor)
    patient = Patient.query.get_or_404(meeting.id_doctor)

    return render_template(
        "meeting.html",
        meeting=meeting,
        doctor=doctor,
        patient=patient,
        interviews=interviews,
    )
