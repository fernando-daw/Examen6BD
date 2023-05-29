--actualiza_viaje(viaje, factor). Actualizar la duración para un viaje concreto. Es decir la nueva duración será la que tiene multiplicada por factor. Devolverá el número de viajes realizado desde la misma estación de origen
create or replace function actualiza_viaje(viaje integer, factor integer) RETURNS integer
AS $$
BEGIN
  UPDATE trips SET duration = duration * factor WHERE id = $1;
  return count(*) from trips where start_station = (select start_station from trips where id = $1);
END;
$$ language plpgsql ;

--contar_viajes_mes(mes, referencia). Devuelve un entero con los viajes que se hicieron en un mes concreto (siendo 1 - enero y 12 - diciembre). Lanzará también un aviso en consola (RAISE NOTICE) clasificándolo en pocos / normal / muchos. El umbral de decisión será de 0,25 el valor de referencia (para pocos), 0,5 para normal y 0,75 muchos
create or replace function contar_viajes_mes(mes integer, referencia integer) RETURNS integer
AS $$
DECLARE
viajes integer;
BEGIN
  viajes := count(id) from trips where extract(month from start_date) = mes;
IF  (viajes <= referencia * 0.25)
THEN  RAISE NOTICE 'Pocos Viajes';
END IF;
IF (viajes between (referencia * 0.25) AND (referencia * 0.75) )
THEN RAISE NOTICE 'Lo normal';
END IF;
IF (viajes >= referencia * 0.75)
THEN RAISE NOTICE 'Muchos Viajes';
END IF;
return viajes;
END;
$$ language plpgsql ;

--borra_y_guarda(id). Crea una función que borre el viaje con ese id. Además guardará en un log (tabla viajes_borrados) un registro del tipo «El usuario $U borró el viaje $V», además el timestamp del borrado
CREATE OR REPLACE FUNCTION borra_y_guarda(id integer) RETURNS void AS $$
BEGIN
    DELETE FROM trips WHERE trip_id = id;
    INSERT INTO viajes_borrados (usuario, viaje, timestamp) VALUES (current_user, id, now());
END;
$$ LANGUAGE plpgsql;