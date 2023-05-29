--1 Quiero crear un número aleatorio entre el 5 y el 30
SELECT round(random() * (30 - 5) + 5)::integer as aleatorio;
--2 ¿Cuanto es 4 elevado a 5?
SELECT power(4, 5);
--3 Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2
CREATE SEQUENCE seq_01 INCREMENT BY 2 START WITH 0;
--4 ¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
SELECT currval('seq_01');
SELECT NEXTval('seq_01');
--5 ¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”, usando un intervalo de 3 días?
SELECT DATE_TRUNC('hour', CURRENT_DATE + INTERVAL '3 days') + INTERVAL '12 hours' AS fecha_y_hora;
--6 ¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
SELECT EXTRACT(hour FROM '08:45'::time - '07:30'::time) AS horas,
 EXTRACT(minute FROM '08:45'::time - '07:30'::time) AS minutos;
--7 ¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
SELECT EXTRACT(SECOND FROM TIMESTAMP '2001-02-16 20:38:40') AS segundos;
--8 ¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
SELECT 'Hola, me llamo ' || 'Pepe';
--9 ¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?
SELECT replace(replace('Hola soy Pepe', 'o', ''), 'e', '');