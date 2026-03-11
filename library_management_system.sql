use `library_management_system`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS return_status;
DROP TABLE IF EXISTS issued_status;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS branch;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE branch
(
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(100),
    contact_no VARCHAR(15)
) ENGINE=InnoDB;

CREATE TABLE employees
(
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),
    position VARCHAR(20),
    salary INT,
    branch_id VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE books
(
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(80),
    category VARCHAR(30),
    rental_price FLOAT,
    status VARCHAR(10),
    author VARCHAR(40),
    publisher VARCHAR(55)
) ENGINE=InnoDB;

CREATE TABLE members
(
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(50),
    member_address VARCHAR(85),
    reg_date DATE
) ENGINE=InnoDB;

CREATE TABLE issued_status
(
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(75),
    issued_date DATE,
    issued_book_isbn VARCHAR(20),
    issued_emp_id VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE return_status
(
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(20)
) ENGINE=InnoDB;

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM issued_status;
SELECT * FROM return_status;

-- books available for rent --

select book_title, category, rental_price
from books
where status = 'yes';

-- recent customer growth --
SELECT member_id, member_name, reg_date
FROM members
WHERE YEAR(reg_date) > 2021;

-- staff distribution --
select emp_name, position, branch_id
from employees;

-- library inventory distribution --
select category, count(*) as total_books
from books
group by category;

-- top 10 highest priced rentals --
select book_title, rental_price
from books
order by 2 desc
limit 10;

-- borrowed book and member name --

SELECT 
    i.issued_id,
    m.member_name,
    i.issued_book_name,
    i.issued_date
FROM issued_status i
JOIN members m
ON i.issued_member_id = m.member_id;

-- most active members i.e. no of books borrowed per member --
select
	issued_member_id,
    count(*) as books_borrowed
from issued_status
group by issued_member_id
order by books_borrowed desc;

-- library income from rentals --

SELECT SUM(b.rental_price) AS total_revenue
FROM issued_status i
JOIN books b
ON i.issued_book_isbn = b.isbn;

-- most borrowed books --

SELECT 
    issued_book_name,
    COUNT(*) AS borrow_count
FROM issued_status
GROUP BY issued_book_name
ORDER BY borrow_count DESC
LIMIT 10;

-- end of project --