--HECHO POR ADRIÁN JARAMILLO RODRÍGUEZ--

-- 1. Mostrar el apellido, fecha de alta y número de departamento de cada empleado.
select last_name, hire_date, department_id from employees;

-- 2. Mostrar el número, nombre y localización de cada departamento.
select department_id, department_name, location_id from departments;

-- 3. Mostrar todos los datos de todos los empleados.
select * from employees;

-- 4. Datos de los empleados ordenados por apellido.
select * from employees order by last_name desc;

-- 5. Datos de los empleados ordenados descendentemente por número de departamento.
select * from employees order by department_id desc;

-- 6. Datos de los empleados ordenados descendentemente por número de departamento
-- y dentro de cada departamento ordenados ascendentemente por apellido.
select * from employees order by department_id desc, last_name asc;

-- 7. Mostrar los datos de los empleados cuyo salario esté comprendido entre 10000 y 30000,
-- ordenados por salario.
select * from employees where salary >= 10000 AND salary <= 30000; 

-- 8. Mostrar los datos de los empleados cuyo salario sea mayor que 20000.
select * employees where salary > 20000;

-- 9. Mostrar los datos de los empleados cuyo oficio sea programador.
select * from employees where job_title LIKE 'Programmer';

-- 10. Seleccionar el apellido y oficio de los empleados del departamento número 20.
select last_name, job_title from employees, jobs where department_id = 20;
























-- 11. Mostrar los apellidos de los empleados en orden ascendente.
select last_name from employees; --No order by porque por defecto ordena ascendentemente 

-- 12. Seleccionar los empleados cuyo oficio sea marketing manager. Mostrar los datos
-- ordenados por apellido.
select employee_id from employees where job_id LIKE 'MK_MAN' ORDER BY last_name; 
-- Consulta buena y funciona, pero no perfeccionada
SELECT employee_id, job_title  FROM employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id
where job_title LIKE 'Marketing Manager';

-- 13. Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea accountant.
-- Ordenar el resultado por apellido;
select employee_id, last_name, job_title, department_id from employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id
where (department_id LIKE '10') AND (job_title LIKE 'Accountant') 
order by last_name;
--La consulta no devuelve resultados, porque no hay un empleado que esté en el departamento 10 y tenga el trabajo Accountant

-- 14. Mostrar los empleados que tengan un salario mayor que 200000 o que
-- pertenezcan al departamento número 20.
select employee_id from employees where (salary > 200000) OR (department_id LIKE '20');

-- 15. Ordenar los empleados por oficio, y dentro de oficio por apellido.
select employee_id, last_name, job_title  from employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id
order by job_title, last_name;

-- 16. Seleccionar los empleados cuyo apellido empiece por ‘S’.
select employee_id from employees where (last_name LIKE 'S%') OR (last_name LIKE 's%');
--TENER MUCHO CUIDADO, EL PATRÓN DE BÚSQUEDA DE LIKE, ES CASE SENSITIVE
--HAGO ESA CONDICIÓN PARA QUE DE IGUAL CÓMO ESTÉ ESCRITA LA PRIMERA LETRA

-- 17. Seleccionar los empleados cuyo apellido termine en 'n’.
select employee_id from employees where (last_name LIKE '%N') OR (last_name LIKE '%n');

-- 18. Seleccionar de la tabla empleados aquellas filas cuyo apellido empiece por ‘A’ y el
-- email tenga una ‘E’ en cualquier posición.
select last_name, email from employees where (last_name LIKE 'A%') AND (email LIKE '%E%');

-- 19. Seleccionar los empleados cuyo salario esté entre 10000 y 17000. Utilizar el operador
-- BETWEEN.
SELECT employee_id, salary FROM employees
WHERE salary BETWEEN 10000 AND 17000; 

-- 20. Obtener los empleados que tengan una comisión superior a 600.
select employee_id from employees where commission_pct > 600;


























-- 21. Seleccionar los datos de los empleados ordenados por número de departamento, y
-- dentro de cada departamento ordenados por apellido.
select * from employees order by department_id, last_name;

-- 22. Número y apellidos de los empleados cuyo email termine en ‘h’ y tengan un salario
-- superior a 2000.
select employee_id, last_name from employees where (email LIKE '%H') AND (salary > 2000);

-- 23. Datos de los departamentos cuya localización empiece por ‘B’.
select department_id, city from departments
INNER JOIN locations
ON departments.location_id = locations.location_id
where (city LIKE 'B%') AND (city LIKE 'b%'); 

-- 24. Datos de los empleados que tengan un salario superior a 200 y pertenezcan al
-- departamento número 10.
select employee_id from employees where (salary > 200) AND (department_id LIKE '10');

-- 25. Mostrar los apellidos de los empleados que no tengan comisión.
select last_name from employees where commission_pct IS NULL;

-- 26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido
-- empiece por ‘J’.
select last_name from employees where (commission_pct IS NULL) AND (last_name LIKE 'J%');

-- 27. Seleccionar el apellido, salario y número de departamento de los empleados cuyo salario
-- sea mayor que 200000.
select last_name, salary, department_id from employees where salary > 200000;

-- 28. Obtener los apellidos de todos los empleados en minúscula.
select lower(last_name) from employees;

-- 29. En una consulta concatena el apellido de cada empleado con su oficio.
select last_name, job_title from employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id;

-- 30. Mostrar el apellido y la longitud del apellido (función LENGTH) de todos los
-- empleados, ordenados por la longitud de los apellidos de los empleados
-- descendentemente.
select last_name, length(last_name) from employees order by length(last_name) desc; 




























-- 31. Obtener el año de contratación de todos los empleados (función TO_CHAR).
select to_char(hire_date, 'YYYY') from employees;

-- 32. Mostrar los datos de los empleados que hayan sido contratados en el año 2004.
select * from employees where hire_date LIKE '%04';

-- 33. Mostrar los datos de los empleados que hayan sido contratados en el mes de
-- febrero de cualquier año.
select * from employees where to_char(hire_date, 'MM') LIKE '02';

-- 34. Mostrar los datos de los empleados cuyo apellido empiece por 'S' y hayan sido
-- contratados en el año 2006.
select last_name, hire_date from employees where ((last_name LIKE 'S%') OR (last_name LIKE 's%')) AND (to_char(hire_date, 'YY') LIKE '06');

























