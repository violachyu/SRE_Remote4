# models.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from app import app


app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:0503Pincky!@localhost/SRE_Remote4'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Location Model
class Location(db.Model):
    Location_Id = db.Column(db.Integer, primary_key=True)
    Location_Title = db.Column(db.String(50))
    Location_City = db.Column(db.String(50))
    Location_Address = db.Column(db.String(255))
    Location_CreatedUser = db.Column(db.String(255), default='sysadmin')
    Location_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    Location_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    Location_UpdatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    Location_ValidFlag = db.Column(db.Boolean, default=True)

# Recipient Model
class Recipient(db.Model):
    Recipient_Id = db.Column(db.Integer, primary_key=True)
    Recipient_Name = db.Column(db.String(100))
    Recipient_Address = db.Column(db.String(255))
    Recipient_Phone = db.Column(db.String(15))
    Recipient_CreatedUser = db.Column(db.String(255), default='sysadmin')
    Recipient_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    Recipient_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    Recipient_Updated_Datetime = db.Column(db.DateTime, default=datetime.utcnow)
    Recipient_ValidFlag = db.Column(db.Boolean, default=True)

# ShippingInfo Model
class ShippingInfo(db.Model):
    ShippingInfo_Id = db.Column(db.Integer, primary_key=True)
    ShippingInfo_SNO = db.Column(db.String(20), unique=True)
    ShippingInfo_RecipientId = db.Column(db.Integer, db.ForeignKey('recipient.Recipient_Id'))
    ShippingInfo_CreatedUser = db.Column(db.String(255), default='sysadmin')
    ShippingInfo_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    ShippingInfo_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    ShippingInfo_Updated_Datetime = db.Column(db.DateTime, default=datetime.utcnow)
    ShippingInfo_ValidFlag = db.Column(db.Boolean, default=True)

# TrackingEvent Model
class TrackingEvent(db.Model):
    TrackingEvent_Id = db.Column(db.Integer, primary_key=True)
    TrackingEvent_ShippingInfoSNO = db.Column(db.String(20))
    TrackingEvent_Date = db.Column(db.Date)
    TrackingEvent_Time = db.Column(db.Time)
    TrackingEvent_status = db.Column(db.String(50))
    TrackingEvent_LocationId = db.Column(db.Integer, db.ForeignKey('location.Location_Id'))
    TrackingEvent_CreatedUser = db.Column(db.String(255), default='sysadmin')
    TrackingEvent_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    TrackingEvent_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    TrackingEvent_Updated_Datetime = db.Column(db.DateTime, default=datetime.utcnow)
    TrackingEvent_ValidFlag = db.Column(db.Boolean, default=True)

if __name__ == '__main__':
    # This will create the tables in the database based on the models
    db.create_all()