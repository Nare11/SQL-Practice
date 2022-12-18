use hr;
select * from employees;
select * from countries;
Select * from dependents;
Select * from departments;
select * from jobs;
select * from locations;
select * from regions;

SELECT first_name,
       last_name
  FROM employees
  WHERE salary < (SELECT salary
                    FROM employees
                    WHERE employee_id = 163);
/* 2. Write a query to display the name (first name and last name), salary, department id, job id for those employees
 who works in the same designation as the employee works whose id is 169. */
 
 select first_name,last_name,salary,department_id,job_id from employees where employee_id=169;
 
 SELECT first_name,
       last_name,
       salary,
       department_id,
       job_id
  FROM employees
  WHERE job_id = (SELECT job_id
                    FROM employees
                    WHERE job_id = 16);
                    

SELECT employee_id,
       first_name,
       last_name
  FROM employees
  WHERE salary > (SELECT AVG(salary)
                    FROM employees);                    
 
/* 5. Write a query to display the employee name (first name and last name), employee id and salary of all employees who report to Payam. */

select first_name,last_name,employee_id,salary from employees
where employee_id=(select employee_id from employees where first_name="payam");

SELECT first_name,
       last_name,
       employee_id,
       salary
  FROM employees
  WHERE manager_id = (SELECT employee_id
                        FROM employees
                        WHERE first_name = 'Payam');

/* 6. Write a query to display the department number, name (first name and last name), job_id and department name
 for all employees in the Finance department. */
 
 select department_id,first_name,last_name,job_id from employees
 where department_id = (select department_id from departments where department_name = "Finance");
select * from employees;

select first_name,job_id,salary,avg(salary)
over(partition by first_name) avg
from employees;
SELECT first_name, last_name, salary,
  (salary / SUM(salary) OVER())*100 as percentage
FROM employees;
select first_name, last_name, salary,
	count(*) OVER() total
from employees
where salary>9000;
select job_id,department_id, hire_date, 
	ntile(2) over(order by job_id) total
from employees;

select country_id, country_name,
rank() over(partition by country_name),
dense_rank() over(partition by country_name),
row_number() over(partition by country_name)
from countries;
-- Rank the customers based on the number of films rented using rank & dense rank
select * from film;
select rental_duration,
rank() over(order by rental_duration),
dense_rank() over(order by rental_duration) from film;
