# models.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tracking.db'  # SQLite database for simplicity
db = SQLAlchemy(app)

class TrackingEvent(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sno = db.Column(db.String(20))
    date = db.Column(db.Date)
    time = db.Column(db.Time)
    status = db.Column(db.String(50))
    location_id = db.Column(db.Integer)
    location_title = db.Column(db.String(50))

class Recipient(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    address = db.Column(db.String(255))
    phone = db.Column(db.String(15))

class Location(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50))
    city = db.Column(db.String(50))
    address = db.Column(db.String(255))

class TrackingInfo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sno = db.Column(db.String(20), unique=True)
    tracking_status = db.Column(db.String(50))
    estimated_delivery = db.Column(db.Date)
    recipient_id = db.Column(db.Integer, db.ForeignKey('recipient.id'))
    current_location_id = db.Column(db.Integer, db.ForeignKey('location.id'))

    recipient = db.relationship('Recipient', backref='tracking_info')
    current_location = db.relationship('Location', backref='tracking_info')

# Create tables in the database
db.create_all()



# def __init__(self, name, city, addr,pin):
#    self.name = name
#    self.city = city
#    self.addr = addr
#    self.pin = pin