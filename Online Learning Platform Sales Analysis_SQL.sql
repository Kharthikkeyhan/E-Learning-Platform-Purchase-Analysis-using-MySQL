CREATE DATABASE Learning_Platform;
use Learning_Platform;

-- Learner Table
Create Table Learners
(
   learner_id INT PRIMARY KEY AUTO_INCREMENT,
   full_name VARCHAR(100) NOT NULL,
   country VARCHAR(50) NOT NULL
   );
   
   -- Courses Table
   CREATE TABLE Courses
   (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
	course_name VARCHAR(200) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2)
	);
    -- Table: purchases
    CREATE TABLE Purchases
    (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    learner_id INT,
    course_id INT,
    qunatity INT NOT NULL,
    purchase_date DATE DEFAULT (CURDATE()),
    FOREIGN KEY( learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY( course_id) REFERENCES courses(course_id)
    );
     ALTER TABLE Purchases
    RENAME COLUMN qunatity to Quantity;
    -- INSERT
    INSERT INTO Learners( learner_id, full_name, country)
    Values ( '1001','Arun Kumar','India');
      INSERT INTO Learners( full_name, country)
    Values ( 'Bills Gates','United States of America'),
    ('Timothy Werth','Germany'),
    ('David Smith','Switzerland'),
    ('Alexandru Cirnaru','Romonia');
    Select * from Learners;

INSERT INTO Courses( course_id,course_name,category,unit_price)
Values ('101','Power BI Dashboard Design', 'Business Intelligence', 5500);
INSERT INTO Courses( course_name,category,unit_price)
values('Deep Learning Fundamentals', 'Artificial Intelligence',7599.99),
('Google Cloud Fundamentals', 'Cloud Technology', 9999.99),
('Data Warehousing Concepts', 'Database', 8500),
('Robotic Process Automation', 'Automation', 12500),
('SAP FICO Training', 'ERP', 4999.99);
Select * from Courses;

INSERT INTO Purchases (learner_id, course_id, qunatity, purchase_date)
VALUES
(1001, 101, 1, '2026-05-01'),
(1002, 103, 2, '2026-05-03'),
(1003, 102, 1, '2026-05-05'),
(1004, 105, 3, '2026-05-07'),
(1005, 104, 2, '2026-05-10');
   select * from purchases;
-- TASK 2 Join ----  INNER JOIN — only learners who have made at least one purchase
-- --  INNER JOIN — only learners who have made at least one purchase
SELECT
L.learner_id,
L.full_name as Learner_Name,
L.country,
C.course_name as Course_Name,
C.category as Course_Category,
P.quantity,
FORMAT( P.quantity * C.unit_price, 2) as Total_Amount,
P.purchase_date
from Purchases P
JOIN Learners L on P.learner_id = L.learner_id
JOIN Courses C on P.Course_id = C.Course_id
ORDER BY Learner_name, purchase_date;

-- 

SELECT
L.full_name as Learner_Name,
C.course_name as Course_Name,
C.category as Course_Category,
P.quantity,
FORMAT( P.quantity * C.unit_price, 2) as Total_Amount,
P.purchase_date
from Learners L
LEFT JOIN Purchases P on P.learner_id = L.learner_id
LEFT JOIN Courses C on P.Course_id = C.Course_id
ORDER BY Learner_name, purchase_date;

-- --  RIGHT JOIN — all courses, including those never purchased
SELECT
L.full_name as Learner_Name,
C.course_name as Course_Name,
C.category as Course_Category,
P.quantity,
FORMAT( P.quantity * C.unit_price, 2) as Total_Amount,
P.purchase_date
from Purchases P
RIGHT JOIN Courses C on P.Course_id = C.Course_id
RIGHT JOIN Learners L on P.learner_id = L.learner_id
ORDER BY Learner_name, Course_Name ;

-- 3. Analytical Queries
-- Q1. Display each learner’s total spending (quantity × unit_price) along with their country.
Select
L.learner_id,
L.full_name as Learner_Name,
L.Country,SUM(P.quantity * C.unit_price) as Total_Spent
FROM Purchases P
JOIN Learners L on P.Learner_id = L.Learner_id
JOIN Courses C on P.Course_id = C.Course_id
GROUP BY L.learner_id,Learner_Name,L.country
ORDER BY Total_Spent DESC;


-- Q2. Find the top 3 most purchased courses based on total quantity sold --

SELECT
C.Course_id,
C.Course_name,
C.Category AS Course_Category,
SUM(P.Quantity) AS Total_Quantity_Sold
FROM Purchases P
JOIN Courses C on P.course_id = C.course_id
GROUP BY C.Course_id,C.Course_name,Course_Category
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;

-- Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category.
SELECT
C.Category AS Course_Category,
SUM(P.quantity * C.unit_price) as Total_Revenue,
COUNT(DISTINCT P.Learner_id) as Unique_learners
FROM Purchases P
JOIN Courses C ON P.course_id = C.course_id
GROUP BY Course_Category
ORDER BY Total_Revenue Desc;

-- Q4. List all learners who have purchased courses from more than one category.

SELECT
L.full_name as Learner_Name,
count( distinct C.Category) AS Purchased_category
FROM Purchases P
JOIN Learners L on P.learner_id = L.Learner_id
JOIN Courses C on P.course_id = C.course_id
GROUP BY Learner_Name
HAVING COUNT(distinct C.Category)>1;

-- Q5. Identify courses that have not been purchased at all.

SELECT
C.Course_id,
C.Course_name,
C.Category AS Course_Category,
P.Purchase_id
From Courses C
LEFT JOIN Purchases P ON P.course_id = C.course_id
where P.Purchase_id is null;

