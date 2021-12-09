-- CHALLENGE 7 DELIVERABLE 1: NUMBER OF RETIRING EMPLOYEES BY TITLE

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no,
	first_name, 
	last_name
FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title,
	from_date,
	to_date
FROM titles;

-- 3. Create a new table using the INTO clause.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
-- 4. Join both tables on the primary key.
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
-- 11. Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no,
	rt.to_date DESC;
	
-- 15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.

-- 16. First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT (title) 
	emp_no,
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY emp_no DESC;

SELECT * FROM unique_titles;

-- CHALLENGE 7 DELIVERABLE 2: EMPLOYEES ELIGIBLE FOR MENTORSHIP PROGRAM

-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no,
	first_name,
	last_name,
	birth_date
FROM employees;

-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date,
	to_date
FROM dept_emp;

-- 3. Retrieve the title column from the Titles table.
-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON(emp_no)
	emp_no,
	title
FROM titles;
--WHERE emp_no = '10095';

-- 5. Create a new table using the INTO clause.
-- 6. Join the Employees and the Department Employee tables on the primary key.
-- 7. Join the Employees and the Titles tables on the primary key.
SELECT DISTINCT ON (ti.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY ti.emp_no;










