--Creariamos la base de datos de frutas, es este caso: CREATE DATABASE bd_frutas_json;--

--Le añades una tabla que se llame "frutas" con un campo que sea clave primaria y otro que permita usar JSON, que guardará información sobre frutas.

CREATE TABLE frutas (
  id SERIAL PRIMARY KEY,
  datos JSONB
);

--Añade al menos 5 frutas a tu base de datos
--Un nombre, un diametro y un origen
INSERT INTO frutas (datos)
VALUES
  ('{
    "nombre": "Papaya",
    "diametro": 15,
    "origen": "Vigo"
  }'),
  ('{
    "nombre": "Pomelo",
    "diametro": 10,
    "origen": "Ourense"
  }'),
  ('{
    "nombre": "Naranja",
    "diametro": 7,
    "origen": "Coruña"
  }'),
  ('{
    "nombre": "Mandarina",
    "diametro": 2,
    "origen": "Ourense"
  }'),
  ('{
    "nombre": "Pera",
    "diametro": 4,
    "origen": "Santiago"
  }');

--Ponme la consulta para mostrar las frutas que vienen de Ourense
SELECT * FROM frutas WHERE datos->>'origen' = 'Ourense';

--Muéstrame las frutas que comiencen por la letra N
SELECT * FROM frutas WHERE datos->>'nombre' LIKE 'N%';