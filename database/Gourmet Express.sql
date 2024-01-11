-- User Table
CREATE TABLE Users
(
  User_ID INT PRIMARY KEY,
  Username VARCHAR(255) NOT NULL UNIQUE,
  Password VARCHAR(255) NOT NULL
);

-- Account Table
CREATE TABLE Account
(
  Account_ID INT PRIMARY KEY,
  User_ID INT NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Social Media Table
CREATE TABLE Social_Media
(
  Social_Media_ID INT PRIMARY KEY,
  User_ID INT NOT NULL,
  Link VARCHAR(255) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Promotion Table
CREATE TABLE Promotion
(
  Promotion_ID INT PRIMARY KEY,
  Code VARCHAR(10) NOT NULL,
  Discount INT NOT NULL
);

-- Promotion_User Table
CREATE TABLE Promotion_User
(
  User_ID INT NOT NULL,
  Promotion_ID INT NOT NULL,
  PRIMARY KEY (User_ID, Promotion_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Promotion_ID) REFERENCES Promotion(Promotion_ID)
);

-- Customization Table
CREATE TABLE Customization
(
  Customization_ID INT PRIMARY KEY,
  Option_name VARCHAR(255) NOT NULL
);

-- Feedback Table
CREATE TABLE Feedback
(
  Feedback_ID INT PRIMARY KEY,
  Rating FLOAT NOT NULL
);

-- Product Table
CREATE TABLE Product
(
  Product_ID INT PRIMARY KEY,
  Product_name VARCHAR(255) NOT NULL
);

-- Restaurant Table
CREATE TABLE Restaurant
(
  Restaurant_ID INT PRIMARY KEY,
  Feedback_ID INT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  FOREIGN KEY (Feedback_ID) REFERENCES Feedback(Feedback_ID)
);

-- Orders Table
CREATE TABLE Orders
(
  Order_ID INT PRIMARY KEY
);


-- Order_Product Table
CREATE TABLE Order_Product
(
  Order_ID INT NOT NULL,
  Product_ID INT NOT NULL,
  Customization_ID INT,
  PRIMARY KEY (Order_ID, Product_ID),
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Customization_ID) REFERENCES Customization(Customization_ID)
);

-- Payment Table
CREATE TABLE Payment
(
  Payment_ID INT PRIMARY KEY,
  PaymentType VARCHAR(10) NOT NULL
);

-- Coupon Table
CREATE TABLE Coupon
(
  Coupon_ID INT PRIMARY KEY,
  Code INT NOT NULL,
  Discount INT NOT NULL,
  Payment_ID INT NOT NULL,
  FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);

-- Delivery_driver Table
CREATE TABLE Delivery_driver
(
  driver_ID INT PRIMARY KEY,
  Order_ID INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Location Table
CREATE TABLE Location
(
  Location_ID INT PRIMARY KEY,
  Restaurant_ID INT NOT NULL,
  Location_Name VARCHAR(255) NOT NULL,
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

-- Cart Table
CREATE TABLE Cart
(
  Cart_ID INT PRIMARY KEY,
  Order_ID INT NOT NULL,
  Payment_ID INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);

-- Restaurant_owner Table
CREATE TABLE Restaurant_owner
(
  owner_name VARCHAR(255) PRIMARY KEY,
  restaurant_ID INT NOT NULL,
  FOREIGN KEY (restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

-- Employee Table
CREATE TABLE Employee
(
  Ephone INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  driver_ID INT,
  owner_name VARCHAR(255),
  FOREIGN KEY (driver_ID) REFERENCES Delivery_driver(driver_ID),
  FOREIGN KEY (owner_name) REFERENCES Restaurant_owner(owner_name)
);



-- Order_Employee_View Table
CREATE TABLE Order_Employee_View
(
  Order_ID INT NOT NULL,
  Ephone INT NOT NULL,
  PRIMARY KEY (Order_ID, Ephone),
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (Ephone) REFERENCES Employee(Ephone)
);





-- Customer Table
CREATE TABLE Customer
(
  Customer_ID INT PRIMARY KEY,
  Phone_Number BIGINT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  street_address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  Feedback_ID INT NOT NULL,
  FOREIGN KEY (Feedback_ID) REFERENCES Feedback(Feedback_ID),
  UNIQUE (Phone_Number)
);


-- Menu Table
CREATE TABLE Menu
(
  Menu_ID INT PRIMARY KEY,
  Product_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


