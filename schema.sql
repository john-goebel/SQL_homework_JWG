-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS titles;
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS dept_emp;
	
CREATE TABLE departments (
	dept_no VARCHAR(4),
	dept_name VARCHAR(255),
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INTEGER,
	birth_date VARCHAR(10),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	gender VARCHAR(1),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no)
);


CREATE TABLE titles (
	emp_no INTEGER,
	title VARCHAR(255),
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no, title, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(5),
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	emp_no INTEGER,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

