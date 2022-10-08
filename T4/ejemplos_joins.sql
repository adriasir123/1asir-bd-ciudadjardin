select e.first_name, e.last_name, d.department_name
from employees e inner join
departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, d.department_name
from employees e full outer join
departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, d.department_name
from employees e right join
departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, d.department_name
from employees e left join
departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, d.department_name
from employees e full outer join
departments d on e.department_id = d.department_id
where d.department_id is null or
e.department_id is null;

select e.first_name, e.last_name, d.department_name
from employees e right join
departments d on e.department_id = d.department_id
where e.department_id is null;

select e.first_name, e.last_name, d.department_name
from employees e left join
departments d on e.department_id = d.department_id
where d.department_id is null;


select e.employee_id, e.first_name as nombre, e.last_name as apellido,
j.first_name as "nombre jefe", j.last_name as "apellido jefe"
from employees e inner join
employees j on e.manager_id = j.employee_id;