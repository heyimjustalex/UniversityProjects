from app.database.database import db
from sqlalchemy.orm import relationship


class Person(db.Model):
    __tablename__ = "Person"
    __abstract__ = True
    id = db.Column(db.Integer, primary_key=True, unique=True, autoincrement=True)
    pesel = db.Column(db.String(128), unique=True, nullable=False)
    name = db.Column(db.String(128), unique=False, nullable=True)
    surname = db.Column(db.String(128), unique=False, nullable=True)
    email = db.Column(db.String(128), unique=False, nullable=True)
    phone_num = db.Column(db.String(64), unique=False, nullable=True)
    born = db.Column(db.DateTime, unique=False, nullable=True)
    address = db.Column(db.String(128), unique=False, nullable=True)
    disability = db.Column(db.Boolean, unique=False, nullable=True)
