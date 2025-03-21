-- DATABASE: BusTicketBookingSystem
CREATE DATABASE IF NOT EXISTS Bus_Ticket_Booking_System;
USE Bus_Ticket_Booking_System;

-- TABLE 1: USERS
create table user(
	User_id int not null primary key,
	First_name varchar(40),
	Last_name varchar(40),
	User_email varchar(40),
	Mobile varchar(20),
	Gender varchar(10),
	City varchar(30),
	State varchar(40),
	Registration_date varchar(30)
);

select * from user;

insert into user
values
(1,'Sanket','Sable','sanketsable123@gmail.com','8291621013','Male','Dombivali','Maharashtra','12 March 2024'),
(2,'Yash','Garud','yashgarud123@gmail.com','9546215801','Male','Kalyan','Maharashtra','23 December 2024'),
(3,'Anjali','Patil','anjalipatil123@gmail.com','8564158612','Female','Airoli','Maharashtra','03 April 2024'),
(4,'Mukashshaf','Momin','mukashshafmomin123@gmail.com','7568412862','Female','Mumbra','Maharashtra','31 October 2024'),
(5,'Raj','Mali','rajmali123@gmail.com','8546215378','Male','Dombivali','Maharashtra','04 May 2024'),
(6,'Yash','Pawar','yashpawar123@gmail.com','9546218756','Male','Vangani','Maharashtra','28 July 2024'),
(7,'Nupur','Lotekar','nupurlotekar123@gmail.com','7715821977','Male','Dombivali','Maharashtra','21 November 2024'),
(8,'Karan','Khegde','karankhegde123@gmail.com','9004178250','Male','Dombivali','Maharashtra','06 March 2023'),
(9,'Rohit','Thorat','rohitthorat123@gmail.com','8564791235','Male','Dombivali','Maharashtra','21 December 2023'),
(10,'Tanay','Kadam','tanaykadam123@gmail.com','7854628419','Male','Dombivali','Maharashtra','02 March 2023');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 2: BUSES
create table buses(
	Bus_id int not null primary key,
	Bus_number int not null,
	Bus_type varchar(30),
	Capacity varchar(20),
	Status varchar(30)
);

select * from buses;

insert into buses
values
(1,22024,'Sleeper','50 Seats','Active'),
(2,22045,'AC','48 Seats','Maintainance'),
(3,22057,'Non-AC','45 Seats','Inactive'),
(4,22095,'Sleeper','50 Seats','Inactive'),
(5,22085,'Semi-Sleeper','52 Seats','Active'),
(6,22048,'Non-AC','45 Seats','Active'),
(7,22042,'AC','48 Seats','Maintainance'),
(8,22058,'Sleeper','50 Seats','Inactive'),
(9,22038,'Sleeper','50 Seats','Active'),
(10,22067,'Non-AC','45 Seats','Active');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 3: OPERATORS
create table operators(
	Operator_id int not null primary key,
	Operator_name varchar(40),
	Work varchar(30),
	Mobile varchar(20),
	email varchar(40),
	License_number varchar(40)
);

select * from operators;

insert into operators
values
(1,'Santosh Kadam','Bus Driver','7568412563','santoshkadam123@gmail.com','ABC123XY'),
(2,'Ravindra Patil','Bus Conductor','8465123795','ravindrapatil123@gmail.com','--'),
(3,'Rajat Gokhale','Bus Driver','8564125798','rajatgokhale123@gmail.com','DJY843YF'),
(4,'Sumit Pagare','Bus Conductor','8452617539','sumitpagare123@gmail.com','--'),
(5,'Shreyash Shinde','Bus Driver','8945651232','shreyashshinde123@gmail.com','DJA123IJ'),
(6,'Sabrinath Nair','Bus Conductor','8945658721','sabrinathnair123@gmail.com','--'),
(7,'Ashish Rawalkar','Bus Conductor','8456218768','ashishrawalkar123@gmail.com','--'),
(8,'Sarthak Sapkal','Bus Driver','9564821576','sarthaksapkal123@gmail.com','DIO358IJ'),
(9,'Aniket Potale','Bus Driver','8657215698','aniketpotale123@gmail.com','HDI389DI'),
(10,'Prathamesh Kadam','Bus Conductor','8645218675','prathameshkadam123@gmail.com','--');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 4: ROUTES
create table routes(
	Route_id int not null primary key,
	Source_city varchar(30),
	Destination_city varchar(30),
	Total_distance_KM varchar(30),
	Estimated_duration varchar(30)
);

select * from routes;

insert into routes
values
(1,'Mumbai','Pune','150 KM','03 HOURS'),
(2,'Bangalore','Hyderabad','600 KM','09 HOURS'),
(3,'Dombivali','Thane','20 KM','30 MIN'),
(4,'Dombivali','Chatrapati Sambhajinagar','450 KM','08 HOURS'),
(5,'Dombivali','CSMT','70 KM','1.5 HOURS'),
(6,'Chatrapati Samnhajinagar','Jalana','40 KM','1.2 HOURS'),
(7,'Delhi','Jaipur','270 KM','05 HOURS'),
(8,'Kasara','Dombivali','100 KM','2.2 HOURS'),
(9,'Mumbai','Kolhapur','500 KM','08 HOURS'),
(10,'CSMT','Satara','650 KM','09 HOURS');

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE 5: BUS_ROUTES
create table bus_routes(
Bus_route_id int not null primary key,
Bus_id int not null,
Route_id int not null,
Departure_time varchar(20),
Arrival_time varchar(20),
Fare varchar(40)
);

select * from bus_routes;

insert into bus_routes
values
(1,1,1,'01.16 P.M.','04.16 P.M.','350 Per Person'),
(2,2,2,'12.07 P.M.','09.07 P.M.','1102.450 Per Person'),
(3,3,3,'10.40 A.M.','11.10 A.M.','30 Per Person'),
(4,4,4,'06.27 A.M.','02.27 P.M.','750 Per Person'),
(5,5,5,'11.11 A.M.','12.41 P.M.','60.43 Per Person'),
(6,6,6,'02.27 P.M.','03.47 P.M.','100.60 Per Person'),
(7,7,7,'09.12 A.M.','01.12 P.M.','415.20 Per Person'),
(8,8,8,'10.56 A.M.','01.16 P.M.','115.60 Per Person'),
(9,9,9,'12.00 P.M.','08.00 P.M.','750 Per Person'),
(10,10,10,'09.00 A.M,','06.00 P.M.','790.98 Per Person');