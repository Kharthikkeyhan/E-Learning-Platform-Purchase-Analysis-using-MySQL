# 📊 E-Learning Platform Purchase Analysis using MySQL

## 📌 Project Overview
This project analyzes purchase data from an online e-learning platform using MySQL.  
The database contains information about learners, courses, and purchase transactions.

The main goal of this project is to:
- Analyze learner purchasing behavior
- Identify top-performing courses
- Calculate revenue by category
- Perform SQL-based business analysis using joins and aggregation

---

# 🛠️ Technologies Used
- MySQL Workbench
---

# 🗂️ Database Schema

## 1️⃣ learners Table

| Column Name | Data Type |
|---|---|
| learner_id | INT (Primary Key) |
| full_name | VARCHAR(100) |
| country | VARCHAR(50) |

---

## 2️⃣ courses Table

| Column Name | Data Type |
|---|---|
| course_id | INT (Primary Key) |
| course_name | VARCHAR(100) |
| category | VARCHAR(50) |
| unit_price | DECIMAL(10,2) |

---

## 3️⃣ purchases Table

| Column Name | Data Type |
|---|---|
| purchase_id | INT (Primary Key) |
| learner_id | INT (Foreign Key) |
| course_id | INT (Foreign Key) |
| quantity | INT |
| purchase_date | DATE |

---

# 📥 Sample Data Included
- 5 Learners
- 6 Courses
- 8 Purchase Records

---

# 🔍 SQL Concepts Used
- CREATE DATABASE
- CREATE TABLE
- INSERT INTO
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- Aggregate Functions
- Revenue Calculations

---

# 📊 Analytical Queries

## Q1. Total Spending by Each Learner
- Calculates learner-wise spending
- Uses SUM(quantity × unit_price)

## Q2. Top 3 Most Purchased Courses
- Identifies best-selling courses

## Q3. Category Revenue Analysis
- Calculates total revenue by category
- Counts unique learners

## Q4. Learners Purchasing Multiple Categories
- Uses HAVING COUNT(DISTINCT category)

## Q5. Courses Not Purchased
- Identifies courses with zero sales

---

# 📈 Key Insights
- Automation courses generated the highest revenue.
- Cloud Technology showed strong multi-unit purchases.
- Some courses received no purchases.
- Most learners purchased from only one category.
- Premium technical courses contributed major revenue.

---

# 💡 Recommendations
- Focus marketing on top-performing categories.
- Introduce bundled course offers.
- Improve visibility for low-performing courses.
- Provide personalized recommendations.
- Offer discounts for bulk purchases.

---


├── Learning_Platform_Report.pdf
├── README.md
└── screenshots/
