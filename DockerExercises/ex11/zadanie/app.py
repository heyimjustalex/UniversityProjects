from datetime import timedelta
import os
from flask import Flask, redirect, url_for, render_template, request, session
from datetime import datetime
from pathlib import Path
from os import walk


class Logger:
    path: str

    def __init__(self) -> None:
        self.path = "./logs"
        self.create_directory("logs")
        self.create_directory("uploaded")
        file_path = Path(self.path + "/logs.txt")
        file_path.touch(exist_ok=True)

    def create_directory(self, dirname: str):
        if not os.path.exists("./" + dirname):
            os.makedirs("./" + dirname)

    def log_message(self, username: str, content: str = "No Content Log"):
        dt = datetime.now()

        content_constructed = (
            "MODIFIED__TIMESTAMP:"
            + str(dt)
            + " | USERNAME:"
            + username
            + " | MESSAGE: -> "
            + content
            + " |"
        )

        with open(self.path + "/logs.txt", "a+") as file_object:

            file_object.seek(0)
            data = file_object.read(100)
            if len(data) > 0:
                file_object.write("\n")

            file_object.write(content_constructed)


filenames: list = []
filenames = next(walk("./uploaded"), (None, None, []))[2]
logger = Logger()
app = Flask(__name__)
app.secret_key = "secret"
app.permanent_session_lifetime = timedelta(minutes=5)
UPLOAD_FOLDER = "./uploaded/"

app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER


@app.before_request
def before_request():
    if "username" in session:
        redirect(url_for("profile"))


@app.route("/", methods=["GET", "POST"])
def home():
    if "username" not in session:
        return redirect(url_for("login"))

    return redirect(url_for("profile"))


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        session.pop("username", None)
        session.permanent = True
        username = request.form["username"]
        session["username"] = username
        logger.log_message(username, "user just logged")
        return redirect(url_for("profile"))

    elif "username" in session:
        session.pop("username", None)
        session.permanent = True
    return render_template("login.html")


@app.route("/logout", methods=["GET", "POST"])
def logout():
    session.pop("username", None)
    return redirect(url_for("login"))


@app.route("/profile", methods=["GET", "POST"])
def profile():
    filenames = next(walk("./uploaded"), (None, None, []))[2]
    if request.method == "GET" and "username" in session:
        return render_template("profile.html", len=len(filenames), filenames=filenames)

    else:
        return redirect(url_for("login"))


@app.route("/upload/", methods=["GET", "POST"])
def upload_file():
    if request.method == "POST":
        file = request.files["file[]"]
        if file:
            filename = file.filename
            file.save(os.path.join(app.config["UPLOAD_FOLDER"], filename))
            username = session["username"]
            logger.log_message(username, "saved file on the server")

    return redirect(url_for("profile"))


app.run(debug=True, host="0.0.0.0", port=8080)
