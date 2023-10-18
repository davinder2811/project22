use cdac1;
show tables;
desc employees;
select * from employees;
select * from countries;
select * from county;
select * from departments;
select * from dependents;
select * from dept;
select * from employee;
select * from employees;
select * from location;
select * from locations;
select * from regions;
select * from salgrade;



select date_add(last_day(date_sub(curdate(),interval 3 month)),interval 1 day) AS first_day_of_previous_month;

select last_day(date_sub(curdate(), interval 3 month)) AS last_day_of_previous_month;

select *,dayname(hire_date) from employees where dayname(hire_date) = 'monday';

select makedate(year(curdate()),1) AS first_day_of_current_year;

select date_sub(date_add(makedate(year(curdate()), 1), interval 1 year), interval 1 day) AS last_day_of_current_year;

select date_format(curdate(), '%M %e, %Y') AS formatted_date;

select date_format(curdate(), '%W %M %Y') AS formatted_date;

select year(curdate()) AS current_year;

select from_days(730677);

select first_name, last_name from employees where month(hire_date) = 6;

select first_name,last_name,year('2023-01-03') - year(hire_date) - (date_format('2023-01-03', '%m%d') < date_format(hire_date, '%m%d')) AS age from employees;

select year(hire_date) AS hire_year, count(*) AS num_employees_hire from employees group by hire_year having num_employees_hire > 10;


select job_id, count(*) AS job_count from employees group by job_id;


select sum(salary) AS total_salaries_payable from employees;


select min(salary) AS minimum_salary from employees;


select max_salary  from jobs where job_title='Programmer';


select avg(salary) AS average_salary, count(*) AS number_of_employees from employees where department_id = 9;
 
 select max(salary) AS highest_salary,min(salary) AS lowest_salary,sum(salary) AS total_salary,avg(salary) AS average_salary from employees;
 
 select job_id, count(*) AS num_employees from employees group by job_id;
 
 select max(salary) - min(salary) AS salary_difference from employees;
 
 select manager_id, min(salary) AS lowest_salary from employees group by manager_id;
 
 select round(max(salary)) AS maximum,round(min(salary)) AS minimum,round(sum(salary)) AS sum,round(avg(salary)) AS average from employees;
 
 select job_id, max(salary) AS max_salary,min(salary) AS min_salary,avg(salary) AS avg_salary from employees group by job_id;
 
 select salary,count(*) AS num_people from employees group by salary having count(*) >1;

select count(*) AS "Number of Managers" from employees where manager_id is not null;

select (max(salary) - min(salary)) AS "difference" from employees;

select department_id, min(salary) AS lowest_salary from employees group by department_id having lowest_salary >= 10000 order by lowest_salary desc;

select last_name,hire_date from employees where department_id IN(select distinct department_id from employees);

select employee_id, last_name, salary from employees where salary>(select avg(salary) from employees) order by salary asc;

select employee_id, last_name from employees where department_id IN (select distinct department_id from employees where last_name like '%u%');

 
 
 select department_id, sum(salary) AS total_salary_payable from employees group by department_id;
 
 select job_id, sum(salary) AS total_salary,max(salary) AS max_salary,min(salary) AS min_salary,avg(salary) AS avg_salary from employees where department_id = 9 group by job_id;
 
 select job_id, max(salary) AS max_salary from employees group by job_id having max(salary)>= 4000;
 
 select department_id, avg(salary) AS average_salary from employees group by department_id having count(*) > 5;
 
 select concat(first_name,' ',last_name) AS employee_name from employees where salary>(select salary from employees where employee_id = 206);
 
 select concat(first_name,' ',last_name) AS employee_name,salary,department_id,job_id from employees where job_id=(select job_id from employees where employee_id = 203);
 
 
 select concat(first_name,' ',last_name) AS employee_name,salary,department_id from employees where salary=(select min(salary) from employees);
 
 
 select employee_id, concat(first_name,' ',last_name) AS employee_name from employees where salary>(select avg(salary) from employees);
 
 
 select concat(first_name,' ',last_name) AS employee_name,employee_id,salary from employees where manager_id=(select manager_id from employees where last_name='Pataballa');
 
 select department_id,last_name,job_id from employees where department_id in(select department_id from departments where department_name ='Finance');
 
 
 select * from employees where salary =3000 and manager_id =(select employee_id from employees where employee_id =121);
 
 select * from employees where employee_id in (134,159,183);
 
 select * from employees where salary between 1000 and 3000;
 
 select * from employees where salary >=(select min(salary) from employees) and salary <=5000;
 
 select * from employees where department_id not in(select distinct  department_id from employees where manager_id between 100 and 200);
 
 
 select * from employees where salary =(select max(salary) from employees where salary <(select max(salary) from employees));
 
 select concat(first_name,' ',last_name) AS employee_name,hire_date,department_id from employees where department_id =(select department_id from employees where first_name ='Neena') and first_name <> 'Neena';
 
 
  select employee_id, concat(first_name,' ',last_name) AS employee_name,department_id from employees where department_id in(select distinct department_id from employees where first_name like '%T%');
  
  
  select employee_id, concat(first_name,' ',last_name) AS employee_name,salary from employees where salary>(select avg(salary)from employees) and department_id in(select distinct department_id from employees where first_name like '%J%'); 
  
  
  select concat(first_name,' ',last_name) AS employee_name,job_id from employees where department_id in(select department_id from departments where location_id =(select location_id from locations where city ='Toronto'));
  
  select concat(first_name,' ',last_name) AS employee_name,job_id from employees where salary>(select avg(salary) from employees where department_id =department_id);
  
  
  
 select concat(first_name,' ',last_name) AS employee_name,department_id from employees where exists(select * from employees where salary>3700);
 
 select e.employee_id, e.last_name ,d.department_id ,d.department_name, l.city from employees e inner join departments d on e.department_id = d.department_id INNER JOIN locations l on d.location_id=l.location_id and e.last_name like 'H%';
 
 describe locations;
 describe departments;
 describe employees;
 
 select e.employee_id, e.last_name, e.salary, j.job_title, d.department_name from employees e INNER JOIN jobs j on(e.job_id = j.job_id) INNER JOIN departments d on (e.department_id = d.department_id) and min_salary > 2500;
 
 select job_id, count(*) AS job_count from employees group by job_id;
 
 select sum(salary) AS total_salaries_payable from employees;
 
 select avg(salary) AS average_salary, count(*) AS number_of_employees from employees where department_id = 4;
 
 select department_id, sum(salary) AS total_salary_payable from employees group by department_id;
 
 select department_id,sum(salary),max(salary),min(salary),avg(salary) from employees where department_id =6 group by department_id;
 
 select department_id, avg(salary) AS average_salary from employees group by department_id having count(*) > 5;
 
 select first_name,last_name,salary from employees where salary >(select salary from employees where last_name ='Greenberg');
 
 select first_name,last_name,salary from employees where employee_id in(select manager_id from employees where manager_id is not null);
 
 select first_name,last_name,salary from employees where salary >(select avg(salary) from employees);
 
 select e.first_name,e.last_name,e.salary from employees e where e.salary >(select avg(e2.salary) from employees e2 where e2.department_id in(select department_id from departments where department_name like 'IT%'));
 
 
 select first_name,last_name,job_id,salary from employees where salary > ALL (select salary from employees where job_id ='SH_CLERK') order by salary asc;
 
 
 
 
 
 
 
 
 
 
 


