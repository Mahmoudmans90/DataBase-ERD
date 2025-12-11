CREATE TABLE Suppliers (
    SupplierId INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200),
    ContactNumber VARCHAR(20)
);

CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(200),
    MainCategory VARCHAR(100)
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    StockQuantity INT,
    Name VARCHAR(100),
    AddedDate DATE,
    Description VARCHAR(300),
    UnitPrice DECIMAL(10,2),
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

CREATE TABLE Products_Suppliers (
    SupplierId INT,
    ProductId INT,
    PRIMARY KEY (SupplierId, ProductId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE StockTransactions (
    TranId INT PRIMARY KEY,
    TranDate DATE,
    QuantityChange INT,
    Type VARCHAR(50),
    Reference VARCHAR(100),
    ProductId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    FullName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    ShippingAddress VARCHAR(200),
    RegistrationDate DATE
);

CREATE TABLE Reviews (
    ReviewId INT PRIMARY KEY,
    Rating DECIMAL(2,1),
    Date DATE,
    Comment VARCHAR(300),
    ProductId INT,
    CustomerId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10,2),
    OrderDate DATE,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ProductId INT,
    OrderId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(50),
    Method VARCHAR(50)
);

CREATE TABLE Orders_Payments (
    OrderId INT,
    PaymentId INT,
    PRIMARY KEY (OrderId, PaymentId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (PaymentId) REFERENCES Payments(PaymentId)
);

CREATE TABLE Shipments (
    ShipmentId INT PRIMARY KEY,
    ShipmentDate DATE,
    Status VARCHAR(50),
    DeliveryDate DATE,
    CarrierName VARCHAR(100),
    TrackingNumber VARCHAR(100),
    OrderId INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);
