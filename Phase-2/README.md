# Bus Ticket Booking System - Database Schema 🚌💳

## Overview 📌
This project, **Bus Ticket Booking System**, is designed to manage bus ticket reservations efficiently. The system includes features for user registration, bus details, booking management, payment processing, and more. The provided SQL file contains the database schema and necessary queries for setting up the system.

## File Information 📂
- **Filename**: `ProjectPhase2_SanketSable_BusTicketBookingSystem.sql`
- **Purpose**: Defines the database schema, tables, relationships, constraints, and sample data for the bus ticket booking system.

## Database Schema 🏗️
The database consists of multiple tables to handle various functionalities. Below are the primary tables:

### 1. **Users 👤**
Manages user details.
- `user_id` (Primary Key)
- `name`
- `email`
- `password`
- `phone_number`
- `role` (e.g., Admin, Customer)

### 2. **Buses 🚌**
Stores details about buses.
- `bus_id` (Primary Key)
- `bus_name`
- `bus_number`
- `seat_capacity`
- `route_id`
- `operator_name`

### 3. **Routes 🗺️**
Defines bus routes.
- `route_id` (Primary Key)
- `source`
- `destination`
- `distance`
- `duration`

### 4. **Bookings 🎟️**
Handles customer bookings.
- `booking_id` (Primary Key)
- `user_id` (Foreign Key)
- `bus_id` (Foreign Key)
- `travel_date`
- `seats_booked`
- `total_fare`
- `status` (e.g., Confirmed, Canceled)

### 5. **Payments 💰**
Manages payment transactions.
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key)
- `amount`
- `payment_status` (e.g., Paid, Pending)
- `transaction_date`

## How to Use 🛠️
1. **Database Setup**: Import the SQL file into MySQL or any supported RDBMS.
2. **User Roles**: Assign roles such as Admin and Customer to control access.
3. **Booking Process**:
   - Users can register and log in.
   - Search for available buses on a specific route.
   - Select seats and confirm booking.
   - Complete the payment process.
4. **Admin Controls**:
   - Manage buses, routes, and schedules.
   - View and update booking statuses.
   
## Technologies Used 💻
- **Database**: MySQL / PostgreSQL
- **Query Language**: SQL
- **Framework Compatibility**: Can be integrated with backend systems using Java, Python, or PHP.

## Future Enhancements 🚀
- Add seat selection functionality.
- Implement discount or promotional offers.
- Integrate real-time bus tracking.
