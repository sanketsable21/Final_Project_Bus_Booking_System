-- DATABASE: BusTicketBookingSystem
CREATE DATABASE IF NOT EXISTS Bus_Ticket_Booking_System;
USE Bus_Ticket_Booking_System;

-- DROP DATABASE
DROP DATABASE Bus_Ticket_Booking_System;

-- TABLE 1: USERS
CREATE TABLE user (
    User_id INT NOT NULL PRIMARY KEY,
    First_name VARCHAR(40),
    Last_name VARCHAR(40),
    User_email VARCHAR(40),
    Mobile VARCHAR(20),
    Gender VARCHAR(10),
    City VARCHAR(30),
    State VARCHAR(40),
    Registration_date DATE
);

SELECT * FROM user;

INSERT INTO user
VALUES
(1,'Sanket','Sable','sanketsable123@gmail.com','8291621013','Male','Dombivli','Maharashtra','2024-03-12'),
(2,'Yash','Garud','yashgarud123@gmail.com','9546215801','Male','Kalyan','Maharashtra','2024-12-23'),
(3,'Anjali','Patil','anjalipatil123@gmail.com','8564158612','Female','Airoli','Maharashtra','2024-04-03'),
(4,'Mukashshaf','Momin','mukashshafmomin123@gmail.com','7568412862','Female','Mumbra','Maharashtra','2024-10-31'),
(5,'Raj','Mali','rajmali123@gmail.com','8546215378','Male','Dombivli','Maharashtra','2024-05-04'),
(6,'Yash','Pawar','yashpawar123@gmail.com','9546218756','Male','Vangani','Maharashtra','2024-07-28'),
(7,'Nupur','Lotekar','nupurlotekar123@gmail.com','7715821977','Male','Dombivli','Maharashtra','2024-11-21'),
(8,'Karan','Khegde','karankhegde123@gmail.com','9004178250','Male','Dombivli','Maharashtra','2023-03-06'),
(9,'Rohit','Thorat','rohitthorat123@gmail.com','8564791235','Male','Dombivli','Maharashtra','2023-12-21'),
(10,'Tanay','Kadam','tanaykadam123@gmail.com','7854628419','Male','Dombivli','Maharashtra','2023-03-02');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 2: BUSES
CREATE TABLE bus (
    Bus_id INT NOT NULL PRIMARY KEY,
    Bus_number INT NOT NULL,
    Bus_type VARCHAR(30),
    Capacity VARCHAR(20),
    Status VARCHAR(30)
);

SELECT * FROM bus;

INSERT INTO bus
VALUES
(1,22024,'Sleeper','50 Seats','Active'),
(2,22045,'AC','48 Seats','Maintenance'),
(3,22057,'Non-AC','45 Seats','Inactive'),
(4,22095,'Sleeper','50 Seats','Inactive'),
(5,22078,'AC Sleeper','55 Seats','Active'),
(6,22101,'Semi-Sleeper','52 Seats','Active'),
(7,22120,'Luxury','60 Seats','Active'),
(8,22140,'Electric','40 Seats','Active'),
(9,22155,'Mini-Bus','30 Seats','Inactive'),
(10,22175,'Double-Decker','70 Seats','Active');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 3: TICKET
CREATE TABLE ticket (
    Ticket_id INT NOT NULL PRIMARY KEY,
    User_id INT,
    Bus_id INT,
    Route_id INT,
    Booking_date DATE,
    Seat_no INT,
    FOREIGN KEY (User_id) REFERENCES user(User_id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Bus_id) REFERENCES bus(Bus_id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Route_id) REFERENCES route(Route_id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

select * from ticket;

INSERT INTO ticket VALUES 
(1, 1, 1, 1, '2024-03-15', 12),
(2, 2, 2, 2, '2024-04-10', 20),
(3, 3, 3, 3, '2024-05-05', 8),
(4, 4, 4, 4, '2024-06-12', 25),
(5, 5, 5, 5, '2024-07-20', 30),
(6, 6, 6, 6, '2024-08-22', 5),
(7, 7, 7, 7, '2024-09-30', 40),
(8, 8, 8, 8, '2024-10-25', 15),
(9, 9, 9, 9, '2024-11-18', 33),
(10, 10, 10, 10, '2024-12-05', 50);

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 4: ROUTES
CREATE TABLE route (
    Route_id INT NOT NULL PRIMARY KEY,
    Bus_id INT,
    Start_point VARCHAR(50),
    End_point VARCHAR(50),
    Distance_km INT,
    FOREIGN KEY (Bus_id) REFERENCES bus(Bus_id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

select * from route;

INSERT INTO route VALUES 
(1, 1, 'Mumbai', 'Pune', 150),
(2, 2, 'Pune', 'Nashik', 200),
(3, 3, 'Mumbai', 'Goa', 500),
(4, 4, 'Delhi', 'Agra', 300),
(5, 5, 'Chennai', 'Bangalore', 350),
(6, 6, 'Hyderabad', 'Mumbai', 800),
(7, 7, 'Kolkata', 'Delhi', 1500),
(8, 8, 'Jaipur', 'Udaipur', 400),
(9, 9, 'Ahmedabad', 'Surat', 250),
(10, 10, 'Lucknow', 'Patna', 450);

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 5: PAYMENT
CREATE TABLE payment (
    Payment_id INT NOT NULL PRIMARY KEY,
    Ticket_id INT,
    Amount DECIMAL(10,2),
    Payment_date DATE,
    Payment_method VARCHAR(20),
    FOREIGN KEY (Ticket_id) REFERENCES ticket(Ticket_id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);


select * from payment;

INSERT INTO payment VALUES 
(1, 1, 500.00, '2024-03-15', 'Credit Card'),
(2, 2, 750.00, '2024-04-10', 'UPI'),
(3, 3, 1200.00, '2024-05-05', 'Debit Card'),
(4, 4, 950.00, '2024-06-12', 'Cash'),
(5, 5, 1100.00, '2024-07-20', 'UPI'),
(6, 6, 1300.00, '2024-08-22', 'Credit Card'),
(7, 7, 1700.00, '2024-09-30', 'Net Banking'),
(8, 8, 600.00, '2024-10-25', 'Cash'),
(9, 9, 850.00, '2024-11-18', 'Debit Card'),
(10, 10, 2000.00, '2024-12-05', 'UPI');


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Queries------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Adding a new column to the user table
ALTER TABLE user ADD COLUMN Age INT;

-- Deleting the bus table
DROP TABLE bus;

-- Updating a bus status
UPDATE bus SET Status = 'Under Maintenance' WHERE Bus_id = 3;

-- Deleting a specific ticket
DELETE FROM ticket WHERE Ticket_id = 5;

-- Data Query Language (DQL) Queries
-- Fetching all users from Mumbai
SELECT * FROM user WHERE City = 'Mumbai';

-- Fetching user details with ticket information using JOIN
SELECT u.First_name, u.Last_name, t.Ticket_id, b.Bus_number, r.Start_point, r.End_point
FROM user u
JOIN ticket t ON u.User_id = t.User_id
JOIN bus b ON t.Bus_id = b.Bus_id
JOIN route r ON t.Route_id = r.Route_id;

-- Using Aggregation Function
-- Count total number of tickets booked
SELECT COUNT(*) AS Total_Tickets FROM ticket;

-- Using Alias
SELECT First_name AS FName, Last_name AS LName FROM user;

-- Using Operators & Clauses
-- Fetching buses with capacity greater than 50 seats
SELECT * FROM bus WHERE CAST(SUBSTRING_INDEX(Capacity, ' ', 1) AS UNSIGNED) > 50;

-- Fetching payments made via UPI or Credit Card
SELECT * FROM payment WHERE Payment_method IN ('UPI', 'Credit Card');

-- Using BETWEEN Clause
SELECT * FROM payment WHERE Amount BETWEEN 500 AND 1500;

-- Using Subqueries
-- Fetch users who have booked at least one ticket
SELECT * FROM user WHERE User_id IN (SELECT DISTINCT User_id FROM ticket);

-- Fetching buses that are part of any route
SELECT * FROM bus WHERE Bus_id IN (SELECT DISTINCT Bus_id FROM route);

-- Using Joins Across 5 Tables
-- Fetching all ticket details with user, bus, route, and payment information
SELECT u.First_name, u.Last_name, b.Bus_number, r.Start_point, r.End_point, t.Seat_no, p.Amount, p.Payment_method
FROM ticket t
JOIN user u ON t.User_id = u.User_id
JOIN bus b ON t.Bus_id = b.Bus_id
JOIN route r ON t.Route_id = r.Route_id
JOIN payment p ON t.Ticket_id = p.Ticket_id;

-- Cascading Updates & Deletes
-- If a user is deleted, their tickets and payments are also deleted due to CASCADE
DELETE FROM user WHERE User_id = 2;


-- DML Queries-------------------------------------------------------------------------------------------------------------------------
-- Update mobile number  
UPDATE user SET Mobile = '9123456789' WHERE User_id = 1;  

-- Update bus departure time  
UPDATE bus SET Departure_time = '07:00:00' WHERE Bus_id = 101;  

-- Update mobile number  
UPDATE user SET Mobile = '9123456789' WHERE User_id = 1;  

-- Update bus departure time  
UPDATE bus SET Departure_time = '07:00:00' WHERE Bus_id = 101;  

-- DQL Queries-------------------------------------------------------------------------------------------------------------------------
-- Retrieve All Users  
SELECT * FROM user;  

-- Get User Details by ID  
SELECT First_name, Last_name, User_email, Mobile FROM user WHERE User_id = 1;  

-- Get All Bookings  
SELECT * FROM booking;  

-- Get Bookings for a Specific User  
SELECT * FROM booking WHERE User_id = 1;  

-- Find Buses Between Two Cities  
SELECT * FROM bus WHERE Source = 'Mumbai' AND Destination = 'Pune';  

-- Get All Payments with Status ‘Completed’  
SELECT * FROM payment WHERE Payment_status = 'Completed';  

-- Count Total Users Registered  
SELECT COUNT(*) AS Total_Users FROM user;  

-- Find Average Rating of a Bus  
SELECT Bus_id, AVG(Rating) AS Avg_Rating FROM feedback WHERE Bus_id = 101 GROUP BY Bus_id;  

-- Get the Latest Booking Details  
SELECT * FROM booking ORDER BY Booking_date DESC LIMIT 1;  

-- Find Users Who Gave a 5-Star Rating  
SELECT u.First_name, u.Last_name, f.Rating  
FROM user u  
JOIN feedback f ON u.User_id = f.User_id  
WHERE f.Rating = 5;  


--  Operators, Clauses, and Functions------------------------------------------------------------------------------------------------
-- Find Users Registered in 2024 (LIKE - Operator)  
SELECT * FROM user WHERE Registration_date LIKE '2024%';  

-- Get Bookings Between March 1-31, 2024 (BETWEEN - Operator)  
SELECT * FROM booking WHERE Booking_date BETWEEN '2024-03-01' AND '2024-03-31';  

-- Find Buses with More Than 30 Seats (> - Comparison Operator)  
SELECT * FROM bus WHERE Total_seats > 30;  

-- Find Users from Specific Cities (IN - Operator)  
SELECT * FROM user WHERE City IN ('Dombivli', 'Kalyan', 'Airoli');  

-- Get Bookings for User ID 1 OR User ID 2 (OR - Logical Operator)  
SELECT * FROM booking WHERE User_id = 1 OR User_id = 2;  

-- Get Payments for Completed Status (AND - Logical Operator)  
SELECT * FROM payment WHERE Amount > 200 AND Payment_status = 'Completed';  

-- Sort Users by Registration Date (ORDER BY - Clause)  
SELECT * FROM user ORDER BY Registration_date DESC;  

-- Count Total Users Registered (COUNT - Aggregate Function)  
SELECT COUNT(*) AS Total_Users FROM user;  

-- Find Users Who Haven’t Booked Yet (LEFT JOIN + NULL Check)  
SELECT u.User_id, u.First_name FROM user u  
LEFT JOIN booking b ON u.User_id = b.User_id  
WHERE b.Booking_id IS NULL;  

-- Get Users Who Spent More Than Average (HAVING + SUM + AVG)  
SELECT User_id, SUM(Amount) AS Total_Spent  
FROM payment GROUP BY User_id  
HAVING SUM(Amount) > (SELECT AVG(Amount) FROM payment);  


-- JOINS & SUBQUERIES------------------------------------------------------------------------------------------------
-- Get Users with Their Bookings (INNER JOIN)  
SELECT u.User_id, u.First_name, b.Booking_id, b.Bus_id  
FROM user u INNER JOIN booking b ON u.User_id = b.User_id;  

-- Get Users Who Haven’t Booked Yet (LEFT JOIN + NULL Check)  
SELECT u.User_id, u.First_name  
FROM user u LEFT JOIN booking b ON u.User_id = b.User_id  
WHERE b.Booking_id IS NULL;  

-- Get All Bus Details Along with Bookings (RIGHT JOIN)  
SELECT b.Bus_id, b.Bus_name, bk.Booking_id  
FROM bus b RIGHT JOIN booking bk ON b.Bus_id = bk.Bus_id;  

-- Get Payments for Users (JOIN Multiple Tables)  
SELECT u.First_name, u.Last_name, p.Payment_id, p.Amount  
FROM user u  
JOIN booking b ON u.User_id = b.User_id  
JOIN payment p ON b.Booking_id = p.Booking_id;  

-- Find Buses That Have Not Been Booked (SUBQUERY with NOT IN)  
SELECT * FROM bus WHERE Bus_id NOT IN (SELECT Bus_id FROM booking);  

-- Find Users Who Made Payments Above Average (HAVING + SUBQUERY)  
SELECT User_id, SUM(Amount) AS Total_Spent  
FROM payment GROUP BY User_id  
HAVING SUM(Amount) > (SELECT AVG(Amount) FROM payment);  

-- Find the Latest Booking for Each User (SUBQUERY with MAX)  
SELECT * FROM booking  
WHERE Booking_date = (SELECT MAX(Booking_date) FROM booking);  

-- Get Users Who Paid More Than ₹1000 (EXISTS - Subquery)  
SELECT u.User_id, u.First_name  
FROM user u WHERE EXISTS  
(SELECT 1 FROM payment p WHERE p.User_id = u.User_id AND p.Amount > 1000);  

-- Find Bus Names with Bookings Using ALIAS (JOIN + Alias)  
SELECT b.Bus_name AS Bus, bk.Booking_id AS Ticket  
FROM bus b JOIN booking bk ON b.Bus_id = bk.Bus_id;  

-- Get Total Revenue per Bus (JOIN + SUM)  
SELECT b.Bus_name, SUM(p.Amount) AS Total_Revenue  
FROM bus b  
JOIN booking bk ON b.Bus_id = bk.Bus_id  
JOIN payment p ON bk.Booking_id = p.Booking_id  
GROUP BY b.Bus_name;  


-- 10 JOIN Queries

-- 1. Retrieve user details along with their booked tickets
SELECT u.*, t.* 
FROM user u
JOIN ticket t ON u.User_id = t.User_id;

-- 2. Retrieve tickets along with the corresponding bus details
SELECT t.*, b.*
FROM ticket t
JOIN bus b ON t.Bus_id = b.Bus_id;

-- 3. Retrieve route details along with bus details
SELECT r.*, b.*
FROM route r
JOIN bus b ON r.Bus_id = b.Bus_id;

-- 4. Retrieve payment details along with user information
SELECT p.*, u.*
FROM payment p
JOIN user u ON p.User_id = u.User_id;

-- 5. Retrieve payment details along with ticket details
SELECT p.*, t.*
FROM payment p
JOIN ticket t ON p.Ticket_id = t.Ticket_id;

-- 6. Retrieve users who booked sleeper buses
SELECT u.*
FROM user u
JOIN ticket t ON u.User_id = t.User_id
JOIN bus b ON t.Bus_id = b.Bus_id
WHERE b.Bus_type = 'Sleeper';

-- 7. Retrieve the total number of tickets booked per user
SELECT u.User_id, u.First_name, COUNT(t.Ticket_id) AS Total_Tickets
FROM user u
LEFT JOIN ticket t ON u.User_id = t.User_id
GROUP BY u.User_id;

-- 8. Retrieve the total payments made by each user
SELECT u.User_id, u.First_name, SUM(p.Amount) AS Total_Payment
FROM user u
LEFT JOIN payment p ON u.User_id = p.User_id
GROUP BY u.User_id;

-- 9. Retrieve the total number of buses for each route
SELECT r.Route_id, COUNT(b.Bus_id) AS Total_Buses
FROM route r
JOIN bus b ON r.Bus_id = b.Bus_id
GROUP BY r.Route_id;

-- 10. Retrieve tickets along with user and payment details
SELECT t.*, u.First_name, u.Last_name, p.Amount
FROM ticket t
JOIN user u ON t.User_id = u.User_id
JOIN payment p ON t.Ticket_id = p.Ticket_id;

-- 10 Subqueries

-- 1. Get users who have booked at least one ticket
SELECT * FROM user WHERE User_id IN (SELECT User_id FROM ticket);

-- 2. Get buses that have at least one ticket booked
SELECT * FROM bus WHERE Bus_id IN (SELECT Bus_id FROM ticket);

-- 3. Get routes that have active buses
SELECT * FROM route WHERE Bus_id IN (SELECT Bus_id FROM bus WHERE Status = 'Active');

-- 4. Get users who have made a payment above average payment amount
SELECT * FROM user WHERE User_id IN (SELECT User_id FROM payment WHERE Amount > (SELECT AVG(Amount) FROM payment));

-- 5. Get tickets that have payments greater than Rs. 500
SELECT * FROM ticket WHERE Ticket_id IN (SELECT Ticket_id FROM payment WHERE Amount > 500);

-- 6. Get users who have booked more than one ticket
SELECT * FROM user WHERE User_id IN (SELECT User_id FROM ticket GROUP BY User_id HAVING COUNT(Ticket_id) > 1);

-- 7. Get the bus with the highest number of tickets booked
SELECT * FROM bus WHERE Bus_id = (SELECT Bus_id FROM ticket GROUP BY Bus_id ORDER BY COUNT(Ticket_id) DESC LIMIT 1);

-- 8. Get the user who has spent the most on tickets
SELECT * FROM user WHERE User_id = (SELECT User_id FROM payment GROUP BY User_id ORDER BY SUM(Amount) DESC LIMIT 1);

-- 9. Get all users who booked a specific bus type (e.g., Sleeper)
SELECT * FROM user WHERE User_id IN (SELECT User_id FROM ticket WHERE Bus_id IN (SELECT Bus_id FROM bus WHERE Bus_type = 'Sleeper'));

-- 10. Get all tickets booked for a specific route
SELECT * FROM ticket WHERE Bus_id IN (SELECT Bus_id FROM route WHERE Route_id = 1);

-- 10 User-Defined & Built-in Function Queries

-- 1. Get the total number of users
SELECT COUNT(*) FROM user;

-- 2. Get the average ticket price
SELECT AVG(Amount) FROM payment;

-- 3. Get the maximum ticket price
SELECT MAX(Amount) FROM payment;

-- 4. Get the minimum ticket price
SELECT MIN(Amount) FROM payment;

-- 5. Get the number of tickets per bus
SELECT Bus_id, COUNT(Ticket_id) FROM ticket GROUP BY Bus_id;

-- 6. Get the first registered user
SELECT * FROM user ORDER BY Registration_date ASC LIMIT 1;

-- 7. Convert all user names to uppercase
SELECT UPPER(First_name), UPPER(Last_name) FROM user;

-- 8. Get the length of user email addresses
SELECT User_email, LENGTH(User_email) FROM user;

-- 9. Get the current date and time
SELECT NOW();

-- 10. user-defined function queries
DELIMITER //
CREATE FUNCTION GetTotalSpent(userId INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(Amount) INTO total FROM payment WHERE User_id = userId;
  RETURN total;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION GetUserTicketCount(userId INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT COUNT(Ticket_id) INTO total FROM ticket WHERE User_id = userId;
  RETURN total;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION GetBusType(ticketId INT) RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
  DECLARE busType VARCHAR(30);
  SELECT b.Bus_type INTO busType FROM bus b JOIN ticket t ON b.Bus_id = t.Bus_id WHERE t.Ticket_id = ticketId;
  RETURN busType;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION GetBusRevenue(busId INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE totalRevenue DECIMAL(10,2);
  SELECT SUM(p.Amount) INTO totalRevenue FROM payment p JOIN ticket t ON p.Ticket_id = t.Ticket_id WHERE t.Bus_id = busId;
  RETURN totalRevenue;
END //
DELIMITER ;