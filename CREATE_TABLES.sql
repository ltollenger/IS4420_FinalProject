USE master; 
GO

DROP DATABASE IF EXISTS FinalProject_Group8;
CREATE DATABASE FinalProject_Group8;

USE FinalProject_Group8;

CREATE TABLE EMPLOYEES (
    EmployeeID SMALLINT NOT NULL IDENTITY(1,1),
    SSN INT NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    MiddleName VARCHAR(30) DEFAULT NULL,
    LastName VARCHAR(30) NOT NULL,
    StreetAddress VARCHAR(35) NOT NULL,
    City VARCHAR(30) NOT NULL,
    StateCode VARCHAR(2) NOT NULL,
    ZipCode SMALLINT NOT NULL,
    Title VARCHAR(25) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CONSTRAINT PK_Employees_EmployeeID PRIMARY KEY (EmployeeID)
);

CREATE TABLE WAREHOUSE_EMP (
    EmployeeID SMALLINT NOT NULL,
    HourlyPay TINYINT NOT NULL,
    ForkliftCert VARCHAR(1) NOT NULL,
    CONSTRAINT PK_WAREHOUSE_EMP_EmployeeID PRIMARY KEY (EmployeeID)
);

CREATE TABLE TRUCKER (
    EmployeeID SMALLINT NOT NULL,
    HourlyPay TINYINT NOT NULL,
    MilesDriven INT NOT NULL,
    PayPerMile TINYINT NOT NULL,
    CDL VARCHAR(1) NOT NULL ,
    CONSTRAINT PK_TRUCKER_EmployeeID PRIMARY KEY (EmployeeID)
);

CREATE TABLE SERVICE_MEMBER (
    EmployeeID SMALLINT NOT NULL,
    HourlyPay TINYINT NOT NULL,
    HomeCert VARCHAR(1) NOT NULL,
    CONSTRAINT PK_SERVICE_MEMBER_EmployeeID PRIMARY KEY (EmployeeID)
);

CREATE TABLE ADMINISTRATION (
    EmployeeID SMALLINT NOT NULL,
    Salary INT NOT NULL,
    CONSTRAINT PK_ADMINISTRATION_EmployeeID PRIMARY KEY (EmployeeID)
);

CREATE TABLE SALES_REP (
    EmployeeID SMALLINT NOT NULL,
    BaseSalary INT NOT NULL,
    Commissions INT NOT NULL,
    CONSTRAINT PK_SALES_REP_EmployeeID PRIMARY KEY (EmployeeID)
);




CREATE TABLE CUSTOMER (
    CustomerID SMALLINT NOT NULL,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    BillingStreetAddress VARCHAR(50),
    BillingZipCode SMALLINT NOT NULL,
    BillingStateCode VARCHAR(2) NOT NULL,
    InsuranceCompany VARCHAR(40) DEFAULT NULL,
    InsuranceID INT DEFAULT NULL,
    CONSTRAINT PK_CUSTOMER_CustomerID PRIMARY KEY (CustomerID)
);

-- NEED TO FIX THIS
CREATE TABLE INDIVIDUAL (
    CustomerID SMALLINT NOT NULL
    --  <type>,
    --  <type>,
    CONSTRAINT PK_INDIVIDUAL_CustomerID PRIMARY KEY (CustomerID)
);

CREATE TABLE BUSINESS (
    CustomerID SMALLINT NOT NULL,
    BusinessName VARCHAR(30) NOT NULL,
    BusinessType VARCHAR(30) NOT NULL,
    CONSTRAINT PK_BUSINESS_CustomerID PRIMARY KEY (CustomerID)
);

CREATE TABLE EMAIL (
    CustomerID SMALLINT NOT NULL,
    EmailAddress VARCHAR(254) NOT NULL,
    PrimaryEmailFlag VARCHAR(1) NOT NULL,
    CONSTRAINT PK_CustomerID_EmailAddress PRIMARY KEY (CustomerID, EmailAddress),
    CONSTRAINT FK_CustomerID_EmailAddress FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);

CREATE TABLE PHONE_NUMBER (
    CustomerID SMALLINT NOT NULL,
    PhoneNumber VARCHAR(254) NOT NULL,
    PrimaryNumberFlag VARCHAR(1) NOT NULL,
    CONSTRAINT PK_CustomerID_PhoneNumber PRIMARY KEY (CustomerID, PhoneNumber),
    CONSTRAINT FK_CustomerID_PhoneNumber FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);



CREATE TABLE PRODUCT (
    ProductID SMALLINT NOT NULL,
    ProductName VARCHAR(30) NOT NULL,
    ProductDescription VARCHAR(250) NOT NULL,
    SalesPrice DECIMAL(9, 2) NOT NULL,
    ProductionTime SMALLINT NOT NULL,
    CONSTRAINT PK_Product_ProductID PRIMARY KEY (ProductID)
);

CREATE TABLE PRODUCT_PRICE_HISTORY (
    ProductID SMALLINT NOT NULL,
    PriceChangeDate DATE NOT NULL,
    SalesPrice DECIMAL(9, 2) NOT NULL,
    CONSTRAINT PK_ProductPriceHistory_ProductID_PriceChangeDate PRIMARY KEY (ProductID, PriceChangeDate),
    CONSTRAINT FK_ProductPriceHistory_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
);


-- FIX THIS TABLE NAME
CREATE TABLE CUSTOMER_ORDER (
    OrderID INT NOT NULL,
    CustomerID SMALLINT NOT NULL,
    EmployeeID SMALLINT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTime TIME NOT NULL,
    DeliveryAddress VARCHAR(50),
    DeliveryZipCode SMALLINT NOT NULL,
    DeliveryState VARCHAR(2) NOT NULL,
    CONSTRAINT PK_Orders_OrderID PRIMARY KEY (OrderID),
    CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID),
    CONSTRAINT FK_Orders_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID)
);

CREATE TABLE ORDER_PRODUCT (
    OrderProduct INT IDENTITY(1, 1) NOT NULL,
    OrderID INT NOT NULL,
    ProductID SMALLINT NOT NULL,
    Price DECIMAL (9, 2) NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT PK_OrderProduct_OrderProduct PRIMARY KEY (OrderProduct),
    CONSTRAINT FK_OrderProduct_OrderID FOREIGN KEY (OrderID) REFERENCES CUSTOMER_ORDER (OrderID),
    CONSTRAINT FK_OrderProduct_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
);


CREATE TABLE SHIPMENT_LOCATION (
    ShipmentLocationID TINYINT NOT NULL,
    OrderID INT NOT NULL,
    ProductID SMALLINT NOT NULL,
    CONSTRAINT PK_ShipmentLocation_ShipmentLocationID PRIMARY KEY (ShipmentLocationID),
    CONSTRAINT FK_ShipmentLocation_OrderID FOREIGN KEY (OrderID) REFERENCES CUSTOMER_ORDER (OrderID),
    CONSTRAINT FK_ShipmentLocation_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
);


CREATE TABLE CORPORATE_TRUCKING (
    ShipmentLocationID TINYINT NOT NULL,
    CorporateTruckID TINYINT NOT NULL,
    CONSTRAINT PK_CorporateTrucking_ShipmentLocationID PRIMARY KEY (ShipmentLocationID)
);

CREATE TABLE INTERNAL_TRUCK (
    ShipmentLocationID TINYINT NOT NULL,
    InternalTruckID TINYINT NOT NULL,
    CONSTRAINT PK_INTERNAL_TRUCK_ShipmentLocationID PRIMARY KEY (ShipmentLocationID)
);

CREATE TABLE INTRASTATE_LINE (
    ShipmentLocationID TINYINT NOT NULL,
    LineID SMALLINT NOT NULL,
    LineName VARCHAR(30) NOT NULL,
    CONSTRAINT PK_INTRASTATE_LINE_ShipmentLocationID_LineID PRIMARY KEY (ShipmentLocationID, LineID),
    CONSTRAINT FK_INTRASTATE_LINE_ShipmentLocationID FOREIGN KEY (ShipmentLocationID) REFERENCES SHIPMENT_LOCATION (ShipmentLocationID)
);



CREATE TABLE WAREHOUSE (
    ShipmentLocationID TINYINT NOT NULL,
    BinNumber SMALLINT NOT NULL,
    AisleNumber SMALLINT NOT NULL,
    COnstraint PK_WAREHOUSE_ShipmentLocationID PRIMARY KEY (ShipmentLocationID)
);


CREATE TABLE PRODUCT_LOCATION (
    ProductLocationID INT IDENTITY(1, 1) NOT NULL,
    ProductID SMALLINT NOT NULL,
    CONSTRAINT PK_ProductLocation_ProductLocationID PRIMARY KEY (ProductLocationID),
    CONSTRAINT FK_ProductLocation_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
);
         
