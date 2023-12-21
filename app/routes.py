# app/routes.py
from flask import Flask, jsonify, request
from app import app, db, redis_store
from app.models import TrackingInfo, TrackingEvent
from faker import Faker

fake = Faker()

# A. Query API
@app.route('/query', methods=['GET'])
def query_tracking():
    sno = request.args.get('sno')

    tracking_info = TrackingInfo.query.filter_by(sno=sno).first()

    if tracking_info:
        details = TrackingEvent.query.filter_by(sno=sno).all()
        recipient = tracking_info.recipient
        current_location = tracking_info.current_location

        response_data = {
            "sno": tracking_info.sno,
            "tracking_status": tracking_info.tracking_status,
            "estimated_delivery": str(tracking_info.estimated_delivery),
            "details": [
                {
                    "id": event.id,
                    "date": str(event.date),
                    "time": str(event.time),
                    "status": event.status,
                    "location_id": event.location_id,
                    "location_title": event.location_title
                }
                for event in details
            ],
            "recipient": {
                "id": recipient.id,
                "name": recipient.name,
                "address": recipient.address,
                "phone": recipient.phone
            },
            "current_location": {
                "location_id": current_location.id,
                "title": current_location.title,
                "city": current_location.city,
                "address": current_location.address
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
        tracking_info = TrackingInfo(
            sno=fake.unique.random_number(digits=10),  # Generating a random 10-digit number as sno
            tracking_status=fake.random_element(elements=('In Transit', 'Out for Delivery', 'Delivered'))
        )
        db.session.add(tracking_info)
        fake_data.append({"sno": tracking_info.sno, "tracking_status": tracking_info.tracking_status})

    db.session.commit()
    # redis_store.delete('shipments_cache')  # Clear cache

    return jsonify(fake_data)


if __name__ == '__main__':
    app.run(debug=True)