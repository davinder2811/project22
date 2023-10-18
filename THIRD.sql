use cdac1;

show tables;
select d.location_id,l.street_address,l.city,l.state_province,c.country_name from departments AS d JOIN locations AS l on d.location_id =l.location_id JOIN countries AS c on l.country_id =c.country_id;


select e.first_name,e.last_name,e.department_id,d.department_name from employees e JOIN departments d on e.department_id =d.department_id;

select e.first_name,e.last_name,e.job_id,d.department_id,d.department_name from employees e JOIN departments d on e.department_id =d.department_id JOIN locations l on d.location_id =l.location_id where l.city ='London';


select e1.employee_id,e1.last_name,e1.manager_id,e2.last_name from employees e1 LEFT JOIN employees e2 on e1.manager_id =e2.employee_id;


select e1.first_name,e1.hire_date from employees e1 JOIN employees e2 on e1.hire_date >e2.hire_date where e2.first_name ='John';

select d.department_name,count(e.employee_id) AS num_employees from departments d LEFT JOIN employees e on d.department_id =e.department_id group by d.department_name;


select e.employee_id,j.job_title,datediff(curdate(), e.hire_date) AS days_on_job from employees e JOIN jobs j on e.job_id = j.job_id where e.department_id =9;

select d.department_id,d.department_name,e.first_name AS manager_first_name from departments d JOIN employees e on d.department_id =e.department_id;

select job_title,avg(salary) AS average_salary from employees JOIN jobs on employees.job_id =jobs.job_id group by job_title;

select j.job_title,concat(e.first_name,'',e.last_name) AS employee_name,(e.salary - j.min_salary) AS salary_difference from employees e JOIN jobs j on e.job_id =j.job_id;

select e.employee_id,e.first_name,e.last_name,e.salary,j.job_title from employees e JOIN jobs j on e.job_id = j.job_id where e.salary >10000;

select d.department_name,concat(e.first_name,'',e.last_name) AS manager_name,l.city from departments d JOIN employees e on d.department_id =e.department_id JOIN locations l on d. location_id =l.location_id;


select e.first_name,e.last_name,e.hire_date,e.salary,(datediff(now(), e.hire_date))/365'Experinced',d.department_name from employees e JOIN departments d on (d.department_id =e.department_id) JOIN employees m on(m.employee_id =e.manager_id) where (datediff(now(),e.hire_date))/365>15;

CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4, 2)
);

INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5003, 'Lauson Hen', 'San Jose', 0.12),
       (5007, 'Paul Adam', 'Rome', 0.13);
       
       CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(8, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES 
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES 
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

select * from customer;
select * from orders;
select * from salesman;


select o.ord_no, o.purch_amt, o.ord_date, o.customer_id from orders o JOIN salesman s on o.salesman_id = s.salesman_id where s.name = 'Paul Adam';

select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id from orders o JOIN salesman s on o.salesman_id = s.salesman_id where s.city ='New York';

select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id from orders o JOIN customer c on o.customer_id = c.customer_id JOIN salesman s on o.salesman_id = s.salesman_id where c.customer_id = 3007;


select ord_no, purch_amt, ord_date, customer_id, salesman_id from orders where purch_amt >(select avg(purch_amt) from orders where ord_date = '2012-10-10');


select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id from orders o JOIN salesman s on o.salesman_id = s.salesman_id where s.city ='New York';


select s.salesman_id, s.name, s.city, s.commission from salesman s JOIN customer c on s.salesman_id = c.salesman_id where c.city = 'Paris';


select c.customer_id, c.cust_name, c.city, c.grade from customer c JOIN salesman s on c.salesman_id = s.salesman_id where c.customer_id < 3005 AND s.name ='Mc Lyon';

select count(*) AS num_customers from customer where grade >(select avg(grade) from customer where city ='New York');

select c.customer_id, c.cust_name, c.city, c.grade from customer c JOIN orders o on c.customer_id = o.customer_id where o.ord_date ='2012-10-05';

select c.customer_id, c.cust_name, c.city, c.grade from customer c JOIN orders o on c.customer_id = o.customer_id where o.ord_date ='2012-08-17';

select s.salesman_id, s.name, count(c.customer_id) AS num_customer from salesman s LEFT JOIN customer c on s.salesman_id = c.salesman_id group by s.salesman_id, s.name having count(c.customer_id)>1;

select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id from orders o JOIN customer c on o.customer_id =c.customer_id where o.purch_amt >(select avg (o2.purch_amt) from orders o2 where o2.customer_id =o.customer_id);


select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id from orders o JOIN customer c on o.customer_id =c.customer_id where o.purch_amt >= (select avg (o2.purch_amt) from orders o2 where o2.customer_id =o.customer_id);


select ord_date, sum(purch_amt) AS total_amount from orders group by ord_date having sum(purch_amt) > ALL (select max(purch_amt) + 1000.00 from orders o2 where o2.ord_date = orders.ord_date);

select * from customer where city = 'London';

select salesman_id, count(customer_id) AS num_customer from customer group by salesman_id having count(customer_id) >1;

select salesman_id from customer group by salesman_id having count(customer_id) =1;

select s.salesman_id, s.name, s.city, s.commission from salesman s JOIN customer c on s.salesman_id = c.salesman_id JOIN orders o on c.customer_id = o.customer_id group by s.salesman_id, s.name, s.city, s.commission having count(o.ord_no) > 1;


select s.salesman_id, s.name, s.city, s.commission from salesman s JOIN customer c on s.city = c.city;





















