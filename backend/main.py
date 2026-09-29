from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database import db

app = FastAPI()

# Allow the frontend to communicate with the backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def home():
    return {"message": "Event Ticket Booking API is running"}


@app.get("/booking/{booking_id}")
def get_booking(booking_id: str):

    cursor = db.cursor(dictionary=True)

    query = """
        SELECT
            bookings.booking_id,
            customers.name,
            customers.email,
            customers.phone,
            events.event_name,
            events.venue,
            events.event_date,
            bookings.ticket_type,
            bookings.tickets,
            bookings.amount
        FROM bookings
        JOIN customers
            ON bookings.customer_id = customers.customer_id
        JOIN events
            ON bookings.event_id = events.event_id
        WHERE bookings.booking_id = %s
    """

    cursor.execute(query, (booking_id,))
    result = cursor.fetchone()

    cursor.close()

    if result:
        return result

    return {"message": "Booking not found"}