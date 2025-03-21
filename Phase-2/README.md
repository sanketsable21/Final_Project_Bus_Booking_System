# Bus Ticket Booking System

This project is a **Bus Ticket Booking System** built using **MySQL**. It manages users, buses, tickets, routes, and payments efficiently.

## 📌 Features
- User management (registration, details, etc.)
- Bus management (types, capacity, status)
- Ticket booking and cancellation
- Route management (start and end locations)
- Payment tracking (amount, method, date)

## 🛠️ Database Schema
The project consists of the following tables:
1. **user** - Stores user details.
2. **bus** - Stores bus details.
3. **ticket** - Stores ticket bookings with references to users, buses, and routes.
4. **route** - Stores route details for buses.
5. **payment** - Stores payment transactions linked to tickets.

## 📥 Installation & Setup
1. Install MySQL Server on your system.
2. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/BusTicketBookingSystem.git
   ```
3. Navigate to the project folder:
   ```sh
   cd BusTicketBookingSystem
   ```
4. Open MySQL and execute the database file:
   ```sql
   SOURCE ProjectPhase2_SanketSable_BusTicketBookingSystem.sql;
   ```
5. Your database is now set up! 🎉

## 📜 SQL Queries
The project includes various SQL queries:
- **DDL (Data Definition Language):** Creating, altering, and deleting tables.
- **DML (Data Manipulation Language):** Inserting, updating, and deleting data.
- **DQL (Data Query Language):** Retrieving data using SELECT.
- **Joins:** Queries involving multiple tables.
- **Subqueries & Clauses:** Advanced queries using WHERE, IN, BETWEEN, etc.
- **Cascading Operations:** Automatic updates and deletions in related tables.

## 🚀 Usage Examples
**Fetch all ticket details with user, bus, route, and payment information:**
```sql
SELECT u.First_name, u.Last_name, b.Bus_number, r.Start_point, r.End_point, t.Seat_no, p.Amount, p.Payment_method
FROM ticket t
JOIN user u ON t.User_id = u.User_id
JOIN bus b ON t.Bus_id = b.Bus_id
JOIN route r ON t.Route_id = r.Route_id
JOIN payment p ON t.Ticket_id = p.Ticket_id;
```

## 📌 Contribution
Feel free to contribute to this project. Fork it, modify it, and create a pull request!
