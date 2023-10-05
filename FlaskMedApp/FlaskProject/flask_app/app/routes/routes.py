from flask import Blueprint
from app.controllers.mainController import *
from app.controllers.patientController import *
from app.controllers.doctorController import *
from app.controllers.meetingController import *


blueprint = Blueprint("blueprint", __name__)
blueprint.route("/", methods=["GET"])(index)

blueprint.route("/patients/", methods=["GET", "POST"])(patients)
blueprint.route("/patients/<int:id>/")(patient)
blueprint.route("/patients/add/")(patient_add)
blueprint.route("/patients/<int:id>/edit/", methods=["GET", "POST"])(patient_edit)
blueprint.route("/patients/<int:id>/delete/", methods=["GET", "POST"])(patient_delete)
blueprint.route("/query2/", methods=["GET", "POST"])(query2)
blueprint.route("/query1/", methods=["GET", "POST"])(query1)

blueprint.route("/doctors/", methods=["GET", "POST"])(doctors)
blueprint.route("/doctors/<int:id>/")(doctor)
blueprint.route("/doctors/add/")(doctor_add)
blueprint.route("/doctors/<int:id>/edit/", methods=["GET", "POST"])(doctor_edit)
blueprint.route("/doctors/<int:id>/delete/", methods=["GET", "POST"])(doctor_delete)

blueprint.route("/meetings/", methods=["GET", "POST"])(meetings)
blueprint.route("/meetings/<int:id>/")(meeting)
