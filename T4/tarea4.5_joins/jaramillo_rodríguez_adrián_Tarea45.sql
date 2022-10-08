1. Nombre de empleado y nombre de departamento de los empleados que superan la media de sueldo del departamento al que pertenecen.

select e.first_name, e.last_name, d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where e.salary > (select avg(e1.salary)
                        from employees e1
                        where e1.department_id = d.department_id);

2. Nombre del empleado, y del departamento al que pertenece, que tiene la comisión más alta.

select e.first_name, e.last_name, d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where commission_pct = (select max(commission_pct)
                                from employees);

3. Empleados, y departamentos al que pertenecen, con sueldos superiores a la media total de la empresa.

select e.employee_id, d.department_id
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where salary > (select avg(salary)
                        from employees);

4. Sueldo, nombre del empleado y nombre del departamento de los empleados con una antigüedad superior al empleado 107.

select e.first_name, e.last_name, e.salary, d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where hire_date < (select hire_date
                        from employees
                        where employee_id = 107);


5. Empleados que, en cada departamento, tienen el sueldo máximo.

select d.department_name, e.employee_id
from employees e INNER JOIN departments d ON e.department_id = d.department_id
where e.salary = (select max(e1.salary) 
                  from employees e1
                  where e1.department_id = d.department_id);


6. Empleados que trabajen en departamentos que están en Seattle o Southlake.

select e.employee_id
    from employees e INNER JOIN departments d ON e.department_id = d.department_id
                     INNER JOIN locations l ON d.location_id = l.location_id
    where upper(city) IN ('SEATTLE', 'SOUTHLAKE');

7. De aquellos empleados de la empresa que tengan un sueldo superior al sueldo máximo del departamento de ventas (department_id 80)
queremos saber su sueldo, su nombre y el departamento al que pertenecen.

select e.first_name, e.last_name, e.salary, d.department_id, d.department_name 
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where salary > (select max(salary)
                        from employees
                        where department_id = 80);

8. Empleados que trabajen en departamentos en los que nadie cobre comisiones.

select e.employee_id, d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where e.department_id in (select e1.department_id
                                from employees e1
                                group by e1.department_id
                                having sum(commission_pct) is null);
								
								
								
	select e.employee_id, d.department_name
		from employees e
		INNER JOIN departments d ON e.department_id = d.department_id
		where e.department_id in (select e1.department_id
									from employees e1
									group by e1.department_id
									having sum(nlv(commission_pct, 0)) = 0);

9. Empleados y nombre del departamento de empleados que trabajen en el departamento cuyo salario medio supere el salario
medio total de la empresa.

select e.employee_id, d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    where e.department_id IN (select e1.department_id
                                from employees e1
                                group by e1.department_id
                                having avg(e1.salary) > (select avg(e2.salary)
                                                            from employees e2));

10. Para cada departamento que tenga 3 o más trabajadores, calcular el total de salarios, el total de comisiones y el
número de trabajadores. Mostrar el nombre del departamento y las 3 cantidades.

select sum(e.salary), sum(e.commission_pct), count(e.employee_id), d.department_name
    from employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    group by d.department_name
    having count(*) >= 3;
	
EXTRA
--Suma del sueldo y número de empleados por país que tengan al menos 1 empleado

select sum(e.salary), count(e.employee_id), l.country_id
    from employees e
        INNER JOIN departments d ON e.department_id = d.department_id
        INNER JOIN locations l ON d.location_id = l.location_id
            group by country_id
            having count(employee_id) >= 1 