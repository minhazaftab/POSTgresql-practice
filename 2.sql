CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50),
    pincode VARCHAR(10)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_cost DECIMAL(10, 2),
    order_customer_id INT,
    FOREIGN KEY (order_customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, name, email, phone, city, pincode) VALUES
(1, 'Aarav', 'aarav@example.com', '1234567890', 'Hyderabad', '500001'),
(2, 'Vivaan', 'vivaan@example.com', '1234567891', 'Mumbai', '400001'),
(3, 'Aditya', 'aditya@example.com', '1234567892', 'Chennai', '600001'),
(4, 'Rohan', 'rohan@example.com', '1234567893', 'Hyderabad', '500002'),
(5, 'Isha', 'isha@example.com', '1234567894', 'Pune', '411001'),
(6, 'Kiran', 'kiran@example.com', '1234567895', 'Chennai', '600002'),
(7, 'Neha', 'neha@example.com', '1234567896', 'Delhi', '110001'),
(8, 'Tanvi', 'tanvi@example.com', '1234567897', 'Mumbai', '400002');


INSERT INTO orders (order_id, order_date, order_cost, order_customer_id) VALUES
(1, '2024-01-01', 1500.00, 1),
(2, '2024-01-02', 2000.00, 2),
(3, '2024-01-03', 3000.00, 3),
(4, '2024-01-04', 5000.00, 4),
(5, '2024-01-05', 1200.00, 5),
(6, '2024-01-06', 7000.00, 6),
(7, '2024-01-07', 4000.00, 7),
(8, '2024-01-08', 2500.00, 8),
(9, '2024-01-09', 3500.00, 1),
(10, '2024-01-10', 1000.00, 2),
(11, '2024-01-11', 8000.00, 3),
(12, '2024-01-12', 6000.00, 4);

SELECT * FROM customers WHERE city = 'Hyderabad';

SELECT city, COUNT(*) AS customer_count FROM customers GROUP BY city;

SELECT * FROM orders WHERE order_cost = (SELECT MAX(order_cost) FROM orders);

SELECT order_date, COUNT(*) AS order_count FROM orders GROUP BY order_date;

SELECT city, COUNT(*) AS customer_count FROM customers GROUP BY city ORDER BY customer_count DESC LIMIT 1;

SELECT city, COUNT(*) AS customer_count 
FROM customers 
GROUP BY city 
ORDER BY customer_count DESC 
LIMIT 1 OFFSET 1;

SELECT DISTINCT order_cost 
FROM orders 
ORDER BY order_cost ASC 
LIMIT 1 OFFSET 1;

SELECT * FROM orders 
WHERE order_customer_id IN (SELECT id FROM customers WHERE city = 'Chennai') 
ORDER BY order_cost DESC 
LIMIT 1;

SELECT * FROM customers 
WHERE id IN (SELECT order_customer_id FROM orders WHERE order_cost > 20000);

SELECT * FROM orders 
ORDER BY order_id 
LIMIT 4 OFFSET 6;

