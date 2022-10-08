insert into emp_sales (employee_id, FIRST_NAME, LAST_NAME, email, HIRE_DATE, job_id, salary, DEPARTMENT_ID)
	select 180, 'Adrián', 'Jaramillo', 'adri@gmail.com', sysdate, job_id, salary, department_id
		from emp_sales
		where employee_id = 160;

		--Se pueden hacer INSERT a campos de tablas haciendo un select de datos
		--Es decir, los VALUES resultantes de la consulta se añade con el INSERT
		--EN VEZ DE USAR COLUMNAS, PODEMOS USAR VALORES FIJOS. Se crearán "columnas virtuales", no existen.
		-- Su nombre de columna y valor será el dicho en el select.
		--También funciona de la misma manera el añadir una función como sysdate
		--En el where se filtra para quedarnos con los registros de los empleados dichos 