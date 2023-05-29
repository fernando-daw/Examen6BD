
--Dime las ciudades y número de pedidos de clientes en esa ciudad
SELECT customers.city, count(orders.order_id) as pedidos_clientes from customers inner join orders ON customers.customer_id = orders.customer_id group by customers.city order by pedidos_clientes DESC;
--¿Cuales son las ciudades desde las que hay más de 7 pedidos?
SELECT customers.city, count(orders.order_id) as pedidos_clientes from customers inner join orders ON customers.customer_id = orders.customer_id group by customers.city  HAVING count(orders.order_id) > 7 order by pedidos_clientes DESC;



--¿Cuales son los tres países desde los que tengo más pedidos?
SELECT customers.city, count(orders.order_id) as pedidos_clientes from customers inner join orders ON customers.customer_id = orders.customer_id group by customers.city order by pedidos_clientes DESC limit 3;

--Necesito un informe con el Nombre completo de los Empleados y el número de pedidos que registraron
SELECT concat('Empleado ',employees.first_name,' ',employees.last_name,' ha hecho un registro de ',count(orders.order_id),' pedidos') as INFORME from employees inner join orders ON employees.employee_id = orders.employee_id group by  employees.first_name, employees.last_name;
--En el informe anterior, sólo necesito los empleados cuyo nombre comience por M
SELECT concat('Empleado ',employees.first_name,' ',employees.last_name,' ha hecho un registro de ',count(orders.order_id),' pedidos') as INFORME from employees inner join orders ON employees.employee_id = orders.employee_id WHERE employees.first_name like 'M%' group by  employees.first_name,employees.last_name ;



--Quiero saber el número de pedido, qué empleado (sólo el nombre) lo registró y el cliente.
select order_id, first_name, contact_name AS CLIENTE from orders
inner join employees on orders.EMPLOYEE_ID = EMPLOYEES.employee_id 
inner join customers on customers.customer_id = orders.customer_id

--¿Hay algún cliente que haya hecho más de un pedido registrado por el mismo empleado?
SELECT employees.first_name AS EMPLEADO,orders.customer_id AS CLIENTE, count(orders.order_id ) AS NUM_PEDIDOS from orders inner join employees ON orders.employee_id = employees.employee_id group by employees.first_name,orders.customer_id HAVING count(orders.order_id ) > 1  order by NUM_PEDIDOS DESC ;

--Quiero saber los clientes que hayan hecho más de un pedido y que hayan sido registrado por un Empleado cuyo nombre sea Margaret.
SELECT employees.first_name,orders.customer_id, count(orders.order_id ) from orders inner join employees ON orders.employee_id = employees.employee_id  WHERE employees.first_name like 'Margaret' group by employees.first_name,orders.customer_id 
HAVING count(orders.order_id ) > 1  order by count DESC ;