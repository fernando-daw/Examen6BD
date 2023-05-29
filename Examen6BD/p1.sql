--Revisa las tablas Customers (clientes)
select * from customers;
--Employees (empleados)
select * from employees;
--y Orders (pedidos)
select * from orders;
--¿Cuántos clientes hay registrados?
select count(CUSTOMER_id) from customers;
--¿Cuántos pedidos?
select count(order_id) from orders;
--¿Qué clientes viven en Londes y su nombre (CustomerName) empieza por A?
select CONTACT_name, CITY FROM customers WHERE CITY = 'London' and CONTACT_NAME LIKE 'A%';
--¿Cuántos clientes hay que son de Londres?
SELECT count(CUSTOMER_id) from customers WHERE city = 'London';
--¿Cuántos clientes hay en cada ciudad?
select count(customer_id) AS NUM_CLIENTES, CITY FROM customers GROUP BY CITY ORDER BY NUM_CLIENTES desc ;
--¿Cuántos empleados nacieron después de 1 de Junio del 1965?
SELECT count(employee_id), first_name, BIRTH_DATE from employees where birth_date >'1965-06-01' group by EMPLOYEE_ID;
--Hazme un informe que diga «El empleado N nación el N», siendo N, nombre (FirstName y Last Name) y día de nacimiento (BirthDate)
select ('El empleado '|| employees.first_name || employees.last_name || ' nacio el ' || employees.birth_date || '.') AS INFORME FROM EMPLOYEES 
GROUP BY FIRST_NAME, LAST_NAME, birth_date;
--Hazme el informe anterior, pero sólo para los empleados con id 8, 7, 3 y 10
SELECT concat('El empleado ',first_name,' ',last_name,' con ID ', employee_id ,', nacio el ',birth_date) as informe from employees 
where employee_id in (8,7,3,10);
--Dime los paises que tengan más de 5 clientes, ordenados por el nombre de país
SELECT country , count(customer_id) as total FROM customers GROUP BY country HAVING count(customer_id) >5  ORDER BY country;

