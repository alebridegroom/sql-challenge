select * from departments;
select * from titles;
select * from employees;
select * from salaries;
select * from dept_manager;
select * from dept_emp;

-- 1. List the employee number, last name, first name, sex, and 
--salary of each employee.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
left join salaries as s on
e.emp_no = s.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date between '01-01-1986'and '12-31-1986'
order by hire_date;

-- 3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
select  d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
from employees as e
join dept_manager as d_m
on e.emp_no = d_m.emp_no
join departments as d
on d_m.dept_no = d.dept_no;

-- 4. List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.
select d_e.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
left join dept_emp as d_e
on e.emp_no = d_e.emp_no
left join departments as d
on d.dept_no = d_e.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.
select e.first_name, e.last_name, e.sex
from employees as e 
where  e.first_name = 'Hercules' and 
e.last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, 
--last name, and first name.
select e.emp_no, e.last_name, e.first_name
from employees as e
join dept_emp as d_e
on d_e.emp_no = e.emp_no
where d_e.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as d_e
on d_e.emp_no = e.emp_no
join departments as d
on d.dept_no = d_e.dept_no
where d_e.dept_no = 'd007'or
d_e.dept_no = 'd005';

-- 8. List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;



