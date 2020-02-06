DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


--Creating Tables
CREATE TABLE departments (
  dept_no integer NOT NULL,
  dept_name character varying(45) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no integer NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE dept_manager (
  emp_no integer NOT NULL,
  dept_no integer NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE employees (
  emp_no integer NOT NULL,
  birth_date date DEFAULT ('now'::text)::date NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  gender character varying(45),
  hire_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE titles (
  emp_no integer NOT NULL,
  title character varying(45) NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL
);
-- Adding Primary Keys
ALTER TABLE departments ADD CONSTRAINT pk_departments PRIMARY KEY(dept_no)

ALTER TABLE employees ADD CONSTRAINT pk_employees PRIMARY KEY(emp_no)

--Adding Foreign Keys and Constraints
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)

REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)

REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)

REFERENCES employees(emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)

REFERENCES departments(dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)

REFERENCES employees(emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)

REFERENCES employees(emp_no);

