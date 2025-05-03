CREATE DATABASE IF NOT EXISTS dwh_orion; 

CREATE USER 'ETLUser'@'localhost' IDENTIFIED BY 'mysecret'; 
GRANT SELECT, INSERT, UPDATE ON dwh_orion.* TO 'ETLUser'@'localhost'; 
USE dwh_orion; 

/****** Object: Table dbo.Customer_Dim Script Date: 10/11/2018 17:48:08 ******/ 
DROP TABLE if exists dwh_orion.Customer_Dim; 
CREATE TABLE Customer_Dim ( Customer_ID int NOT NULL, Customer_Country varchar(2) DEFAULT NULL, Customer_Group varchar(40) DEFAULT NULL, 
Customer_Type varchar(40) DEFAULT NULL, Customer_Gender varchar(1) DEFAULT NULL, Customer_Age_Group varchar(12) DEFAULT NULL, Customer_Age smallint DEFAULT NULL, 
Customer_Name varchar(40) DEFAULT NULL, Customer_Firstname varchar(20) DEFAULT NULL, Customer_Lastname varchar(30) DEFAULT NULL, 
Customer_Birth_Date date DEFAULT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

/****** Object: Table dbo.Product_Dim Script Date: 10/11/2018 17:48:08 ******/ 
DROP TABLE if exists dwh_orion.Product_Dim; 
CREATE TABLE Product_Dim ( Product_ID bigint NOT NULL, Product_Line varchar(20) DEFAULT NULL, Product_Category varchar(25) DEFAULT NULL, 
Product_Group varchar(25) DEFAULT NULL, Product_Name varchar(45) DEFAULT NULL, Supplier_Country varchar(2) DEFAULT NULL, Supplier_Name varchar(30) DEFAULT NULL, 
Supplier_ID int DEFAULT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE if exists dwh_orion.Organization_Dim; 
CREATE TABLE Organization_Dim ( Employee_ID INTEGER NOT NULL, Employee_Country CHARACTER(2), Company CHARACTER(30), Department VARCHAR(40), Section VARCHAR(40), 
Org_Group VARCHAR(40), Job_Title VARCHAR(25), Employee_Name VARCHAR(40), Employee_Gender CHARACTER(1), Salary DECIMAL(13), Employee_Birth_Date DATE, Employee_Hire_Date DATE, 
Employee_Term_Date DATE, PRIMARY KEY (Employee_ID) ); 

DROP TABLE if exists dwh_orion.Geography_Dim; 
CREATE TABLE Geography_Dim ( Street_ID bigint NOT NULL, Continent VARCHAR(30), Country CHARACTER(24), State_Code CHARACTER(2), State VARCHAR(25), Region VARCHAR(30), 
Province VARCHAR(30), County VARCHAR(60), City VARCHAR(30), Postal_Code CHARACTER(10), Street_Name VARCHAR(45), PRIMARY KEY (Street_ID) );

DROP TABLE if exists dwh_orion.Time_Dim; 
CREATE TABLE Time_Dim ( Date_ID DATE NOT NULL, Year_ID CHARACTER(4), Quarter CHARACTER(6), Month_Name VARCHAR(20), Weekday_Name VARCHAR(20), Month_Num SMALLINT, 
Weekday_Num SMALLINT, PRIMARY KEY (Date_ID) ); 

DROP TABLE if exists dwh_orion.Order_Fact; 
CREATE TABLE Order_Fact ( Customer_ID INTEGER, Employee_ID INTEGER, Street_ID bigint, Product_ID bigint, Order_Date DATE, Order_ID INTEGER, Order_Type SMALLINT, 
Delivery_Date DATE, Quantity SMALLINT, Total_Retail_Price DECIMAL(13,2), Costprice_Per_Unit DECIMAL(13,2), Discount DECIMAL(5,2), PRIMARY KEY (Order_ID) );