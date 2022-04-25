
-------------------------------- All Table Names --------------------------------
-- EMPLOYEES
-- WAREHOUSE_EMP
-- TRUCKER
-- SERVICE_MEMBER
-- ADMINISTRATION
-- SALES_REP

-- CUSTOMER
-- INDIVIDUAL
-- BUSINESS
-- EMAIL
-- PHONE_NUMBER

-- PRODUCT
-- PRODUCT_PRICE_HISTORY

-- CUSTOMER_ORDER
-- ORDER_PRODUCT

-- PRODUCT_LOCATION

-- SHIPMENT_LOCATION
-- CORPORATE_TRUCKING
-- WAREHOUSE
-- INTERNAL_TRUCK
-- INTRASTATE_LINE

-------------------------------- All Table Names --------------------------------
USE FinalProject_Group8;
GO

-- EMPLOYEES
INSERT INTO EMPLOYEES (SSN,FirstName,MiddleName,LastName,StreetAddress,City,StateCode,ZipCode,Title,StartDate,EndDate)
VALUES 
    (123456789, 'John', '', 'Doe', '123 Main St', 'Anytown', 'CA', 12345, 'Manager', '1/1/2000', '1/1/2005'),
    (987654321, 'Jeff', '', 'Johnson', '321 Main St.','Shytown','IL',54321,'Employee', '1/1/2000', '1/1/2020');

-- WAREHOUSE_EMP
SELECT * FROM EMPLOYEES
INSERT INTO WAREHOUSE_EMP (EmployeeID,HourlyPay,ForkliftCert)
VALUES 
	(1, 10, 'Y'), 
	(2, 10, 'Y');

-- TRUCKER
SELECT * FROM EMPLOYEES
INSERT INTO TRUCKER (EmployeeID,HourlyPay,MilesDriven,PayPerMile,CDL)
VALUES (2, 15.2, 100, 1.1, 'Y');

-- SERVICE_MEMBER
SELECT * FROM EMPLOYEES
INSERT INTO SERVICE_MEMBER (EmployeeID,HourlyPay,HomeCert)
VALUES (3, 20.2, 'Y');

-- ADMINISTRATION
SELECT * FROM EMPLOYEES
INSERT INTO ADMINISTRATION (EmployeeID,Salary)
VALUES (4, 25000.00);

-- SALES_REP
SELECT * FROM EMPLOYEES
INSERT INTO SALES_REP (EmployeeID,BaseSalary,Commissions)
VALUES (5, 30000.00, 1000.00);


-- CUSTOMER
INSERT INTO CUSTOMER (CustomerID,FirstName,LastName, BillingStreetAddress,BillingStateCode, BillingZipCode, InsuranceCompany, InsuranceID)
VALUES (1, 'John', 'Doe', '123 Main St','UT', 12345, 'AIG', 123456789);


-- BUSINESS
SELECT * FROM CUSTOMER
INSERT INTO BUSINESS (CustomerID,BusinessName,BusinessType)
VALUES (2, 'ABC Company', 'ABC');

-- EMAIL
SELECT * FROM CUSTOMER
INSERT INTO EMAIL (CustomerID,EmailAddress, PrimaryEmailFlag)
VALUES (1, 'Coolguy123@gmail.com', 'Y');

-- PHONE_NUMBER
SELECT * FROM CUSTOMER
INSERT INTO PHONE_NUMBER (CustomerID,PhoneNumber, PrimaryNumberFlag)
VALUES (1, '1234567890', 'Y');

-- PRODUCT
INSERT INTO PRODUCT (ProductID,ProductName,ProductDescription,SalesPrice,ProductionTime)
VALUES (1, 'Forklift', 'A forklift', 100, 1);

-- PRODUCT_PRICE_HISTORY
SELECT * FROM PRODUCT
INSERT INTO PRODUCT_PRICE_HISTORY (ProductID,PriceChangeDate,SalesPrice)
VALUES (1, '1/1/2000', 100);

-- CUSTOMER_ORDER
INSERT INTO CUSTOMER_ORDER (OrderID,CustomerID,EmployeeID,OrderDate,OrderTime,DeliveryAddress,DeliveryZipCode,DeliveryState)
VALUES (1, 1, 1, '1/1/2000', '1:00 PM', '123 Main St', 12345, 'CA');




------------------------------------
-- STUCK HERE

-- ORDER_PRODUCT
INSERT INTO ORDER_PRODUCT (OrderID,ProductID,Price,Quantity)
VALUES (1, 1, 100, 1);


-- SHIPMENT_LOCATION
INSERT INTO SHIPMENT_LOCATION (ShipmentLocationID,LocationName,StreetAddress,StateCode,ZipCode)
VALUES (1, 'Warehouse #2', '123 Main St', 'CA', 12345);


-- PRODUCT_LOCATION
SELECT * FROM ORDER_PRODUCT
INSERT INTO PRODUCT_LOCATION (OrderProduct,ShipmentLocationID)
VALUES (1, 1);


-- STUCK HERE
------------------------------------


-- CORPORATE_TRUCKING
SELECT * FROM SHIPMENT_LOCATION
INSERT INTO CORPORATE_TRUCKING (ShipmentLocationID,CorporateTruckID)
VALUES (1, 1);

-- WAREHOUSE
SELECT * FROM SHIPMENT_LOCATION
INSERT INTO WAREHOUSE (ShipmentLocationID,BinNumber,AisleNumber)
VALUES (1, 1, 1);

-- INTERNAL_TRUCK
SELECT * FROM SHIPMENT_LOCATION
INSERT INTO INTERNAL_TRUCK (ShipmentLocationID,InternalTruckID)
VALUES (1, 1);

-- INTRASTATE_LINE
SELECT * FROM SHIPMENT_LOCATION
INSERT INTO INTRASTATE_LINE (ShipmentLocationID,LineID,LineName)
VALUES (1, 1, 'A');
