# app/routes.py
from flask import Flask, jsonify, request
from app import app, db, redis_store
from app.models import ShippingInfo, TrackingEvent, Recipient, Location

# A. Query API
@app.route('/query', methods=['GET'])
def query_tracking():
    sno = request.args.get('sno')
    tracking_info = ShippingInfo.query.filter_by(ShippingInfo_SNO=sno).first()

    if tracking_info:
        details = TrackingEvent.query.filter_by(TrackingEvent_ShippingInfoSNO=sno).all()
        recipient = Recipient.query.get(tracking_info.ShippingInfo_RecipientId)
        current_location = Location.query.get(details[-1].TrackingEvent_LocationId) if details else None

        response_data = {
            "sno": tracking_info.ShippingInfo_SNO,
            "tracking_status": tracking_info.ShippingInfo_status,
            "estimated_delivery": str(tracking_info.ShippingInfo_estimated_delivery),
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


# B. Fake API
@app.route('/fake', methods=['GET'])
def generate_fake_data():
    num = int(request.args.get('num', 1))

    fake_data = []

    for _ in range(num):
        tracking_info = ShippingInfo(
            # sno=fake.unique.random_number(digits=10),  # Generating a random 10-digit number as sno
            # tracking_status=fake.random_element(elements=('In Transit', 'Out for Delivery', 'Delivered'))
        )
        db.session.add(tracking_info)
        fake_data.append({"sno": tracking_info.sno, "tracking_status": tracking_info.tracking_status})

    db.session.commit()
    # redis_store.delete('shipments_cache')  # Clear cache

    return jsonify(fake_data)
