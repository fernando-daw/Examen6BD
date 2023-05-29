--suma(n1,n2,n3). Crea una función que sume los dos primeros argumentos, y lo multiplique por un tercero. Los argumentos serán enteros.
CREATE FUNCTION suma_multip(x integer, y integer, z integer)
RETURNS integer AS
$$
SELECT (x + y) * z;
$$
LANGUAGE SQL;


--actualizar_bicis(codigo). Sobre la BD Hubway, quiero cambiar todos los valores de los códigos de las bicis que están a null, con un valor que yo quiero escoger. Por ejemplo actualizar_bicis('000000').
CREATE or REPLACE PROCEDURE corregir_codigo_bicis(antes varchar(6), ahora varchar(6))
LANGUAGE SQL AS
$$
UPDATE trips SET bike_number = ahora WHERE bike_number like antes;
$$ ;

--duracion_viaje(id,tipo). Necesito saber la duración de un viaje, en minutos o en horas, según el parámetro sea M o H. Por ejemplo duracion_viaje(4300,'M')
create or replace function duracion_viaje(viaje integer, tipo char(1))
RETURNS numeric(6,2) AS
$$
select
CASE
  WHEN tipo = 'M'  THEN (duration / 60)::numeric(6,2)
  WHEN tipo = 'H' THEN (duration / 60 / 60)::numeric(6,2)
END
FROM trips where id = viaje
$$
LANGUAGE SQL ;