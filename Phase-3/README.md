# 🚌 Bus Ticket Booking System

## 📌 Project Overview
The **Bus Ticket Booking System** is a structured database designed to manage users, buses, ticket bookings, routes, and payments efficiently. This project includes SQL scripts for creating tables, inserting sample data, performing JOIN operations, subqueries, and user-defined functions.

---

## 📂 Database Schema
The database consists of the following tables:

1. **user** 👤 - Stores user details.
2. **bus** 🚌 - Stores bus details.
3. **ticket** 🎟 - Manages ticket bookings.
4. **route** 🛣 - Stores bus route information.
5. **payment** 💳 - Handles payments for tickets.

---

## 🏗 SQL Queries Implemented
The project contains various SQL queries categorized into:

### 🔹 10 JOIN Queries:
- Retrieve user details along with their booked tickets.
- Get route details with corresponding bus information.
- Fetch payment details with user and ticket information.
- Retrieve users who booked a specific bus type.

### 🔹 10 Subqueries:
- Get users who booked at least one ticket.
- Fetch buses that are part of active routes.
- Retrieve users who spent above the average payment amount.
- Find the bus with the highest ticket bookings.

### 🔹 10 User-Defined & Built-in Function Queries:
- Get the total number of users.
- Retrieve the highest, lowest, and average ticket price.
- Count tickets per bus.
- Convert user names to uppercase.
- Custom function to calculate total user spending.
- Custom function to fetch the number of tickets per user.

---

## 🛠 Installation & Usage
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/BusTicketBookingSystem.git
   ```
2. **Import the SQL File:**
   - Open MySQL Workbench or any SQL client.
   - Import and execute `ProjectPhase2_SanketSable_BusTicketBookingSystem.sql`.

3. **Run Queries:**
   - Execute different SQL queries to test functionalities.

---

## 💡 Features
✅ Structured database with relational integrity  
✅ Real-world use case implementation  
✅ Includes JOINs, Subqueries, and Functions  
✅ Payment and ticket management  
✅ Scalable and optimized for performance  
