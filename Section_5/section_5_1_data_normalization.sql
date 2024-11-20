-- First Normal Form

create table class_unformalized (
student_id serial,
advisor varchar,
room varchar,
class1 varchar,
class2 varchar,
class3 varchar
)

insert into class_unformalized (
advisor,
room,
class1,
class2,
class3
)
values
('Jones', 123, 'Biology', 'Chemistry', 'Physics')
('Smith', 131, 'English', 'Math', 'Library Science')

- Unnormalized Form
select * from class_unformalized;

-- First Normalized Form (1NF)
select c.student_id, c.advisor, c. room, t.*
from class_unnormalized c
cross join lateral (
values
(c.class1, 'class1'),
(c.class2, 'class2'),
(c.class3, 'class3')
) ast (subject, class_num)
order by student_id;

-- Second Normal Form
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerEmail VARCHAR(50),
    ProductID INT,
    OrderDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    ProductCategory VARCHAR(50),
    ProductPrice DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    OrderQuantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Third Normal Form
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerEmail VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    ProductCategory VARCHAR(50),
    ProductPrice DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    OrderQuantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
