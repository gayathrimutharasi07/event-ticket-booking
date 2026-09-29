async function searchBooking() {

    const bookingId = document.getElementById("bookingId").value;

    if (bookingId === "") {
        alert("Please enter a Booking ID");
        return;
    }

    const response = await fetch(
        `http://127.0.0.1:8000/booking/${bookingId}`
    );

    const data = await response.json();

    const result = document.getElementById("result");

    if (data.message) {
        result.innerHTML = `<p>${data.message}</p>`;
        return;
    }

    result.innerHTML = `
        <div class="booking-card">

            <h2>🎫 Booking Details</h2>

            <p><b>Booking ID:</b> ${data.booking_id}</p>
            <p><b>Name:</b> ${data.name}</p>
            <p><b>Email:</b> ${data.email}</p>
            <p><b>Phone:</b> ${data.phone}</p>

            <p><b>Event:</b> ${data.event_name}</p>
            <p><b>Venue:</b> ${data.venue}</p>
            <p><b>Date:</b> ${data.event_date}</p>

            <p><b>Ticket Type:</b> ${data.ticket_type}</p>
            <p><b>Tickets:</b> ${data.tickets}</p>
            <p><b>Amount:</b> ₹${data.amount}</p>

        </div>
    `;
}