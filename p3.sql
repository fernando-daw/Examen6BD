--¿Cuál es el producto con el precio mínimo más bajo? (usando subconsultas)
SELECT product_id, product_name,unit_price FROM products where unit_price = (SELECT min(unit_price) from products);
--¿Cual es el producto cuyo precio sea al menos 10 veces el pedido mínimo (quantity) de los pedidos (OrderDetails)?
SELECT * FROM products where  unit_price >=(SELECT min(quantity) FROM order_details)*10;
--¿Cuales son los registros de productos (Products) cuyo precio (price) sea mayor que el máximo de los precios de los productos cuyo id sea 3, 6, 9 y 10?
SELECT product_name, UNIT_PRICE FROM products where unit_price > (SELECT max(unit_price) from products where product_id IN (3,6,9,10));
--¿Cuales son los registros de productos (Products) cuyo ProductID sea un valor que esté en Shippers.ShipperID?
SELECT * from products where product_id = ANY (select shipper_id from shippers )
--¿Qué clientes (Customers) tenemos registrados, que estén en ciudades de nuestros proveedores (Suppliers)?
SELECT customer_id, contact_name,city from customers where city = any (SELECT city from suppliers ) order by city;