-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees2
WHERE EXTRACT(YEAR FROM "hire_date") = 1986
ORDER BY hire_date;
-- ORDER BY hire_date DESC;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
FROM dept_manager AS dm
LEFT JOIN employees AS e ON
dm.emp_no = e.emp_no
LEFT JOIN departments AS d ON
dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

-- DROP VIEW emp_dept_name

CREATE VIEW emp_dept_name AS
SELECT de.emp_no, de.dept_no, d.dept_name, de.from_date, de.to_date
FROM dept_emp AS de
LEFT JOIN departments AS d ON
de.dept_no = d.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, edn.dept_name, edn.from_date, edn.to_date
FROM employees AS e
LEFT JOIN emp_dept_name AS edn ON
e.emp_no = edn.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_Name, e.first_name, edn.dept_name, edn.from_date, edn.to_date
FROM employees AS e
LEFT JOIN emp_dept_name AS edn ON
e.emp_no = edn.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_Name, e.first_name, edn.dept_name, edn.from_date, edn.to_date
FROM employees AS e
LEFT JOIN emp_dept_name AS edn ON
e.emp_no = edn.emp_no
WHERE edn.dept_name = 'Sales' OR edn.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "count_last_name"
FROM employees
GROUP BY last_name
ORDER BY count_last_name DESC;