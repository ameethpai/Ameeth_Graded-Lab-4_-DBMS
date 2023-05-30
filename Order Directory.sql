Create database order_directory;
use order_directory;
CREATE TABLE supplier 
(
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
    (1, 'Rajesh Retails', 'Delhi', '1234567890'),
    (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
    (3, 'Knome products', 'Banglore', '9785462315'),
    (4, 'Bansal Retails', 'Kochi', '8975463285'),
    (5, 'Mittal Ltd.', 'Lucknow', '7898456532');
CREATE TABLE customer 
(
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
VALUES
    (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
    (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');
CREATE TABLE category 
(
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES
    (1, 'BOOKS'),
    (2, 'GAMES'),
    (3, 'GROCERIES'),
    (4, 'ELECTRONICS'),
    (5, 'CLOTHES');
CREATE TABLE product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
    (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
    (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
    (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
    (6, 'MILK', '1L Toned MIlk', 3),
    (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
    (9, 'Project IGI', 'compatible with windows 7 and above', 2),
    (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);
CREATE TABLE supplier_pricing 
(
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES
    (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000),
    (6, 12, 2, 780),
    (7, 12, 4, 789),
    (8, 3, 1, 31000),
    (9, 1, 5, 1450),
    (10, 4, 2, 999),
    (11, 7, 3, 549),
    (12, 7, 4, 529),
    (13, 6, 2, 105),
    (14, 6, 1, 99),
    (15, 2, 5, 2999),
    (16, 5, 2, 2999);
CREATE TABLE ORders (
  ORD_ID INT PRIMARY KEY,
  ORD_AMOUNT INT NOT NULL,
  ORD_DATE DATE NOT NULL,
  CUS_ID INT,
  PRICING_ID INT,
  FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID)
);
INSERT INTO ORders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);
CREATE TABLE rating (
  RAT_ID INT PRIMARY KEY,
  ORD_ID INT,
  RAT_RATSTARS INT NOT NULL,
  FOREIGN KEY (ORD_ID) REFERENCES Orders (ORD_ID)
);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES
  (1, 101, 4),
  (2, 102, 3),
  (3, 103, 1),
  (4, 104, 2),
  (5, 105, 4),
  (6, 106, 3),
  (7, 107, 4),
  (8, 108, 4),
  (9, 109, 3),
  (10, 110, 5),
  (11, 111, 3),
  (12, 112, 4),
  (13, 113, 2),
  (14, 114, 1),
  (15, 115, 1),
  (16, 116, 0);
/*4.display the total number of customers based on gender who have placed individual orders worth at least Rs. 30008*/
SELECT c.CUS_GENDER, COUNT(DISTINCT c.CUS_ID) AS Total_Customers
FROM customer c
JOIN orders o ON c.CUS_ID = o.CUS_ID
WHERE o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;
/*5.display all the orders along with the product name ordered by a customer with Customer_Id = 2*/
SELECT o.ORD_ID, p.PRO_NAME
FROM orders o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;
/*6.display the supplier details who can supply more than one product*/
SELECT s.*
FROM supplier s
JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID
HAVING COUNT(DISTINCT sp.PRO_ID) > 1;
/*7.Find the least expensive product from each category and print the table with category id, name, product name and price of the product*/
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN (
    SELECT MIN(SUPP_PRICE) AS min_price, PRO_ID
    FROM supplier_pricing
    GROUP BY PRO_ID
) sub ON sp.PRO_ID = sub.PRO_ID AND sp.SUPP_PRICE = sub.min_price;
/*8.Display the Id and Name of the Product ordered after “2021-10-05”.*/
SELECT p.PRO_ID, p.PRO_NAME
FROM product p
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
WHERE o.ORD_DATE > '2021-10-05';
/*9.Display customer name and gender whose names start or end with character 'A'.*/
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
/*10.Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.*/
CREATE PROCEDURE GetSupplierDetails()
SELECT s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS Rating,
    CASE
        WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
        WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
        WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM supplier s
JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
JOIN rating r ON o.ORD_ID = r.ORD_ID
GROUP BY s.SUPP_ID;










