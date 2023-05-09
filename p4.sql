--Ver los valores nulos (si hay) en el campo start_station
select * from trips where start_station IS null;
--Actualizar todos los valores de start_station, si tienen valores nulos, para que sean iguales al valor de end_station para ese registro.
update trips set start_station = end_station where start_station is null; 
--Para arreglar este tema en el futuro, ¿qué instrucción de modificación DDL tendríamos que ejecutar?
--Yo haria que las END_STATION y las estaciones de origen tuvieran las mismas estaciones nulas para que no hubiera viajes sin ninguna estacion 
update trips set END_station = START_station where END_station is null; 
--Puedo modificar las tablas y las modifico para que no puedan ser nulas
alter table trips alter column start_station set not null; 
alter table trips alter column end_station set not null;
--Borra todos los registros que no tengan un valor conocido de birth_date?
DELETE from trips where birth_date is null;
--Actualizar los valores nulos de bike_number para que tengan el valor B00000
update trips set bike_number = 'B00000' where bike_number is null;