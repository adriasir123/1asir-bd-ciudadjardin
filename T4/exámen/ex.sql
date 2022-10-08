--Hecho por Adrián Jaramillo Rodríguez
--1
select *
    from departments d
    INNER JOIN locations_l ON d.location_id = l.location_id
    INNER JOIN countries c ON l.country_id = c.country_id
    INNER JOIN regions_r ON c.region_id = r.region_id
    where upper(region_name) in ("AMERICAS", "ASIA") AND department_name LIKE '%S%';

--2
select c.country_id, count(d.department_id)
    from employees e
    INNER JOIN department d ON e.department_id = d.department_id
    INNER JOIN countries c ON l.country_id = c.country_id
    group by d.department_id
    having count(d.department_id) >= 1;


--3
select e.first_name, e.last_name, d.department_id
    from employees e
    INNER JOIN department d ON e.department_id = d.department_id
    where commission_pct = (select min(commission_pct)
                                from employees e1
                                where e1.department_id = d.department_id);

--4
select d.department_name
    from departments d
    INNER JOIN employees e ON e.department_id = d.department_id
    where salary > (select min(commission_pct)
                                from employees e1
                                where e1.department_id = d.department_id);

--5
select e.first_name, e.last_name, d.department_id
    from employees e
    INNER JOIN department d ON e.department_id = d.department_id
    where job_id IN (select job_id
                      from employees e1 
                      where e1.job_id = e.job_id AND );


--6
select e.first_name, e.last_name, c.country_name
    from employees e
    INNER JOIN department d ON e.department_id = d.department_id
    INNER JOIN countries c ON l.country_id = c.country_id
    where salary = (select max(salary)
                      from employees);
