-----------------------------------------------------------------------------------------------
-- PART 2 Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, s.salary
FROM employees AS emp
INNER JOIN salaries AS s ON emp.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE emp.hire_date >= '01-01-1986'
AND emp.hire_date <= '12-31-1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT man.dept_no, dept.dept_name, man.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS man
INNER JOIN departments AS dept ON man.dept_no = dept.dept_no
INNER JOIN employees AS emp ON man.emp_no = emp.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN dept_employee AS dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM  employees AS emp
INNER JOIN dept_employee AS dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM  employees AS emp
INNER JOIN dept_employee AS dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' 
OR dept.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) desc;

-----------------------------------------------------------------------------------------------
--BONUS
--PART 4 EPILOGUE
--Evidence in hand, you march into your boss's office and present the visualization. 
--With a sly grin, your boss thanks you for your work. 
--On your way out of the office, you hear the words, "Search your ID number." 
--You look down at your badge to see that your employee ID number is 499942.

SELECT * from employees WHERE emp_no = '499942';


