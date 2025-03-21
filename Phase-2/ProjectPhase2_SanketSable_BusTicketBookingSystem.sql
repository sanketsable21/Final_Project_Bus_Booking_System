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