from flask import render_template, request, url_for, redirect
from app.models.Doctor import Doctor
from app.database.database import db
from sqlalchemy import asc

ROWS_PER_PAGE = 100


def doctors():
    if request.method == "POST":
        pesel = request.form["pesel"]
        name = request.form["name"]
        surname = request.form["surname"]
        email = request.form["email"]
        phone_num = request.form["phone_num"]
        born = request.form["born"]
        address = request.form["address"]
        disablity = request.form["disability"]
        medical_specialization = request.form["medical_specialization"]
        doctor = Doctor(
            pesel=str(pesel),
            email=email,
            name=name,
            surname=surname,
            phone_num=phone_num,
            born=born,
            address=address,
            disablity=bool(disablity),
            medical_specialization=medical_specialization,
        )
        db.session.add(doctor)
        db.session.commit()

        return redirect(url_for("blueprint.doctors"))
    else:
        # doctors = Doctor.query.order_by(asc("id"))
        page = request.args.get("page", 1, type=int)
        doctors = Doctor.query.paginate(page=page, per_page=ROWS_PER_PAGE)
        return render_template("doctors.html", doctors=doctors)


def doctor(id):
    doctor = Doctor.query.get_or_404(id)
    return render_template("doctor.html", doctor=doctor)


def doctor_add():
    return render_template("add_doctor.html")


def doctor_edit(id):
    doctor = Doctor.query.get_or_404(id)
    if request.method == "POST":

        try:
            pesel = str(request.form["pesel"])
        except:
            pesel = doctor.pesel

        try:
            disablity = bool(request.form["disability"])
        except:
            disablity = doctor.disablity

        name = request.form["name"] if request.form["name"] != "" else doctor.name
        surname = (
            request.form["surname"] if request.form["surname"] != "" else doctor.surname
        )
        email = request.form["email"] if request.form["email"] != "" else doctor.email
        phone_num = (
            request.form["phone_num"]
            if request.form["phone_num"] != ""
            else doctor.phone_num
        )
        born = request.form["born"] if request.form["born"] != "" else doctor.born
        address = (
            request.form["address"] if request.form["address"] != "" else doctor.address
        )
        medical_specialization = (
            request.form["medical_specialization"]
            if request.form["medical_specialization"] != ""
            else doctor.medical_specialization
        )

        doctor.pesel = pesel
        doctor.email = email
        doctor.name = name
        doctor.surname = surname
        doctor.phone_num = phone_num
        doctor.born = born
        doctor.address = address
        doctor.disability = disablity
        doctor.medical_specialization = medical_specialization

        db.session.add(doctor)
        db.session.commit()

        return redirect(url_for("blueprint.doctors"))
    else:
        return render_template("edit_doctor.html", doctor=doctor)


def doctor_delete(id):
    doctor = Doctor.query.get_or_404(id)
    db.session.delete(doctor)
    db.session.commit()
    return redirect(url_for("blueprint.doctors"))
