3.
select *
	from employees
	where salary > (select avg(salary)
						from employees);
						
4. 
