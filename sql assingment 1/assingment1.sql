-- 1st database

CREATE DATABASE ELearningDB;
USE ELearningDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Role ENUM('Student', 'Instructor')
);

INSERT INTO Users (FirstName, LastName, Email, Phone, Role) VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', 'Student'),
('Priya', 'Iyer', 'priya.iyer@example.com', '8765432109', 'Student'),
('Amit', 'Patel', 'amit.patel@example.com', '7654321098', 'Instructor');

SELECT * FROM Users;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    InstructorID INT,
    Category VARCHAR(50),
    Duration INT,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

INSERT INTO Courses (CourseName, InstructorID, Category, Duration) VALUES
('Python for Beginners', 3, 'Programming', 30),
('Data Science Basics', 3, 'Data Science', 45),
('Digital Marketing', 3, 'Marketing', 25);

SELECT * FROM Courses;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (UserID, CourseID, EnrollmentDate, Progress) VALUES
(1, 1, '2025-03-01', 50),
(2, 2, '2025-02-20', 75),
(1, 3, '2025-01-10', 30);

SELECT * FROM Enrollments;

CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    Title VARCHAR(100),
    VideoURL VARCHAR(255),
    Duration INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Lessons (CourseID, Title, VideoURL, Duration) VALUES
(1, 'Introduction to Python', 'https://example.com/python_intro', 10),
(2, 'Data Cleaning Techniques', 'https://example.com/data_cleaning', 15),
(3, 'SEO Fundamentals', 'https://example.com/seo_basics', 12);

SELECT * FROM Lessons;

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CourseID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Reviews (UserID, CourseID, Rating, Comment) VALUES
(1, 1, 5, 'Great course!'),
(2, 2, 4, 'Very informative and well-structured.'),
(1, 3, 3, 'Good content but could be more detailed.');

SELECT * FROM Reviews;

DROP TABLE Enrollments;
DROP TABLE Lessons;
DROP TABLE Reviews;
DROP TABLE Users;
DROP TABLE Courses;


-- 2nd database


CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DOB DATE
);

INSERT INTO Students (FirstName, LastName, Email, Phone, DOB) VALUES
('Rohan', 'Verma', 'rohan.verma@example.com', '9876543210', '2003-05-12'),
('Sneha', 'Iyer', 'sneha.iyer@example.com', '8765432109', '2002-09-18'),
('Amit', 'Sharma', 'amit.sharma@example.com', '7654321098', '2001-12-25');

SELECT * FROM Students;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    Department VARCHAR(100),
    Duration INT,
    Credits INT
);

INSERT INTO Courses (CourseName, Department, Duration, Credits) VALUES
('Computer Science', 'Engineering', 4, 40),
('Mechanical Engineering', 'Engineering', 4, 38),
('Business Administration', 'Management', 3, 30);

SELECT * FROM Courses;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Status ENUM('Active', 'Completed', 'Dropped'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Status) VALUES
(1, 1, '2023-07-01', 'Active'),
(2, 2, '2022-08-15', 'Completed'),
(3, 3, '2021-06-10', 'Dropped');

SELECT * FROM Enrollments;

CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Professors (FirstName, LastName, Department, Email) VALUES
('Dr. Anil', 'Kapoor', 'Computer Science', 'anil.kapoor@example.com'),
('Dr. Meena', 'Rao', 'Mechanical Engineering', 'meena.rao@example.com'),
('Dr. Raj', 'Malhotra', 'Management', 'raj.malhotra@example.com');

SELECT * FROM Professors;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Head VARCHAR(100),
    Phone VARCHAR(15),
    OfficeLocation VARCHAR(100)
);

INSERT INTO Departments (Name, Head, Phone, OfficeLocation) VALUES
('Engineering', 'Dr. Suresh Nair', '0112233445', 'Block A, Room 101'),
('Management', 'Dr. Poonam Das', '0223344556', 'Block B, Room 205'),
('Humanities', 'Dr. Rajesh Gupta', '0334455667', 'Block C, Room 303');

SELECT * FROM Departments;

DROP TABLE Enrollments;
DROP TABLE Professors;
DROP TABLE Students;
DROP TABLE Courses;
DROP TABLE Departments;


-- 3rd database

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    ISBN VARCHAR(20) UNIQUE,
    PublishedYear YEAR
);

INSERT INTO Books (Title, Author, Genre, ISBN, PublishedYear) VALUES
('The White Tiger', 'Aravind Adiga', 'Fiction', '9788172238476', 2008),
('God of Small Things', 'Arundhati Roy', 'Drama', '9780812979657', 1997),
('Midnight’s Children', 'Salman Rushdie', 'Historical Fiction', '9780099511892', 1981);

SELECT * FROM Books;

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    MembershipDate DATE
);

INSERT INTO Members (FirstName, LastName, Email, Phone, MembershipDate) VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '2023-01-10'),
('Priya', 'Iyer', 'priya.iyer@example.com', '8765432109', '2022-07-15'),
('Amit', 'Patel', 'amit.patel@example.com', '7654321098', '2021-11-20');

SELECT * FROM Members;

CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    Status ENUM('Borrowed', 'Returned', 'Overdue'),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Borrowings (MemberID, BookID, BorrowDate, ReturnDate, Status) VALUES
(1, 1, '2025-03-01', '2025-03-15', 'Borrowed'),
(2, 2, '2025-02-20', '2025-03-05', 'Returned'),
(3, 3, '2025-01-10', '2025-01-25', 'Overdue');

SELECT * FROM Borrowings;

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role ENUM('Librarian', 'Assistant', 'Manager'),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

INSERT INTO Staff (FirstName, LastName, Role, Email, Phone) VALUES
('Suresh', 'Reddy', 'Librarian', 'suresh.reddy@example.com', '9988776655'),
('Neha', 'Singh', 'Assistant', 'neha.singh@example.com', '8877665544'),
('Vikram', 'Joshi', 'Manager', 'vikram.joshi@example.com', '7766554433');

SELECT * FROM Staff;

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Address VARCHAR(255),
    ContactPerson VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

INSERT INTO Publishers (Name, Address, ContactPerson, Email, Phone) VALUES
('Penguin India', '11 Community Centre, New Delhi', 'Anil Mehta', 'penguinindia@example.com', '0111234567'),
('HarperCollins India', 'A-75, Sector 63, Noida', 'Suman Verma', 'harpercollinsindia@example.com', '0120456789'),
('Rupa Publications', '7/16, Ansari Road, New Delhi', 'Rajesh Kapoor', 'rupa@example.com', '0112233445');

SELECT * FROM Publishers;

DROP TABLE Borrowings;
DROP TABLE Staff;
DROP TABLE Members;
DROP TABLE Books;
DROP TABLE Publishers;


-- 4th databse

CREATE DATABASE AirlineDB;
USE AirlineDB;

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    PassportNumber VARCHAR(20) UNIQUE
);

INSERT INTO Passengers (FirstName, LastName, Email, Phone, PassportNumber) VALUES
('John', 'ram', 'ram@example.com', '1234567890', 'P1234567'),
('Alice', 'Sham', 'sham@example.com', '9876543210', 'P7654321'),
('Bob', 'sita', 'sita@example.com', '5678901234', 'P9876543');

SELECT * FROM Passengers;

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10) UNIQUE,
    DepartureAirport VARCHAR(50),
    ArrivalAirport VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME
);

INSERT INTO Flights (FlightNumber, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) VALUES
('AI101', 'JFK', 'LAX', '2025-03-10 08:00:00', '2025-03-10 11:00:00'),
('BA202', 'LHR', 'JFK', '2025-03-11 14:30:00', '2025-03-11 18:30:00'),
('QR303', 'DOH', 'DXB', '2025-03-12 07:45:00', '2025-03-12 09:15:00');

SELECT * FROM Flights;

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    FlightID INT,
    BookingDate DATE,
    SeatNumber VARCHAR(5),
    Status ENUM('Confirmed', 'Cancelled', 'Pending'),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO Bookings (PassengerID, FlightID, BookingDate, SeatNumber, Status) VALUES
(1, 1, '2025-03-05', '12A', 'Confirmed'),
(2, 2, '2025-03-06', '15C', 'Pending'),
(3, 3, '2025-03-07', '9B', 'Confirmed');

SELECT * FROM Bookings;

CREATE TABLE Crew (
    CrewID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role ENUM('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer'),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

INSERT INTO Crew (FirstName, LastName, Role, Email, Phone) VALUES
('Michael', 'Brown', 'Pilot', 'michael@example.com', '3216549870'),
('Sarah', 'White', 'Flight Attendant', 'sarah@example.com', '6543217890'),
('James', 'Green', 'Co-Pilot', 'james@example.com', '7890123456');

SELECT * FROM Crew;

CREATE TABLE Airplanes (
    AirplaneID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(50),
    Capacity INT,
    Manufacturer VARCHAR(50),
    RegistrationNumber VARCHAR(20) UNIQUE,
    YearOfManufacture YEAR
);

INSERT INTO Airplanes (Model, Capacity, Manufacturer, RegistrationNumber, YearOfManufacture) VALUES
('Boeing 737', 180, 'Boeing', 'N12345', 2018),
('Airbus A320', 160, 'Airbus', 'A67890', 2020),
('Boeing 787', 250, 'Boeing', 'N54321', 2019);

SELECT * FROM Airplanes;

DROP TABLE Bookings;
DROP TABLE Crew;
DROP TABLE Passengers;
DROP TABLE Flights;
DROP TABLE Airplanes;


-- 5th database

CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

INSERT INTO Patients (FirstName, LastName, Age, Phone, Address) VALUES
('Arjun', 'Sharma', 30, '9876543210', 'Mumbai, Maharashtra'),
('Meera', 'Iyer', 25, '8765432109', 'Chennai, Tamil Nadu'),
('Rajesh', 'Patel', 45, '7654321098', 'Ahmedabad, Gujarat');

SELECT * FROM Patients;

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Doctors (FirstName, LastName, Specialization, Phone, Email) VALUES
('Dr. Suresh', 'Nair', 'Cardiologist', '9988776655', 'suresh.nair@example.com'),
('Dr. Pooja', 'Rao', 'Dermatologist', '8877665544', 'pooja.rao@example.com'),
('Dr. Vikram', 'Joshi', 'Orthopedic', '7766554433', 'vikram.joshi@example.com');

SELECT * FROM Doctors;

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-03-10', 'Scheduled'),
(2, 2, '2025-02-25', 'Completed'),
(3, 3, '2025-01-15', 'Cancelled');

SELECT * FROM Appointments;

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Medications (PatientID, MedicineName, Dosage, Frequency) VALUES
(1, 'Aspirin', '75mg', 'Once a day'),
(2, 'Paracetamol', '500mg', 'Twice a day'),
(3, 'Ibuprofen', '400mg', 'Thrice a day');

SELECT * FROM Medications;

CREATE TABLE Bills (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Amount DECIMAL(10,2),
    PaymentStatus ENUM('Paid', 'Unpaid'),
    BillDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Bills (PatientID, Amount, PaymentStatus, BillDate) VALUES
(1, 5000.00, 'Paid', '2025-03-11'),
(2, 3000.00, 'Unpaid', '2025-02-26'),
(3, 4500.00, 'Paid', '2025-01-16');

SELECT * FROM Bills;

DROP TABLE Appointments;
DROP TABLE Medications;
DROP TABLE Bills;
DROP TABLE Patients;
DROP TABLE Doctors;


-- 6th database

CREATE DATABASE WebDevCompanyDB;
USE WebDevCompanyDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Position VARCHAR(50)
);

INSERT INTO Employees (FirstName, LastName, Email, Phone, Position) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', 'Frontend Developer'),
('Neha', 'Verma', 'neha.verma@example.com', '8765432109', 'Backend Developer'),
('Ravi', 'Patel', 'ravi.patel@example.com', '7654321098', 'Project Manager');

SELECT * FROM Employees;

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    ClientName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Status ENUM('Ongoing', 'Completed', 'On Hold')
);

INSERT INTO Projects (ProjectName, ClientName, StartDate, EndDate, Status) VALUES
('E-commerce Website', 'Reliance Digital', '2024-01-10', '2024-06-30', 'Ongoing'),
('Corporate Portal', 'Tata Consultancy', '2023-08-15', '2024-02-28', 'Completed'),
('Startup Landing Page', 'Zomato', '2024-03-01', '2024-05-15', 'On Hold');

SELECT * FROM Projects;

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    HoursAllocated INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Assignments (EmployeeID, ProjectID, Role, HoursAllocated) VALUES
(1, 1, 'UI Design', 120),
(2, 2, 'Backend Development', 200),
(3, 3, 'Project Coordination', 80);

SELECT * FROM Assignments;

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Company VARCHAR(100)
);

INSERT INTO Clients (ClientName, ContactPerson, Email, Phone, Company) VALUES
('Reliance Digital', 'Suresh Nair', 'suresh.nair@reliancedigital.com', '9876123450', 'Reliance'),
('Tata Consultancy', 'Pooja Rao', 'pooja.rao@tcs.com', '8765123409', 'TCS'),
('Zomato', 'Rajesh Mehta', 'rajesh.mehta@zomato.com', '7654123098', 'Zomato Pvt Ltd');

SELECT * FROM Clients;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    Status ENUM('Pending', 'Completed'),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Payments (ClientID, Amount, PaymentDate, Status) VALUES
(1, 150000.00, '2024-02-15', 'Completed'),
(2, 200000.00, '2024-03-01', 'Pending'),
(3, 50000.00, '2024-03-10', 'Completed');

SELECT * FROM Payments;

DROP TABLE Assignments;
DROP TABLE Payments;
DROP TABLE Clients;
DROP TABLE Employees;
DROP TABLE Projects;


-- 7th database

CREATE DATABASE HouseDB;
USE HouseDB;

CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

INSERT INTO Owners (FirstName, LastName, Phone, Email, Address) VALUES
('Rajesh', 'Sharma', '9876543210', 'rajesh.sharma@example.com', 'Mumbai, Maharashtra'),
('Pooja', 'Verma', '8765432109', 'pooja.verma@example.com', 'Delhi, India'),
('Anil', 'Patel', '7654321098', 'anil.patel@example.com', 'Ahmedabad, Gujarat');

SELECT * FROM Owners;

CREATE TABLE Houses (
    HouseID INT PRIMARY KEY AUTO_INCREMENT,
    OwnerID INT,
    Location VARCHAR(100),
    Size INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);

INSERT INTO Houses (OwnerID, Location, Size, Price) VALUES
(1, 'Bandra, Mumbai', 1200, 8500000.00),
(2, 'Connaught Place, Delhi', 1500, 9500000.00),
(3, 'Navrangpura, Ahmedabad', 1000, 6000000.00);

SELECT * FROM Houses;

CREATE TABLE Tenants (
    TenantID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    HouseID INT,
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
);

INSERT INTO Tenants (FirstName, LastName, Phone, Email, HouseID) VALUES
('Suresh', 'Nair', '9998887776', 'suresh.nair@example.com', 1),
('Meena', 'Iyer', '8887776665', 'meena.iyer@example.com', 2),
('Ravi', 'Joshi', '7776665554', 'ravi.joshi@example.com', 3);

SELECT * FROM Tenants;

CREATE TABLE RentPayments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    TenantID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    Status ENUM('Paid', 'Pending'),
    FOREIGN KEY (TenantID) REFERENCES Tenants(TenantID)
);

INSERT INTO RentPayments (TenantID, Amount, PaymentDate, Status) VALUES
(1, 25000.00, '2025-03-01', 'Paid'),
(2, 30000.00, '2025-02-15', 'Pending'),
(3, 20000.00, '2025-03-10', 'Paid');

SELECT * FROM RentPayments;

CREATE TABLE MaintenanceRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    HouseID INT,
    Description TEXT,
    RequestDate DATE,
    Status ENUM('Pending', 'Completed'),
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
);

INSERT INTO MaintenanceRequests (HouseID, Description, RequestDate, Status) VALUES
(1, 'Plumbing issue in the kitchen', '2025-02-20', 'Completed'),
(2, 'Electrical wiring problem', '2025-02-25', 'Pending'),
(3, 'Broken window in the living room', '2025-03-05', 'Completed');

SELECT * FROM MaintenanceRequests;

DROP TABLE RentPayments;
DROP TABLE MaintenanceRequests;
DROP TABLE Tenants;
DROP TABLE Houses;
DROP TABLE Owners;


-- 8th database

CREATE DATABASE MyVillageDB;
USE MyVillageDB;

CREATE TABLE Families (
    FamilyID INT PRIMARY KEY AUTO_INCREMENT,
    HeadOfFamily VARCHAR(50),
    MembersCount INT,
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

INSERT INTO Families (HeadOfFamily, MembersCount, Address, Phone) VALUES
('Ramesh Yadav', 5, 'Main Street, Rampur', '9876543210'),
('Anita Sharma', 4, 'Lake View, Madhupur', '8765432109'),
('Vikram Patel', 6, 'Market Road, Devgaon', '7654321098');

SELECT * FROM Families;

CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT,
    CropType VARCHAR(50),
    LandSize DECIMAL(5,2)
);

INSERT INTO Farmers (Name, Age, CropType, LandSize) VALUES
('Harish Kumar', 45, 'Wheat', 2.5),
('Meera Devi', 38, 'Rice', 3.0),
('Suresh Choudhary', 50, 'Sugarcane', 4.2);

SELECT * FROM Farmers;

CREATE TABLE Shops (
    ShopID INT PRIMARY KEY AUTO_INCREMENT,
    OwnerName VARCHAR(50),
    ShopType VARCHAR(50),
    Location VARCHAR(255),
    Contact VARCHAR(15)
);

INSERT INTO Shops (OwnerName, ShopType, Location, Contact) VALUES
('Manoj Verma', 'Grocery', 'Main Bazaar, Rampur', '9998887776'),
('Sunita Joshi', 'Clothing', 'Market Road, Madhupur', '8887776665'),
('Ravi Singh', 'Electronics', 'Station Road, Devgaon', '7776665554');

SELECT * FROM Shops;

CREATE TABLE Schools (
    SchoolID INT PRIMARY KEY AUTO_INCREMENT,
    SchoolName VARCHAR(100),
    PrincipalName VARCHAR(50),
    NoOfStudents INT,
    Location VARCHAR(255)
);

INSERT INTO Schools (SchoolName, PrincipalName, NoOfStudents, Location) VALUES
('Govt. Primary School', 'Rajesh Mehta', 120, 'Rampur'),
('Bal Vidya Mandir', 'Pooja Iyer', 200, 'Madhupur'),
('Sunrise Public School', 'Anil Kumar', 150, 'Devgaon');

SELECT * FROM Schools;

CREATE TABLE Festivals (
    FestivalID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    CelebrationDate DATE,
    MainAttraction VARCHAR(100),
    VillageLocation VARCHAR(255)
);

INSERT INTO Festivals (Name, CelebrationDate, MainAttraction, VillageLocation) VALUES
('Diwali Mela', '2025-10-20', 'Fireworks & Sweets', 'Rampur'),
('Holi Utsav', '2025-03-10', 'Color Throwing & Dance', 'Madhupur'),
('Pongal Festival', '2025-01-15', 'Traditional Cooking', 'Devgaon');

SELECT * FROM Festivals;

DROP TABLE Festivals;
DROP TABLE Schools;
DROP TABLE Shops;
DROP TABLE Farmers;
DROP TABLE Families;


-- 9th database

CREATE DATABASE GroceryStoreDB;
USE GroceryStoreDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

INSERT INTO Customers (FirstName, LastName, Phone, Email, Address) VALUES
('Amit', 'Sharma', '9876543210', 'amit.sharma@example.com', 'Mumbai, Maharashtra'),
('Neha', 'Verma', '8765432109', 'neha.verma@example.com', 'Delhi, India'),
('Ravi', 'Patel', '7654321098', 'ravi.patel@example.com', 'Ahmedabad, Gujarat');

SELECT * FROM Customers;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Basmati Rice', 'Grains', 120.00, 50),
('Amul Butter', 'Dairy', 50.00, 100),
('Tata Salt', 'Spices', 25.00, 200);

SELECT * FROM Products;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status ENUM('Pending', 'Completed', 'Cancelled'),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2025-03-01', 500.00, 'Completed'),
(2, '2025-02-15', 1200.00, 'Pending'),
(3, '2025-03-10', 750.00, 'Completed');

SELECT * FROM Orders;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 2, 240.00),
(2, 2, 5, 250.00),
(3, 3, 10, 250.00);

SELECT * FROM OrderDetails;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

INSERT INTO Suppliers (SupplierName, ContactPerson, Phone, Email, Address) VALUES
('Tata Consumer', 'Suresh Nair', '9998887776', 'suresh.nair@tataconsumer.com', 'Mumbai, Maharashtra'),
('Amul Dairy', 'Pooja Rao', '8887776665', 'pooja.rao@amul.com', 'Anand, Gujarat'),
('Patanjali', 'Rajesh Mehta', '7776665554', 'rajesh.mehta@patanjali.com', 'Haridwar, Uttarakhand');

SELECT * FROM Suppliers;

DROP TABLE OrderDetails;
DROP TABLE Orders;
DROP TABLE Customers;
DROP TABLE Products;
DROP TABLE Suppliers;

-- 10th database

CREATE DATABASE SocietyDB;
USE SocietyDB;

CREATE TABLE Residents (
    ResidentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FlatNumber VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Residents (FirstName, LastName, FlatNumber, Phone, Email) VALUES
('Rajesh', 'Sharma', 'A-101', '9876543210', 'rajesh.sharma@example.com'),
('Pooja', 'Verma', 'B-202', '8765432109', 'pooja.verma@example.com'),
('Anil', 'Patel', 'C-303', '7654321098', 'anil.patel@example.com');

SELECT * FROM Residents;

CREATE TABLE MaintenancePayments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    ResidentID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    Status ENUM('Paid', 'Pending'),
    FOREIGN KEY (ResidentID) REFERENCES Residents(ResidentID)
);

INSERT INTO MaintenancePayments (ResidentID, Amount, PaymentDate, Status) VALUES
(1, 2500.00, '2025-03-01', 'Paid'),
(2, 3000.00, '2025-02-15', 'Pending'),
(3, 2000.00, '2025-03-10', 'Paid');

SELECT * FROM MaintenancePayments;

CREATE TABLE SecurityGuards (
    GuardID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT,
    Shift ENUM('Day', 'Night'),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

INSERT INTO SecurityGuards (Name, Age, Shift, Phone, Address) VALUES
('Suresh Kumar', 45, 'Day', '9998887776', 'Goregaon, Mumbai'),
('Meera Devi', 38, 'Night', '8887776665', 'Malad, Mumbai'),
('Ravi Joshi', 50, 'Day', '7776665554', 'Andheri, Mumbai');

SELECT * FROM SecurityGuards;

CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATE,
    Location VARCHAR(255),
    OrganizedBy VARCHAR(100)
);

INSERT INTO Events (EventName, EventDate, Location, OrganizedBy) VALUES
('Diwali Celebration', '2025-10-20', 'Clubhouse', 'Society Committee'),
('Annual General Meeting', '2025-03-15', 'Community Hall', 'Management Team'),
('Sports Day', '2025-05-10', 'Playground', 'Youth Club');

SELECT * FROM Events;

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    ResidentID INT,
    VehicleNumber VARCHAR(15),
    VehicleType ENUM('Car', 'Bike', 'Scooter'),
    ParkingSpot VARCHAR(10),
    FOREIGN KEY (ResidentID) REFERENCES Residents(ResidentID)
);

INSERT INTO Vehicles (ResidentID, VehicleNumber, VehicleType, ParkingSpot) VALUES
(1, 'MH12AB1234', 'Car', 'P1-101'),
(2, 'DL5C6789', 'Bike', 'P2-202'),
(3, 'GJ1XY9876', 'Scooter', 'P3-303');

SELECT * FROM Vehicles;

DROP TABLE Vehicles;
DROP TABLE Events;
DROP TABLE SecurityGuards;
DROP TABLE MaintenancePayments;
DROP TABLE Residents;


