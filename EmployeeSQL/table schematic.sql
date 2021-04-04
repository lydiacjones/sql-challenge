-- PART 1 Data Engineering

--In case of needing to reset
drop table employees cascade;
drop table departments cascade;
drop table dept_employee cascade;
drop table dept_manager cascade;
drop table salaries cascade;
drop table titles cascade;

-- Create titles
CREATE TABLE titles (
    title_id VARCHAR  UNIQUE,
    title VARCHAR   NOT NULL
);

--Create employees + add title_id FK
CREATE TABLE employees (
    emp_no int not null,
    emp_title_id VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (emp_no)
);
ALTER TABLE employees ADD FOREIGN KEY(emp_title_id) REFERENCES titles(title_id);

--Create departments
CREATE TABLE departments (
    dept_no VARCHAR  NOT NULL,
    dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (dept_no) 
);

--Create department managers + create dept_no and emp_no FK
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL  
);
ALTER TABLE dept_manager ADD FOREIGN KEY(dept_no) REFERENCES departments (dept_no);
ALTER TABLE dept_manager ADD FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

--Create department employees + emp_no and dept_no FK
CREATE TABLE "dept_employee" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);
ALTER TABLE dept_employee ADD FOREIGN KEY(emp_no) REFERENCES employees (emp_no);
ALTER TABLE dept_employee ADD FOREIGN KEY(dept_no) REFERENCES departments (dept_no);

-- Create salaries + emp_no FK
CREATE TABLE salaries (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL
);
ALTER TABLE salaries ADD FOREIGN KEY(emp_no) REFERENCES employees (emp_no);


