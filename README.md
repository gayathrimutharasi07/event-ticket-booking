# Event & Ticket Booking Management System

A DBMS mini project for managing customers, events, and ticket bookings using MySQL, FastAPI, HTML, CSS, and JavaScript.

## Features

- Search booking using Booking ID
- Display customer details
- Display event details
- Display ticket information
- MySQL database with relational tables
- REST API using FastAPI
- Frontend connected to backend using JavaScript Fetch API

## Technologies Used

- MySQL
- Python
- FastAPI
- HTML
- CSS
- JavaScript
- Git & GitHub

## Database Tables

### Customers
Stores customer information.

### Events
Stores event information.

### Bookings
Stores ticket booking information and connects customers with events using foreign keys.

## Project Structure

```text
event-ticket-booking/
├── backend/
│   ├── database.py
│   ├── main.py
│   └── requirements.txt
├── frontend/
│   ├── index.html
│   ├── script.js
│   └── style.css
├── database/
│   └── database.sql
├── .gitignore
└── README.md