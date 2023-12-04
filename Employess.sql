1.Display details of jobs where the minimum salary is greater than 10000?.

select * from jobs where min_salary > 10000;

2.Display the first name and join date of the employees who joined between 2002 and 2005?

select first_name, hire_date from employees where to_char(hire_date, 'yyyy') between 2002 and 2005;

3.Display first name and join date of the employees who is either IT Programmer or Sales Man.

select first_name, hire_date, job_id from employees 
where job_id in ('IT_PROG', 'SA_MAN');

4. Display employees who joined after 1st January 2008.

select * from employees where hire_date > '01-jan-2008';


5. Display details of employee with ID 150 or 160.

select * from employees where department_ID in(150,160);

6. Display first name, salary, commission pct, and hire date for employees with salary less than 10000.
select first_name, salary, commission_pct, hire_date from employees where salary < 10000;

7. Display job Title, the difference between minimum and maximum salaries for jobs with max salary in the range 10000 to 20000.
SELECT 
    job_title,
    max_salary - min_salary AS salary_difference
FROM 
    jobs
WHERE 
    max_salary BETWEEN 10000 AND 20000;
    
8. Display first name, salary, and round the salary to thousands.

select first_name, salary, round(salary, 3) as rounded_salary from employees;

9. Display details of jobs in the descending order of the title.
SELECT 
    job_id,
    job_title,
    min_salary,
    max_salary
FROM 
    jobs
ORDER BY 
    job_title DESC;

10. Display employees where the first name or last name starts with S

SELECT 
    employee_id,
    first_name,
    last_name
FROM 
    employees
WHERE 
    first_name LIKE 'S%' OR last_name LIKE 'S%';
    
11. Display employees who joined in the month of May.
select * from employees where to_char( hire_date, 'MON')= 'MAY';

12. Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department is 30.

select * from employees where commission_pct is null and salary between 5000 and 10000 and department_id = 30;

13. Display first name and date of first salary of the employees.

SELECT FIRST_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE)+1 FROM EMPLOYEES;

14. Display first name and experience of the employees.

select first_name, sysdate, hire_date, round((sysdate - hire_date)/365) as experience from employees;   


15. Display first name of employees who joined in 2001.

select * from employees where to_char( hire_date, 'YYYY') = 2001;

16. Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.

SELECT INITCAP(first_name) AS formatted_first_name,
       INITCAP(last_name) AS formatted_last_name
FROM employees ;


17. Display the first word in job title.

select job_title, substr(job_title, 1, instr(job_title, ' ') -1) from jobs;

18. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.

select last_name, length(first_name) as first_name_length, instr(last_name, 'b') from employees where instr(last_name, 'b')>3; 



19. Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.

SELECT first_name, UPPER(first_name) AS upper_case_first_name, email, UPPER(email) AS upper_case_email
FROM employees
WHERE upper(first_name) = upper(email)


20. Display employees who joined in the current year.

SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE, 'YYYY');

21. Display the number of days between system date and 1st January 2011.

SELECT (trunc(SYSDATE) - to_date('01-JAN-2011')) no_days FROM DUAL;



22. Display how many employees joined in each month of the current year.

SELECT TO_CHAR(HIRE_DATE,'MON') month, COUNT (*) FROM EMPLOYEES 
 where TO_CHAR(HIRE_DATE,'YYYY')= TO_CHAR(SYSDATE,'YYYY') GROUP BY TO_CHAR(HIRE_DATE,'MON');

23. Display manager ID and number of employees managed by the manager.

select e.manager_id, count(employee_id) as emp_cnt from employees e group by manager_id;

select * from employees

24. Display employee ID and the date on which he ended his previous job.

SELECT EMPLOYEE_ID, MAX(END_DATE) FROM JOB_HISTORY GROUP BY EMPLOYEE_ID;

25. Display number of employees joined after 15th of the month.

SELECT COUNT(employee_id) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'DD') > 15;

26. Display the country ID and number of cities we have in the country.

select c.country_id, count(l.city) from countries c
join locations l on l.country_id = c.country_id group by c.country_id;

27. Display average salary of employees in each department who have commission percentage.

SELECT department_id, AVG(salary) AS average_salary
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

28. Display job ID, number of employees, sum of salary, and difference between highest salary and lowest salary of the employees of the job.

SELECT 
    job_id,
    COUNT(employee_id) AS num_employees,
    SUM(salary) AS total_salary,
    MAX(salary) - MIN(salary) AS salary_range
FROM 
    employees
GROUP BY 
    job_id;


29. Display job ID for jobs with average salary more than 10000.

SELECT 
    job_id, AVG(salary) as AVG_SALARY
FROM 
    employees
GROUP BY 
    job_id
HAVING 
    AVG(salary) > 10000;


30. Display years in which more than 10 employees joined.
    
SELECT TO_CHAR(HIRE_DATE,'YYYY') joined_year, COUNT(EMPLOYEE_ID) as count_of_emp FROM EMPLOYEES 
GROUP BY TO_CHAR(HIRE_DATE,'YYYY') 
HAVING COUNT(EMPLOYEE_ID) > 10 ;   
    
