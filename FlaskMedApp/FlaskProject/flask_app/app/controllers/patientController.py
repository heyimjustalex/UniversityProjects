from flask import render_template, request, url_for, redirect
from app.models.Meeting import Meeting
from app.models.Doctor import Doctor
from app.models.Patient import Patient
from app.models.Medical_interview import Medical_interview
from app.database.database import db
from sqlalchemy import asc,desc, func
from sqlalchemy import create_engine
from sqlalchemy.orm import Session

ROWS_PER_PAGE = 500


def patients():

    if request.method == "POST":
        pesel = request.form["pesel"]
        name = request.form["name"]
        surname = request.form["surname"]
        email = request.form["email"]
        phone_num = request.form["phone_num"]
        born = request.form["born"]
        address = request.form["address"]
        disablity = request.form["disability"]
        medical_offer = request.form["medical_offer"]
        patient = Patient(
            pesel=str(pesel),
            email=email,
            name=name,
            surname=surname,
            phone_num=phone_num,
            born=born,
            address=address,
            disablity=bool(disablity),
            medical_offer=medical_offer,
        )
        db.session.add(patient)
        db.session.commit()

        return redirect(url_for("blueprint.patients"))
    else:

        page = request.args.get("page", 1, type=int)
        patients = Patient.query.paginate(page=page, per_page=ROWS_PER_PAGE)

        return render_template("patients.html", patients=patients)


def patient(id):
    
    patient = Patient.query.get_or_404(id)
    return render_template("patient.html", patient=patient)




#    filter(Medical_interview.id_meeting == id)

def patient_add():
    return render_template("add_patient.html")


def patient_edit(id):
    patient = Patient.query.get_or_404(id)
    if request.method == "POST":

        try:
            pesel = str(request.form["pesel"])
        except:
            pesel = patient.pesel

        try:
            disablity = bool(request.form["disability"])
        except:
            disablity = patient.disablity

        name = request.form["name"] if request.form["name"] != "" else patient.name
        surname = (
            request.form["surname"]
            if request.form["surname"] != ""
            else patient.surname
        )
        email = request.form["email"] if request.form["email"] != "" else patient.email
        phone_num = (
            request.form["phone_num"]
            if request.form["phone_num"] != ""
            else patient.phone_num
        )
        born = request.form["born"] if request.form["born"] != "" else patient.born
        address = (
            request.form["address"]
            if request.form["address"] != ""
            else patient.address
        )
        medical_offer = (
            request.form["medical_offer"]
            if request.form["medical_offer"] != ""
            else patient.medical_offer
        )

        patient.pesel = pesel
        patient.email = email
        patient.name = name
        patient.surname = surname
        patient.phone_num = phone_num
        patient.born = born
        patient.address = address
        patient.disability = disablity
        patient.medical_offer = medical_offer

        db.session.add(patient)
        db.session.commit()

        return redirect(url_for("blueprint.patients"))
    else:
        return render_template("edit_patient.html", patient=patient)


def patient_delete(id):
    patient = Patient.query.get_or_404(id)
    db.session.delete(patient)
    db.session.commit()
    return redirect(url_for("blueprint.patients"))
