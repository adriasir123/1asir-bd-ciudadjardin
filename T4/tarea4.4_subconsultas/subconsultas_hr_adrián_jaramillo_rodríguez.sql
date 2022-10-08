1. Listar el nombre de los departamentos en los que alguno de los salarios sea
superior a 2000.

select department_name
	from departments
	where department_id IN (select department_id
								from employees
								where salary > 2000);
								
2. Listar el nombre de los departamentos que tengan algún empleado que gane más
de 33000 al año. (Recuerda que el salario es mensual)

select department_name
	from departments
	where department_id IN (select department_id
								from employees
								where salary*12 > 33000);

3. Listar todos los empleados que trabajen en el departamento con nombre Shipping.

select employee_id
	from employees
	where department_id = (select department_id
								from departments
								where upper(department_name) = 'SHIPPING');

4. Mostrar todos los datos de los empleados que trabajen en un departamento cuyo
nombre contenga una l

select *
	from employees
	where department_id IN (select department_id
								from departments
								where upper(department_name) LIKE '%L%');

5. Muestra los empleados que ganan más que Alexander Hunold.

select employee_id
	from employees
	where salary > (select salary
						from employees
						where first_name = 'Alexander' AND last_name = 'Hunold');

6. Listar aquellos empleados que han entrado a trabajar en la empresa antes que
Bruce Ernst.

select employee_id
	from employees
	where hire_date < (select hire_date
						from employees
						where first_name = 'Bruce' AND last_name = 'Ernst');

7. Muestra los empleados del mismo departamento que Alexander Hunold.

select employee_id
	from employees
	where department_id IN (select department_id
								from employees
								where first_name = 'Alexander' AND last_name = 'Hunold');

8. Muestra los empleados que trabajan en un departamento ubicado en Seattle.

select employee_id
	from employees
	where department_id IN (select department_id
								from departments
								where location_id = (select location_id
														from locations
														where upper(city) = 'SEATTLE')
							);

9. Muestra nombre y salario de los empleados del departamento Executive.

select first_name, last_name, salary
	from employees
	where department_id IN (select department_id
								from departments
								where upper(department_name) = 'EXECUTIVE');  

10. Muestra el nombre, el salario y la comisión de los empleados que trabajan en
el mismo departamento que Bruce Ernst.

select first_name, last_name, salary, commission_pct
	from employees
	where department_id IN (select department_id
								from employees
								where first_name = 'Bruce' AND last_name = 'Ernst');  

11. Muestra el nombre del departamento donde trabaja el empleado más antiguo
la empresa.

select department_name
	from departments
	where department_id = (select department_id
								from employees
								where hire_date = (select min(hire_date)
													from employees)
						  );

12. Muestra los nombres de los departamentos en los que trabaja alguien que
gane menos que Bruce Ernst.

select department_name
	from departments
	where department_id IN (select department_id
								from employees
								where salary < (select salary
													from employees
													where first_name = 'Bruce' AND last_name = 'Ernst')
							);


13.Muestra todos los datos de los Programmer del Departamento 60.

select *
	from employees
	where job_id = (select job_id
						from jobs
						where upper(job_title) = 'PROGRAMMER')
							  AND
							  department_id = 60;

14. Obtener el sueldo medio de los empleados que trabajan en Seattle.

select avg(salary)
	from employees
	where department_id IN (select department_id
								from departments
								where location_id = (select location_id
														from locations
														where upper(city) = 'SEATTLE'));

15. Muestra la cantidad de empleados que trabajan en el departamento Shipping.

select count(employee_id)
	from employees
	where department_id = (select department_id
								from departments
								where upper(department_name) = 'SHIPPING');