CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE BookstoreDB;

-- Book Language Table
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

-- Publisher Table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Author Table
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- Book Table
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

-- Book Author Join Table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Address Status Table
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(60) NOT NULL
);

-- Country Table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100)
);

-- Address Table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(250),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Customer Table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email VARCHAR(200) UNIQUE,
    phone VARCHAR(30)
);

-- Customer Address Table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id, address_status_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- Shipping Method Table
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50),
    cost DECIMAL(6, 2),
    delivery_time DATETIME NOT NULL
);

-- Order Status Table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50)
);

-- Customer Order Table
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    shipping_method_id INT,
    total_order DECIMAL(10, 2) NOT NULL CHECK (total_order >= 0),
    address_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Order Line Table
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    cost DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order History Table
CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);


<<<<<<< HEAD












=======
USE  bookstoredb;

-- Insert values into Book Language table
INSERT INTO book_language (language_name) 
VALUES
('English'),
('Swahili'),
('Kikuyu'),
('Luo'),
('Kamba'),
('Kalenjin'),
('Meru'),
('Taita'),
('Turkana'),
('Somali');

SELECT * FROM book_language;

-- inserting data to puplisher table
INSERT INTO publisher (publisher_name, address, phone_number)
 VALUES
('Kenya Literature Bureau', 'Moi Avenue, Nairobi', '+254743856701'),
('Longhorn Publishers', 'Kijabe Street, Nairobi', '+254720044552'),
('Phoenix Publishers', 'Hurlingham, Nairobi', '+2547200566703'),
('Storymoja Africa', 'Lenana Road, Nairobi', '+2547205678804'),
('East African Educational Publishers', 'Industrial Area, Nairobi', '+2547200878605'),
('WordAlive Publishers', 'Kilimani, Nairobi', '+254726677006'),
('KLB Kisumu', 'Oginga Odinga Street, Kisumu', '+25472756007'),
('Moran Publishers', 'Langata Road, Nairobi', '+254720756658'),
('Jomo Kenyatta Foundation', 'South C, Nairobi', '+254720778465649'),
('Nairobi Academic Press', 'Thika Road, Nairobi', '+25472067878999');

SELECT * FROM publisher;

-- insert data into author table
INSERT INTO author (first_name, last_name) 
VALUES
('Ngugi', 'wa Thiong\'o'),
('Grace', 'Ogot'),
('Meja', 'Mwangi'),
('Margaret', 'Ogola'),
('Yvonne', 'Owuor'),
('Binyavanga', 'Wainaina'),
('Henry', 'Ole Kulet'),
('Ali', 'Mazrui'),
('Ken', 'Walibora'),
('Rebecca', 'Nandwa');

SELECT * FROM author;

-- insert data into book table 

INSERT INTO book (title, publish_date, language_id, publisher_id, price)
 VALUES
('The River Between', '1965-01-01', 1, 1, 450.00),
('The Promised Land', '1966-06-01', 1, 2, 500.00),
('I Swear by Apollo', '2000-03-15', 1, 3, 600.00),
('The River and the Source', '1994-09-01', 1, 4, 700.00),
('Dust', '2013-01-01', 1, 5, 850.00),
('Going Down River Road', '1976-05-01', 1, 6, 400.00),
('Petals of Blood', '1977-01-01', 1, 7, 750.00),
('Siku Njema', '1996-01-01', 2, 8, 300.00),
('Weep Not, Child', '1964-01-01', 1, 9, 500.00),
('My Life in Crime', '1984-08-01', 1, 10, 550.00);

SELECT * FROM book;

-- insert data into book_author

INSERT INTO book_author (book_id, author_id) 
VALUES
(1, 1),
(2, 1),
(3, 4),
(4, 4),
(5, 5),
(6, 3),
(7, 1),
(8, 10),
(9, 1),
(10, 3);

SELECT * FROM book_author;

-- CUSTOMER TABLE
INSERT INTO customer(first_name,last_name,email,phone)
VALUES('James','Wambui','jwambui@gmail.com',089999346),
('Jane','Waui','jwaui@gmail.com',08990099346),
('Denis','Mwangi','dmwangi@gmail.com',0789999346),
('Daniel','Wingo','dwingo@gmail.com',08999999346),
('Quincy','Wai','qwai@gmail.com',08999559346),
('Samuel','Nyamu','snyamu@gmail.com',08999930046),
('Ann','Wami','awami@gmail.com',08999934116),
('Mary','Wambui','mwambui@gmail.com',08999934886),
('Daniela','Wema','dwema@gmail.com',08999966346),
('Sherly','simbuna','ssimbuna@gmail.com',089999345556)
;
-- COUNTRY TABLE
INSERT INTO country(country_name)
VALUES('Kenya'),
('Rwanda'),
('Ethipia'),
('Burundi'),
('Congo'),
('Korea'),
('Japan'),
('Ghana'),
('Sudan'),
('Tanzania');

-- ADDRESS
INSERT INTO address(street,city,state,postal_code,country_id)
VALUES('126-Nairobi','Nairobi','loresho',001000,2),
('234-Rwanda','Kigali','Northern-Province',54600,3),
('435-DRC','Congo','Kinshasa',234430,4),
('890-Ethiopia','Gumuz','Gambela',22221000,7),
('678-Ghana','Ahafo','Bono',76500,8),
('234-Tanzania','Zanzibar','Pemba',2344778,1),
('167-USA','Newyork','NY',5689000,5),
('2344-Djibouti','Dikhil','Arta',999908,6),
('569-Uganda','Kampala','Western',233444,9),
('892-Sudan','Blue Nile','Kassala',344449,10);

-- ADDRESS-STATUS
INSERT INTO address_status(status_name)
VALUES('Biling'),
('Shipping'),
('Successful'),
('In-stock'),
('Pending'),
('Limited'),
('Unavailable'),
('Sold-out'),
('Paid'),
('Available');

-- shippping table
INSERT INTO shipping_method(method_name,cost,delivery_time)
VALUES
('bus-parcel',500.00,'2021-05-25 12:25:36'),
('van-parcel',800.23,'2021-05-29, 1:02:02'),
('aeroplane-parcel',4000.25,'2024-04-02 01:58:58'),
('motorbike-parcel',500.65,'2024-06-25 12:08:06'),
('ship-cargo',6500.00,'2024-09-12 07:25:56'),
('bicycle-parcel',621.25,'2024-10-25 01:26:22'),
('door to door delivery',210.00,'2020-02-03 08:02:01'),
('bus-parcel',950.00,'2024-09-25 13:57:36'),
('aeroplane-parcel',4000.25,'2023-04-06 1:52:58'),
('van-parcel',800.23,'2025-07-29, 1:02:52')
;
-- cust_order table
INSERT INTO cust_order(order_date,customer_id,shipping_method_id,total_order,address_id)
VALUES
('2025-04-13',1,21,1200.00,11),
('2025-09-12',9,25,8900.00,19),
('2024-04-05',8,26,5600.00,18),
('2023-06-07',5,29,5789.00,15),
('2023-12-02',4,22,4400.00,14),
('2022-04-03',7,28,9000.00,17),
('2023-04-09',3,27,7800.00,13),
('2022-05-09',2,23,9080.00,12),
('2023-02-03',6,24,9900.00,16),
('2024-08-03',8,30,3200.00,18),
('2022-06-09',10,29,8200.00,20);

-- order_line
INSERT INTO order_line (order_id, book_id, quantity)
VALUES
(100, 1, 500),
(102, 2, 2897), 
(103, 3, 585),
(104, 4, 756),
(105, 5, 5568),
(106, 6, 100),
(107, 7, 50),
(108, 8, 63),
(109, 9, 80),
(110, 10, 700);
-- INSERTDATA INTO THE ORDER_HISTORY TABLE
INSERT INTO order_history(order_id,status_id)
VALUES
(105,8),
(106,7),
(109,10),
(104,1),
(102,3),
(103,6),
(101,9),
(107,4),
(108,2),
(110,5)
;
>>>>>>> 30be3f25234bc62f9a8efaca3fee521493a2a97e
