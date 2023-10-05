from datetime import timedelta
from flask import Flask, redirect, url_for, render_template, request, session

app = Flask(__name__)
app.secret_key = "secret"
app.permanent_session_lifetime = timedelta(minutes=5)


@app.before_request
def before_request():
    if "username" in session:
        username = session["username"]


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
        return redirect(url_for("profile"))

    return render_template("login.html")


@app.route("/logout", methods=["GET", "POST"])
def logout():
    session.pop("username", None)
    return redirect(url_for("login"))


@app.route("/profile", methods=["GET", "POST"])
def profile():

    if request.method == "GET" and "username" in session:
        return render_template("profile.html")

    else:
        return redirect(url_for("login"))


app.run(debug=True, host="0.0.0.0", port=8080)
