CREATE DATABASE IF NOT EXISTS business_analytics;
USE business_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(80),
    segment VARCHAR(40)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(60),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Aarav','Delhi','Regular'),
(2,'Diya','Jaipur','Premium'),
(3,'Kabir','Lucknow','Regular'),
(4,'Anaya','Bareilly','Premium'),
(5,'Riya','Delhi','Regular'),
(6,'Arjun','Noida','Premium'),
(7,'Meera','Lucknow','Regular'),
(8,'Sara','Jaipur','Regular');

INSERT INTO products VALUES
(101,'Wireless Mouse','Electronics',799),
(102,'Keyboard','Electronics',1499),
(103,'Notebook','Stationery',120),
(104,'Desk Lamp','Home',899),
(105,'Backpack','Accessories',1299),
(106,'Headphones','Electronics',1999);

INSERT INTO orders VALUES
(1001,'2026-01-03',1,101,2,'UPI'),
(1002,'2026-01-05',2,103,4,'Card'),
(1003,'2026-01-09',3,102,1,'UPI'),
(1004,'2026-01-12',4,104,2,'Card'),
(1005,'2026-01-18',5,105,1,'UPI'),
(1006,'2026-02-02',6,106,2,'Card'),
(1007,'2026-02-07',7,103,6,'UPI'),
(1008,'2026-02-14',8,104,3,'Cash'),
(1009,'2026-02-20',1,102,2,'UPI'),
(1010,'2026-02-27',2,105,2,'Card'),
(1011,'2026-03-03',3,106,1,'UPI'),
(1012,'2026-03-06',4,104,3,'Card'),
(1013,'2026-03-11',5,103,5,'UPI'),
(1014,'2026-03-18',6,101,3,'UPI'),
(1015,'2026-03-24',7,104,4,'Cash'),
(1016,'2026-04-02',8,102,1,'Card'),
(1017,'2026-04-08',1,105,3,'UPI'),
(1018,'2026-04-15',2,106,2,'Card'),
(1019,'2026-04-21',3,103,8,'UPI'),
(1020,'2026-04-28',4,104,2,'Card');
