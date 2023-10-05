from datetime import timedelta
import os
from flask import Flask, redirect, url_for, request
from datetime import datetime
from pathlib import Path
import requests
import pymongo


class Logger:
    path: str

    def __init__(self) -> None:
        self.path = "./logs"
        self.create_directory("logs")
        file_path = Path(self.path + "/logs.txt")
        file_path.touch(exist_ok=True)

    def create_directory(self, dirname: str):
        if not os.path.exists("./" + dirname):
            os.makedirs("./" + dirname)

    def log_message(self, content: str = "No Content Log"):
        dt = datetime.now()

        content_constructed = (
            "MODIFIED__TIMESTAMP:" + str(dt) + " | MESSAGE: -> " + content + " |"
        )

        with open(self.path + "/logs.txt", "a+") as file_object:
            file_object.seek(0)
            data = file_object.read(100)
            if len(data) > 0:
                file_object.write("\n")

            file_object.write(content_constructed)


app = Flask(__name__)
logger = Logger()
app.secret_key = "secret"
app.permanent_session_lifetime = timedelta(minutes=5)

print("Trying to connect to MongoDB...")
client = pymongo.MongoClient("mongodb://localhost:27017")


print("Connected to MongoDB...")
dblist = client.list_database_names()
mydb = client["my_flask_db"]
mycol = mydb["my-facts"]
mycol.drop()

mycol.insert_one({"fact": "It is my first fact about cat", "length": 22})
mycol.insert_one({"fact": "It is my second fact about cat", "length": 23})
mycol.insert_one({"fact": "It is my third fact about cat", "length": 24})


@app.route("/", methods=["GET"])
def home():
    return redirect(url_for("breeds"))


@app.route("/remote-breeds", methods=["GET"])
def breeds():
    logger.log_message("/remote-breeds endpoint called")
    limit_number: int = request.args.get("limit", default="40", type=int)
    response = requests.get("https://catfact.ninja/breeds?limit=" + str(limit_number))
    dict_obj: dict = response.json()
    data_obj = dict_obj["data"]
    constructed_dict: dict = {}

    for i, d in enumerate(data_obj):
        constructed_dict[i] = d

    return constructed_dict


@app.route("/remote-facts", methods=["GET"])
def facts():
    logger.log_message("/remote-facts endpoint called")
    max_length: int = request.args.get("max_length", default="1000", type=int)
    limit_number: int = request.args.get("limit", default="15", type=int)
    response = requests.get(
        "https://catfact.ninja/facts?limit="
        + str(limit_number)
        + "&max_length="
        + str(max_length)
    )
    dict_obj: dict = response.json()
    print(dict_obj)
    data_obj = dict_obj["data"]
    constructed_dict: dict = {}

    for i, d in enumerate(data_obj):
        constructed_dict[i] = d

    return constructed_dict


@app.route("/my-facts", methods=["GET", "POST"])
def my_facts():
    list_obj = []
    temp_dict: dict = {}
    if request.method == "POST":
        content_type = request.headers.get("Content-Type")
        if content_type == "application/json":
            json_data = request.get_json()
            try:
                fact = json_data["fact"]
                length = json_data["length"]
            except:
                return "Bad Keys, define body as {'fact':'xxx', 'lenght':'12'}", 400
            temp_dict = {"fact": fact, "length": length}
            mycol.insert_one(temp_dict)
        else:
            return "Content-Type not supported!", 500

        return "Added"

    else:
        for x in mycol.find():
            list_obj.append(x)

        for i, d in enumerate(list_obj):
            temp_dict[i] = d
            temp_dict[i]["_id"] = str(i)

        return temp_dict


app.run(debug=True, host="0.0.0.0", port=80)
