#HEADER
#Program Name: MidTerm
#Author: Ethan Sexton
#Class: CS162 spring 2021
#Date: 5/18/2021
#Description: This project is meant to implement knowledge of databases and the normalization process;

DROP DATABASE IF EXISTS SimpleSheetsCompany; 

Create database SimpleSheetsCompany; 
USE SimpleSheetsCompany; 

CREATE TABLE IF NOT EXISTS OrderForm (
	OrderID int AUTO_INCREMENT PRIMARY KEY,
	#OrderStatus VARCHAR(500),
    #OrderDetails VARCHAR(500)
    OrderDate date
    );

CREATE TABLE IF NOT EXISTS Customer(
	PersonID int null,
    EmailAddress varchar(50), 
    Address varchar(250), 
    PhoneNumber int , 
    DOB date,
    Primary key(PersonID, Address)
    );
 
   
    CREATE TABLE IF NOT EXISTS Address (
		AddressID int auto_increment primary key, 
        Line_1 varchar(30),
        Line_2 varchar(30) null,
        City varchar(30),
        State varchar(30),
        Zipcode int
        );
CREATE TABLE IF NOT EXISTS Person (
			
            PersonID int auto_increment Primary key ,
            FirstName varchar(20),
            LastName varchar(20)
            
            );
CREATE TABLE IF NOT EXISTS Employee (
			PersonID int ,
            DepartmentName varchar(25), 
            Primary Key (PersonID, DepartmentName)
            );
CREATE TABLE IF NOT EXISTS Department (
			Name varchar(20) primary key
            );
CREATE TABLE IF NOT EXISTS OrderDetails (
				OrderID int unique, 
                ItemNumber int auto_increment unique,
                Quantity int,
                Price float, 
                OrderDate date,
                PersonID int,
                primary key (OrderID, ItemNumber)
                );
		CREATE TABLE IF NOT EXISTS Item (
                ItemNumber int Primary Key,
                Description varchar(250),
                QuantityInStock int, 
                QuantityOnHold int, 
                Price float
                );
		CREATE TABLE IF NOT EXISTS Payment (
				PaymentID int auto_increment primary key, 
                Address varchar(250), 
                FirstName varchar(20),
                LastName varchar(20), 
                Type varchar(20)
                );
		CREATE TABLE IF NOT EXISTS OrderStatus (
				Type varchar(20),
                OrderID int auto_increment unique, 
                DateChanged date,
                Primary key (OrderID, Type)
                );
		CREATE TABLE IF NOT EXISTS ShippingLable (
				TrackingNumber int auto_increment primary key,
                ShipDate date, 
                weight int, 
                Address varchar(250)
                );
                
	ALTER TABLE customer ADD CONSTRAINT FOREIGN KEY (PersonID) REFERENCES Person (PersonID) ON DELETE CASCADE;
	ALTER TABLE employee ADD CONSTRAINT FOREIGN KEY (PersonID) REFERENCES Person (PersonID) ON DELETE CASCADE;
    ALTER TABLE Employee ADD CONSTRAINT FOREIGN KEY (DepartmentName) REFERENCES Department (Name) ON DELETE CASCADE;
    ALTER TABLE OrderDetails ADD CONSTRAINT FOREIGN KEY (PersonID) REFERENCES Person (PersonID) ON DELETE CASCADE;
    ALTER TABLE orderstatus ADD CONSTRAINT FOREIGN KEY (orderID) REFERENCES OrderForm (OrderID) ON DELETE CASCADE;
	ALTER TABLE orderDetails ADD CONSTRAINT FOREIGN KEY (orderID) REFERENCES OrderForm (OrderID) ON DELETE CASCADE;
   ALTER TABLE OrderDetails ADD CONSTRAINT FOREIGN KEY (ItemNumber) REFERENCES Item (ItemNumber);
    
                
INSERT INTO orderform (OrderDate)
	VALUES
	('2021-02-26'), 
    ('2020-02-26'),
    ('2021-12-14'),
    ('2020-02-31'),
    ('2021-05-18');
INSERT INTO Customer (EmailAddress, Address, PhoneNumber, DOB)
	values
    ('John@gmail.com', '4222 White Rd The Dalles OR 97058', '541-555-5551', '1990-02-04'),
    ('Jim@gmail.com','3456 Belmont Rd Hood River OR 97032', '541-555-5552', '1974-09-01'),
    ('billy@gmail.com','435 Slint Rd Wamic OR 97063', '541-555-5553', '2001-11-11'),
    ('Joe@gmail.com', '303 Drive Portland OR 98234', '541-555-5554', '1995-03-12'), 
    ('Adam@gmail.com', '4233 Sutherland Rd Wamic OR 97063', '541-555-5555', '1999-03-07');
   
INSERT INTO Address ( Line_1, Line_2, City, State, Zipcode)
	values
    ('0001 Rd', null, 'The Dalles', 'Oregon', '97058' ),
    ('456 HighTower Street', null, 'Hong Kong', null, null),
    ('Belmont Street', '05 Dotsoon Rd', 'Hood River', 'Oregon', '97031'),
    ('Garris Street', null, 'Mcfarland', 'Idaho', '12345'), 
    ('Jim Street', null, 'JimTown', 'Indiana', '98765');
    
INSERT INTO Person(FirstName, LastName)
	values
    ('John', 'Delapine'),
    ('Jim', 'Lehmann'),
    ('Billy', 'Masterson'),
    ('Joe', 'Shmoe'),
    ('Adam', 'Clark');
    
INSERT INTO Employee(DepartmentName)
	values
    ('Sales'), 
    ('Finance'),
    ('Packaging'),
    ('Shipping');

INSERT INTO Department(Name)
	values
    ('Sales'), 
    ('Finance'),
    ('Packaging'),
    ('Shipping');
    
INSERT INTO OrderDetails (Quantity, OrderDate, Price)
	values
    ('2000', '2021-02-26', '$2000.00'),
    ('5000', '2020-02-26', '$5000.50'),
    ('20000', '2021-12-14', '$20000.00'),
    ('100000', '2020-02-31', '$100,000.00'), 
    ('700', '2021-05-18', '$700.30');
    
INSERT INTO Item (Description, QuantityInStock, QuantityOnHold, price)
	values
    ('66.2 x 93.6 in', '1000000023', '25000' '$1.00'),
    ('46.8 x 66.2 in', '2000235785', '35000' '$1.00'),
    ('33.1 x 46.8 in', '999841', '$1.00'),
    ('23.4 x 33.1 in', '3000354768', '$1.00'), 
    ('25 x 11 in', '600562', '$1.00');
    
INSERT INTO payment(Address, FirstName, LastName, Type)
	values
     ('John@gmail.com', 'Johm', 'Delapine', 'Paid'),
    ('Jim@gmail.com','Jim', 'Lehmann', 'Shipped'),
    ('billy@gmail.com','Billy', 'Masterson', 'Delivered'),
    ('Joe@gmail.com', 'Joe', 'Shmoe', 'Packaged'), 
    ('Adam@gmail.com', 'Adam', 'Clark', 'Paid');
    
INSERT INTO OrderStatus(DateChanged)
	values
    ('2021-04-16'), 
    ('2020-01-21'),
    ('2021-02-24'),
    ('2020-12-31'),
    ('2021-03-28');
    
INSERT INTO ShippingDate(Address, ShipDate, weight)
	values
    ('John@gmail.com', '2021-05-12', '4025'),
    ('Jim@gmail.com','2021-05-02','10034'),
    ('billy@gmail.com','2021-07-12', '8234'),
    ('Joe@gmail.com', '2021-09-03', '3562'), 
    ('Adam@gmail.com', '2021-12-07', '12478');
   
   

        