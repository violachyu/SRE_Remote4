from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
# from config import Config
# from flask_redis import FlaskRedis
# from app import routes

app = Flask(__name__)
app.config.from_object('config')
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
    ShippingInfo_Id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ShippingInfo_SNO = db.Column(db.String(20), unique=True)
    ShippingInfo_RecipientId = db.Column(db.Integer, db.ForeignKey('recipient.Recipient_Id'))
    ShippingInfo_CreatedUser = db.Column(db.String(255), default='sysadmin')
    ShippingInfo_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    ShippingInfo_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    ShippingInfo_Updated_Datetime = db.Column(db.DateTime, default=datetime.utcnow)
    ShippingInfo_ValidFlag = db.Column(db.Boolean, default=True)

# TrackingEvent Model
class TrackingEvent(db.Model):
    TrackingEvent_Id = db.Column(db.Integer, primary_key=True, autoincrement=True)
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

class TestTaker(db.Model):
    TestTaker_Id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TestTaker_Name = db.Column(db.String(50))
    TestTaker_Gender = db.Column(db.String(50))
    TestTaker_CreatedUser = db.Column(db.String(255), default='sysadmin')
    TestTaker_CreatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    TestTaker_UpdatedUser = db.Column(db.String(255), default='sysadmin')
    TestTaker_UpdatedDatetime = db.Column(db.DateTime, default=datetime.utcnow)
    TestTaker_ValidFlag = db.Column(db.Boolean, default=True)


### Routes
@app.route('/query', methods=['GET'])
def query_tracking():
    sno = request.args.get('sno')
    shipping_info = ShippingInfo.query.filter_by(ShippingInfo_SNO=sno).first()

    if shipping_info:
        details = TrackingEvent.query.filter_by(TrackingEvent_ShippingInfoSNO=sno).all()
        newest_tracking_event = details[-1]
        recipient = Recipient.query.filter_by(Recipient_Id = shipping_info.ShippingInfo_RecipientId).first()
        current_location = Location.query.filter_by(Location_Id = newest_tracking_event.TrackingEvent_LocationId).first() if details else None

        response_data = {
            "sno": shipping_info.ShippingInfo_SNO,
            "tracking_status": newest_tracking_event.TrackingEvent_status,
            "estimated_delivery": str(newest_tracking_event.TrackingEvent_Date),
            "details": [
                {
                    "id": event.TrackingEvent_Id,
                    "date": str(event.TrackingEvent_Date),
                    "time": str(event.TrackingEvent_Time),
                    "status": event.TrackingEvent_status,
                    "location_id": event.TrackingEvent_LocationId,
                    "location_title": Location.query.get(event.TrackingEvent_LocationId).Location_Title
                }
                for event in details
            ],
            "recipient": {
                "id": recipient.Recipient_Id,
                "name": recipient.Recipient_Name,
                "address": recipient.Recipient_Address,
                "phone": recipient.Recipient_Phone
            },
            "current_location": {
                "location_id": current_location.Location_Id if current_location else None,
                "title": current_location.Location_Title if current_location else None,
                "city": current_location.Location_City if current_location else None,
                "address": current_location.Location_Address if current_location else None
            }
        }

        return jsonify({"status": "success", "data": response_data, "error": None})
    else:
        return jsonify({"status": "error", "data": None, "error": {"code": 404, "message": "Tracking number not found"}})


if __name__ == '__main__':
    app.run(debug=True)