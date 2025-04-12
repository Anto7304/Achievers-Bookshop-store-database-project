-- first line: -- This script creates a database named BookstoreDB and a table named Books within it.

Create Database BookstoreDB;

Use BookstoreDB;

-- this one creates tables for Book

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publish_date DATE,
    language_id INT,
    publisher_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- this one creates tables for Book Language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

-- this one creates tables for Publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

-- this one creates tables for Author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- this one creates tables for Book Author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- shipping|_method table
CREATE TABLE shipping_method(
shippingMethod_ID INT PRIMARY KEY AUTO_INCREMENT,
MethodName VARCHAR(20),
Cost DECIMAL(6,2),
Delivery_time DATETIME NOT NULL
);

-- order_status table
CREATE TABLE order_status(
status_ID INT PRIMARY KEY AUTO_INCREMENT,
status VARCHAR(10)
);

-- cust_order table
CREATE TABLE           (
Order_ID INT PRIMARY KEY AUTO_INCREMENT,
OrderDate ADDDATE(date,day) NOT NULL,
customer_ID INT,
shippingMethod_ID INT,
Total_order INT NOT NULL,
address_id INT,
CHECK Total_order>=0,
FOREIGN KEY customer_ID REFERENCE customer(customer_ID),
FOREIGN KEY shippingMethod_ID REFERENCE shipping_method(shippingMethod_ID)
FOREIGN KEY address_id REFERENCE address(address_id)
);


-- order_history table
CREATE TABLE order_history(
OrderHistory_ID INT PRIMARY KEY AUTO_INCREMENT,
Order_ID INT,
status_ID INT,
FOREIGN KEY Order_ID REFERENCE cust_order(Order_ID),
FOREIGN KEY status_ID REFERENCE order_status(status_ID)
);