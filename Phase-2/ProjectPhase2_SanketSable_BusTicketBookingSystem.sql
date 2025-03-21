-- DATABASE: BusTicketBookingSystem
CREATE DATABASE IF NOT EXISTS BusTicketBookingSystem;
USE BusTicketBookingSystem;

-- TABLE 1: USERS
CREATE TABLE IF NOT EXISTS Users (
    User_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserting sample data
INSERT INTO Users (Name, Email, Phone) VALUES
    ('Amit Sharma', 'amit@example.com', '9876543210'),
    ('Sneha Patil', 'sneha@example.com', '9876501234');

-- DQL Queries
-- Selecting users with alias for better readability
SELECT User_id AS 'ID', Name AS 'User Name', Email FROM Users;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 2: BUS
CREATE TABLE IF NOT EXISTS Bus (
    Bus_id INT PRIMARY KEY AUTO_INCREMENT,
    Bus_name VARCHAR(100) NOT NULL,
    Bus_type ENUM('AC', 'Non-AC', 'Sleeper') NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0)
);

-- Inserting sample data
INSERT INTO Bus (Bus_name, Bus_type, Capacity) VALUES
    ('Red Express', 'AC', 50),
    ('Blue Line', 'Non-AC', 40);

-- DQL Queries
-- Fetching buses with alias and filtering by capacity
SELECT Bus_name AS 'Bus Service', Bus_type, Capacity 
FROM Bus 
WHERE Capacity > 40;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 3: ROUTE
CREATE TABLE IF NOT EXISTS Route (
    Route_id INT PRIMARY KEY AUTO_INCREMENT,
    Source VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    Distance INT NOT NULL CHECK (Distance > 0)
);

-- Inserting sample data
INSERT INTO Route (Source, Destination, Distance) VALUES
    ('Mumbai', 'Pune', 150),
    ('Delhi', 'Jaipur', 270);

-- DQL Queries
-- Using alias and WHERE clause to filter routes
SELECT Source, Destination, Distance FROM Route WHERE Distance BETWEEN 100 AND 200;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 4: BOOKING
CREATE TABLE IF NOT EXISTS Booking (
    Booking_id INT PRIMARY KEY AUTO_INCREMENT,
    User_id INT,
    Bus_id INT,
    Route_id INT,
    Booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_id) REFERENCES Users(User_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Bus_id) REFERENCES Bus(Bus_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Route_id) REFERENCES Route(Route_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting sample data
INSERT INTO Booking (User_id, Bus_id, Route_id) VALUES
    (1, 1, 1),
    (2, 2, 2);

-- DQL Queries with Joins
-- Fetching booking details using INNER JOIN
SELECT B.Booking_id, U.Name AS 'Passenger', Bs.Bus_name, R.Source, R.Destination 
FROM Booking B 
JOIN Users U ON B.User_id = U.User_id
JOIN Bus Bs ON B.Bus_id = Bs.Bus_id
JOIN Route R ON B.Route_id = R.Route_id;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 5: PAYMENT
CREATE TABLE IF NOT EXISTS Payment (
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Booking_id INT,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    Payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Booking_id) REFERENCES Booking(Booking_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting sample data
INSERT INTO Payment (Booking_id, Amount, Payment_status) VALUES
    (1, 500.00, 'Completed'),
    (2, 450.00, 'Pending');

-- DQL Queries
-- Fetching payments where status is 'Completed'
SELECT Booking_id, Amount, Payment_status FROM Payment WHERE Payment_status = 'Completed';

-- -------------------------------------------------------------------------------------------------------------------------------------
-- ADVANCED QUERIES
-- Using Aggregate Functions
SELECT Bus_type, COUNT(*) AS 'Total Buses' FROM Bus GROUP BY Bus_type;

-- Subquery: Fetch users who have booked a ticket
SELECT Name FROM Users WHERE User_id IN (SELECT User_id FROM Booking);

-- Using HAVING clause to filter grouped results
SELECT Payment_status, COUNT(*) AS 'Total Payments' 
FROM Payment 
GROUP BY Payment_status 
HAVING COUNT(*) > 0;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- DML Queries (UPDATE and DELETE)
-- Updating payment status
UPDATE Payment SET Payment_status = 'Completed' WHERE Payment_id = 2;

-- Deleting a user (cascade delete should remove related bookings and payments)
DELETE FROM Users WHERE User_id = 2;