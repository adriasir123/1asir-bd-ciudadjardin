--##########################--
--HECHO POR ADRIÁN JARAMILLO--
--##########################--



-- 1.- Listar el salario medio de los empleados.
select AVG(salary) from employees;

-- 2.- Listar el id y apellidos de aquellos empleados que tengan un salario anual superior
-- a 40000 (recordar que el salario de la BD es mensual).
select employee_id, last_name from employees where (salary*12) > 40000;

-- 3.- Listar id y salario, incrementado en un 10%, de los empleados que ganen menos de 100000
-- euros al año. 
select employee_id, salary*1.10 from employees where salary < 100000;

-- 4.- Muestra el número de empleados que ganan más de 1400
select count(employee_id) from employees where salary > 1400;

-- 5.- Muestra los apellidos y oficio de los empleados, ordenados por salario.
select last_name, job_title from employees e, jobs j where e.job_id=j.job_id order by salary;

-- 6.-Muestra el gasto de personal total de la empresa, sumando salarios y comisiones.
select sum(salary+salary*commission_pct) AS "Gasto personal total" from employees;

-- 7.-Muestra los apellidos de los empleados y su salario (ordenado por el salario) con el siguiente
-- formato:

--         apellido1........ salario1

--        apellidon.........salarion

select concat(concat(last_name, '........'), salary) Apellido_salario from employees order by salary;

-- 8.-Muestra el número de trienios completos de cada empleado.
select employee_id, trunc((to_char(sysdate, 'YYYY')-to_char(hire_date,'YYYY'))/3) Trienios_Completos from employees, dual;

-- 9.- Muestra el total de dinero ganado por el empleado desde que se incorporó a la empresa
-- suponiendo que el salario no ha cambiado en todo ese tiempo.
select salary*((to_char(sysdate, 'YYYY')-to_char(hire_date,'YYYY'))*12) Total_ganado from employees, dual;

-- 10.- Muestra con dos decimales el salario diario de cada trabajador suponiendo que los meses 
-- tienen 30 días.
select employee_id, round(salary/30,2) Salario_diario  from employees;

-- 11.- Muestra los empleados que tengan en su apellido al menos dos letras 'a'.
select employee_id from employees where last_name LIKE '%a%a%';

-- 12.- Muestra los datos de los empleados cuyo apellido tenga mas de cinco letras.
select employee_id from employees where length(last_name) >= 5;

-- 13.- Muestra un mensaje de saludo a cada empleado con el formato 'Hola apellido_empleado'.
select concat('Hola ', last_name) Saludos from employees;

-- 14.- Muestra el apellido de cada empleado junto con el nombre del mes en el que entró en la
-- empresa.
select last_name, to_char(hire_date, 'MONTH') Mes_contrat from employees;

-- 15.- Muestra el apellido del primer empleado por orden alfabético.
select last_name from employees where ROWNUM=1;

-- 16.-. Muestra el número de directores que hay en la empresa.
select count(employee_id) Directores from employees e, jobs j where ((e.job_id=j.job_id) AND (j.job_title LIKE 'President'));

-- 17.- Muestra los empleados que llevan más de 6 años en la empresa.
select employee_id from employees where (to_char(sysdate, 'YYYY')-to_char(hire_date,'YYYY')) > 6;

-- 18.- Muestra los empleados que fueron dados de alta entre el 01/03/1988 y el 30/06/1989.
select employee_id, hire_date from employees where to_char(hire_date, 'DD/MM/YYYY') BETWEEN TO_DATE('01/03/1988', 'DD/MM/YYYY')
AND TO_DATE('30/06/1989', 'DD/MM/YYYY');