# Library Management System - SQL Project

## Project Overview
This project involves the design and analysis of a relational database for a local library. The goal is to establish a robust system for tracking books, members, employees, and rental transactions, while also demonstrating how to extract actionable insights from the data using SQL. 

## Objectives
* **Database Design:** Create a normalized database schema with appropriate data types and primary/foreign key constraints.
* **Data Analysis:** Write SQL queries to analyze library operations, including inventory distribution, member activity, and revenue generation.

## Schema Diagram

The database consists of six interconnected tables:
* **`branch`**: Stores library branch details and manager information.
* **`employees`**: Tracks staff details, roles, and branch assignments.
* **`books`**: Contains the library's inventory, including pricing, categories, and availability status.
* **`members`**: Holds registered member information and registration dates.
* **`issued_status`**: Logs book rental transactions, linking members, books, and employees.
* **`return_status`**: Tracks the return of issued books.

## Key Insights & SQL Queries
This project includes several exploratory data analysis (EDA) queries to answer business questions:

* **Inventory Management:** Grouping books by category to understand the distribution of the library's collection.
* **Customer Growth:** Identifying new members who registered after a specific year.
* **Member Activity:** Finding the most active members based on the total number of books borrowed.
* **Revenue Tracking:** Calculating the total income generated from book rentals using `JOIN` and `SUM()` functions.
* **Popularity Metrics:** Identifying the top 10 most frequently borrowed books.

## Technologies Used
* **Database:** MySQL workbench
* **Language:** SQL (DDL, DML, DQL)

## How to Use
1. Clone the repository to your local machine.
2. Open your preferred SQL client (e.g., MySQL Workbench, DBeaver).
3. Run the `library_management_system.sql` script to create the database, build the tables, and establish the relationships.
4. *(Optional)* Insert mock data into the tables to test the analytical queries at the bottom of the script.
