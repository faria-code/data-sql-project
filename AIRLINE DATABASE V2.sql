-- create database

CREATE DATABASE AIRLINE;

USE AIRLINE;

-- create table FLIGHTS

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    DepartureAirportID VARCHAR(3),
    ArrivalAirportID VARCHAR(3),
    DepartureDate DATE,
    DepartureTime TIME,
    ArrivalDate DATE,
    ArrivalTime TIME,
    Aircraft VARCHAR(20)
);

-- Inserting data into the FLIGHTS table
INSERT INTO Flights(FlightID, FlightNumber, DepartureAirportID, ArrivalAirportID, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, Aircraft)
VALUES
(101, 'AA123', 'LAX', 'JFK', '2023-11-01', '08:00', '2023-11-01', '16:00', 'Boeing 737'),
(102, 'MX789', 'MEX', 'CDG', '2023-11-02', '10:30', '2023-11-02', '18:30', 'Airbus A320'),
(103, 'IB567', 'MAD', 'JFK', '2023-11-05', '18:30', '2023-11-05', '02:30', 'Boeing 747'),
(104, 'CA123', 'PEK', 'LAX', '2023-11-06', '20:45', '2023-11-07', '04:45', 'Boeing 777'),
(105, 'SU789', 'SVO', 'JFK', '2023-11-07', '22:00', '2023-11-08', '06:00', 'Airbus A330'),
(106, 'SV345', 'RUH', 'LHR', '2023-11-08', '01:30', '2023-11-08', '09:30', 'Boeing 737'),
(107, 'G3901', 'GIG', 'CDG', '2023-11-09', '04:15', '2023-11-09', '12:15', 'Airbus A320'),
(108, 'LH123', 'MUC', 'JFK', '2023-11-11', '08:45', '2023-11-11', '16:45', 'Boeing 747'),
(109, 'AZ789', 'FCO', 'LAX', '2023-11-12', '11:00', '2023-11-12', '19:00', 'Boeing 777'),
(110, 'MS901', 'CAI', 'CDG', '2023-11-13', '13:15', '2023-11-13', '21:15', 'Airbus A330'),
(111, 'AB111', 'LAX', 'SYD', '2023-10-25', '18:00', '2023-10-27', '22:00', 'Boeing 737'),
(112, 'IB112', 'SYD', 'LAX', '2023-10-26', '19:00', '2023-10-26', '23:00', 'Airbus A320'),
(113, 'SV113', 'JFK', 'ICN', '2023-10-27', '20:00', '2023-10-27', '00:00', 'Boeing 747'),
(114, 'AA114', 'ICN', 'JFK', '2023-10-28', '21:00', '2023-10-29', '01:00', 'Boeing 777'),
(115, 'MX115', 'LAX', 'YVR', '2023-10-29', '22:00', '2023-10-29', '02:00', 'Airbus A330');

-- Creating DietaryRequirements table
CREATE TABLE DietaryRequirements (
    DietaryRequirementID VARCHAR(10) PRIMARY KEY,
    DietaryRequirement VARCHAR(50)
);

-- Inserting data into the DietaryRequirements table
INSERT INTO DietaryRequirements (DietaryRequirementID, DietaryRequirement)
VALUES
('V', 'Vegetarian'),
('GF', 'Gluten-Free'),
('VG', 'Vegan'),
('H', 'Halal'),
('DF', 'Dairy-Free'),
('R', 'Raw');

-- Creating AirportInformation table
CREATE TABLE AirportInformation (
    AirportCode VARCHAR(3) PRIMARY KEY,
    AirportName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Longitude DECIMAL(9, 4),
    Latitude DECIMAL(9, 4)
);

-- Inserting data into the AirportInformation table
INSERT INTO AirportInformation (AirportCode, AirportName, City, Country, Longitude, Latitude)
VALUES
('LAX', 'Los Angeles International', 'Los Angeles', 'USA', -118.4085, 33.9425),
('JFK', 'John F. Kennedy', 'New York', 'USA', -73.7781, 40.6413),
('MEX', 'Benito Juárez', 'Mexico City', 'Mexico', -99.0721, 19.4361),
('CDG', 'Charles de Gaulle', 'Paris', 'France', 2.5486, 49.0128),
('MAD', 'Adolfo Suárez Madrid–Barajas', 'Madrid', 'Spain', -3.5673, 40.472),
('PEK', 'Beijing Capital', 'Beijing', 'China', 116.5928, 40.0799),
('SVO', 'Sheremetyevo', 'Moscow', 'Russia', 37.4147, 55.9726),
('RUH', 'King Khalid', 'Riyadh', 'Saudi Arabia', 46.7022, 24.9576),
('LHR', 'London Heathrow', 'London', 'UK', -0.4543, 51.4695),
('GIG', 'Rio de Janeiro/Galeão–Antonio Carlos Jobim', 'Rio de Janeiro', 'Brazil', -43.2494, -22.8124),
('MUC', 'Munich', 'Munich', 'Germany', 11.7861, 48.3537),
('FCO', 'Leonardo da Vinci–Fiumicino', 'Rome', 'Italy', 12.2508, 41.7948),
('CAI', 'Cairo International', 'Cairo', 'Egypt', 31.4056, 30.1219),
('SYD', 'Sydney Kingsford Smith', 'Sydney', 'Australia', 151.1772, -33.9462),
('YVR', 'Vancouver International', 'Vancouver', 'Canada', -123.1848, 49.1967),
('ICN', 'Incheon International', 'Seoul', 'South Korea', 126.4505, 37.4695);



-- Create Passenger table with the foreign key constraint
CREATE TABLE PassengerInformation (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    DietaryRequirementID VARCHAR(2),
    FrequentFlyer VARCHAR(10),
    SpecialNeeds VARCHAR(50),
    PassportNumber VARCHAR(20),
    HomeAddress VARCHAR(255),
    Email VARCHAR(100),
    CountryCode VARCHAR(5),
    PhoneNumber VARCHAR(15),
    CONSTRAINT FK_DietaryRequirement
        FOREIGN KEY (DietaryRequirementID) REFERENCES DietaryRequirements(DietaryRequirementID)
);

-- Inserting data into the Passenger table
INSERT INTO PassengerInformation (PassengerID, FirstName, LastName, DateOfBirth, Gender, DietaryRequirementID, FrequentFlyer, SpecialNeeds, PassportNumber, HomeAddress, Email, CountryCode, PhoneNumber)
VALUES
    (1, 'John', 'Smith', '1985-03-15', 'Male', 'V', 'Gold', NULL, 'AB123456', '123 Main St, Anytown, USA', 'john.smith@email.com', '+1', '555-123-4567'),
    (2, 'Maria', 'Rodriguez', '1990-08-22', 'Female', 'GF', 'Silver', 'Wheelchair', 'BC789012', '456 Park Ave, Mexico City', 'maria.rodriguez@email.com', '+52', '555-987-6543'),
    (3, 'Hiroshi', 'Tanaka', '1982-12-10', 'Male', 'VG', 'Silver', NULL, 'DE345678', '789 Sakura St, Tokyo', 'hiroshi.tanaka@email.co.jp', '+81', '555-234-5678'),
    (4, 'Aisha', 'Khan', '1988-05-03', 'Female', 'H', 'Silver', 'Hearing Aid', 'FG901234', '101 Oasis Rd, Dubai', 'aisha.khan@email.ae', '+971', '555-876-5432'),
    (5, 'Carlos', 'Lopez', '1979-11-18', 'Male', NULL, 'Gold', NULL, 'HI567890', '202 Calle de la Luna, Madrid', 'carlos.lopez@email.es', '+34', '555-345-6789'),
    (6, 'Mei', 'Chen', '1995-04-25', 'Female', 'V', NULL, NULL, 'JK123456', '303 Garden Rd, Beijing', 'mei.chen@email.cn', '+86', '555-789-0123'),
    (7, 'Andrei', 'Ivanov', '1980-09-08', 'Male', 'DF', NULL, NULL, 'LM789012', '404 Kremlin St, Moscow', 'andrei.ivanov@email.ru', '+7', '555-210-9876'),
    (8, 'Fatima', 'Al-Farsi', '1987-06-12', 'Female', 'H', 'Silver', NULL, 'NO345678', '505 Oasis Blvd, Riyadh', 'fatima.alfarsi@email.sa', '+966', '555-876-5432'),
    (9, 'Eduardo', 'Silva', '1993-02-28', 'Male', 'GF', 'Platinum', NULL, 'PQ901234', '606 Copacabana Ave, Rio', 'eduardo.silva@email.com.br', '+55', '555-234-5678'),
    (10, 'Priya', 'Patel', '1989-07-17', 'Female', 'V', NULL, NULL, 'RS567890', '707 Taj Mahal St, Mumbai', 'priya.patel@email.in', '+91', '555-789-0123'),
    (11, 'Wolfgang', 'Schmidt', '1976-01-04', 'Male', NULL, NULL, NULL, 'TU123456', '808 Oktoberfest Str, Munich', 'wolfgang.schmidt@email.de', '+49', '555-210-9876'),
    (12, 'Isabella', 'Rossi', '1998-10-11', 'Female', 'R', 'Gold', NULL, 'VW789012', '909 Colosseum Ave, Rome', 'isabella.rossi@email.it', '+39', '555-876-5432'),
    (13, 'Ahmed', 'Hassan', '1984-03-29', 'Male', NULL, 'Platinum', NULL, 'XY901234', '101 Pyramid St, Cairo', 'ahmed.hassan@email.eg', '+20', '555-234-5678'),
    (14, 'Yuki', 'Yamamoto', '1991-08-14', 'Female', NULL, 'Gold', NULL, 'ZA567890', '202 Cherry Blossom, Kyoto', 'yuki.yamamoto@email.co.jp', '+81', '555-789-0123'),
    (15, 'Juan', 'Garcia', '1986-05-06', 'Male', NULL, 'Gold', NULL, 'BC123456', '303 Coyoacan St, Mexico City', 'juan.garcia@email.com.mx', '+52', '555-210-9876'),
    (16, 'Leila', 'Abbas', '1996-02-02', 'Female', 'V', 'Silver', NULL, 'DE789012', '404 Cedar St, Beirut', 'leila.abbas@email.lb', '+961', '555-876-5432'),
    (17, 'Kenta', 'Suzuki', '1983-11-19', 'Male', NULL, NULL, NULL, 'FG123456', '505 Tokyo Tower, Tokyo', 'kenta.suzuki@email.co.jp', '+81', '555-234-5678'),
    (18, 'Sofia', 'Rodriguez', '1980-06-23', 'Female', 'GF', NULL, NULL, 'HI567890', '606 Tango St, Buenos Aires', 'sofia.rodriguez@email.com.ar', '+54', '555-789-0123'),
    (19, 'Mohammad', 'Al-Mansoori', '1989-09-09', 'Male', 'H', NULL, NULL, 'JK901234', '707 Sand Dunes, Abu Dhabi', 'mohammad.almansoori@email.ae', '+971', '555-210-9876'),
    (20, 'Prianka', 'Das', '1994-04-16', 'Female', 'V', 'Gold', NULL, 'LM123456', '808 Bollywood Blvd, Mumbai', 'prianka.das@email.in', '+54', '555-210-9826');



-- Creating the Reservation table with foreign key constraints
CREATE TABLE ReservationInformation (
    ReservationID VARCHAR(10) PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    TicketClass VARCHAR(20),
    SeatNumber VARCHAR(5),
    Fare DECIMAL(10, 2),
    CONSTRAINT FK_PassengerID FOREIGN KEY (PassengerID) REFERENCES PassengerInformation(PassengerID),
    CONSTRAINT FK_FlightID FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
);

-- Inserting data into the Reservation table
INSERT INTO ReservationInformation (ReservationID, PassengerID, FlightID, TicketClass, SeatNumber, Fare)
VALUES
    ('RES222256', 1, 101, 'Business', '1A', 1200.00),
    ('RES789442', 2, 102, 'Economy', '25F', 500.00),
    ('RES345998', 3, 102, 'First', '00A', 2000.00),
    ('RES171234', 4, 101, 'Business', '2C', 1500.00),
    ('RES511190', 5, 103, 'Economy', '11C', 700.00),
    ('RES333456', 6, 104, 'First', '00B', 1800.00),
    ('RES789312', 7, 105, 'Economy', '17H', 600.00),
    ('RES555678', 8, 106, 'Business', '2D', 1400.00),
    ('RES901266', 9, 107, 'Economy', '19C', 550.00),
    ('RES533890', 10, 107, 'First', '00C', 1900.00),
    ('RES143459', 11, 108, 'Economy', '18A', 650.00),
    ('RES766662', 12, 109, 'Business', '3D', 1300.00),
    ('RES335678', 13, 110, 'First', '00D', 2100.00),
    ('RES567220', 14, 114, 'Economy', '22E', 600.00),
    ('RES125556', 15, 115, 'Business', '4B', 1400.00),
    ('RES789012', 16, 107, 'Business', '4C', 2000.00),
    ('RES222678', 17, 105, 'Economy', '15D', 550.00),
    ('RES567890', 18, 105, 'Business', '5A', 1200.00),
    ('RES901534', 19, 105, 'Economy', '18B', 2200.00),
    ('RES124450', 20, 107, 'Economy', '19D', 500.00);

select * from PassengerInformation;
select * from AirportInformation;
select * from DietaryRequirements;
select * from Flights;
select * from ReservationInformation; 

-- Inner join
SELECT *
FROM Flights
INNER JOIN ReservationInformation ON Flights.FlightID = ReservationInformation.FlightID;

-- Left join
SELECT 
    ReservationInformation.*,
    Flights.DepartureAirportID,
    Flights.ArrivalAirportID
FROM ReservationInformation
LEFT JOIN Flights ON ReservationInformation.FlightID = Flights.FlightID;

-- stored function that can be applied to your query in your database


-- Create a stored function to calculate the sum of fares for a given FlightID
DELIMITER //

CREATE FUNCTION CalculateTotalFareForFlight(flightIDParam INT)
RETURNS FLOAT(2)
READS SQL DATA
BEGIN
    DECLARE totalFare FLOAT(2);

    -- Calculate the sum of fares for the given FlightID
    SELECT SUM(Fare) INTO totalFare
    FROM ReservationInformation
    WHERE FlightID = flightIDParam;

    -- Return the total fare
    RETURN totalFare;
END //

DELIMITER ;

-- Example: Calculate total fare for FlightID 107
SELECT CalculateTotalFareForFlight(107) AS TotalFareForFlight107;


/* ATTEMPTED TO FORMAT DATE USING A STORED FUNCTION BUT IT DID NOT WORK
-- Create a stored function to format date
DELIMITER //

CREATE FUNCTION FormatDate(inputDateParam DATE)
RETURNS DATE
READS SQL DATA
BEGIN
    DECLARE NewDateFormat DATE;

    -- reformat date using DATE_FORMAT function
    SET NewDateFormat = DATE_FORMAT(inputDateParam, '%d-%m-%Y');
    RETURN NewDateFormat;
END //

DELIMITER ;

-- Use the function to update the DepartureDate in the Flights table 
UPDATE Flights
SET DepartureDate = FormatDate(DepartureDate)
WHERE DepartureDate IS NOT NULL;

SELECT * FROM Flights;
*/

-- Formatting the date in SQL to DD-MM-YYYY
SELECT 
    FlightID, 
    FlightNumber, 
    DepartureAirportID, 
    ArrivalAirportID, 
    DATE_FORMAT(DepartureDate, '%d-%m-%Y') as FormattedDepartureDate,
    DepartureTime, 
    DATE_FORMAT(ArrivalDate, '%d-%m-%Y') as FormattedArrivalDate,
    ArrivalTime, 
    Aircraft 
FROM Flights;

-- Query to find average fare of each flight using query and subquery
    
    SELECT
    F.FlightID,
    F.FlightNumber,
    (
        SELECT AVG(R.Fare)
        FROM ReservationInformation AS R
        WHERE R.FlightID = F.FlightID
    ) AS AverageFare
FROM
    Flights AS F;


-- Identify flights with more than 3 passengers using GROUP BY and HAVING (Advanced requirement)
SELECT 
    F.FlightID,
    F.FlightNumber,
    COUNT(R.PassengerID) AS TotalPassengers
FROM 
    Flights F
LEFT JOIN 
    ReservationInformation R ON F.FlightID = R.FlightID
GROUP BY 
    F.FlightID, F.FlightNumber
HAVING 
    COUNT(R.PassengerID) > 3;

    -- Attempting a view to combine data from flights, PassengerInformation and ReservationInformation to provide a comprehensive view
    
    -- Create a view that combines information from Flights, PassengerInformation, and ReservationInformation
CREATE VIEW FlightReservationView AS
SELECT 
    R.ReservationID,
    R.TicketClass,
    R.SeatNumber,
    R.Fare,
    F.FlightID,
    F.FlightNumber,
    F.DepartureAirportID,
    F.ArrivalAirportID,
    F.DepartureDate,
    F.DepartureTime,
    F.ArrivalDate,
    F.ArrivalTime,
    F.Aircraft,
    P.PassengerID,
    P.FirstName,
    P.LastName,
    P.DateOfBirth,
    P.Gender,
    P.DietaryRequirementID,
    P.FrequentFlyer,
    P.SpecialNeeds,
    P.PassportNumber,
    P.HomeAddress,
    P.Email,
    P.CountryCode,
    P.PhoneNumber
FROM 
    ReservationInformation as R
JOIN 
    Flights as F ON R.FlightID = F.FlightID
JOIN 
    PassengerInformation as P ON R.PassengerID = P.PassengerID;

    SELECT * FROM FlightReservationView;
    
    -- Create view for DD-MM-YYY dates
    CREATE VIEW ReformattedDates AS
    SELECT 
    FlightID, 
    FlightNumber, 
    DepartureAirportID, 
    ArrivalAirportID, 
    DATE_FORMAT(DepartureDate, '%d-%m-%Y') as FormattedDepartureDate,
    DepartureTime, 
    DATE_FORMAT(ArrivalDate, '%d-%m-%Y') as FormattedArrivalDate,
    ArrivalTime, 
    Aircraft 
FROM Flights;
   
   SELECT * FROM ReformattedDates;
   

-- Create a stored procedure to retrieve passenger information by PassengerID
DELIMITER //

CREATE PROCEDURE GetPassengerDetails(IN PassengerIDParam INT)
BEGIN
    SELECT
        PassengerID,
        FirstName,
        LastName,
        DateOfBirth,
        Gender,
        DietaryRequirementID,
        FrequentFlyer,
        SpecialNeeds,
        PassportNumber,
        HomeAddress,
        Email,
        CountryCode,
        PhoneNumber
    FROM
        PassengerInformation
    WHERE
        PassengerID = PassengerIDParam;
END //

DELIMITER ;

-- Example: Retrieve details for PassengerID 3
CALL GetPassengerDetails(3);




