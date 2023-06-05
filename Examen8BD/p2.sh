#Creamos las tres colecciones; viajeros, vuelo y ciudad
db.createCollection("viajeros")
db.createCollection("vuelo")
db.createCollection("ciudad")

#Añadimos los datos a la coleccion viajeros
db.viajeros.insertMany([ 
{ nombre: "Cristiano Ronaldo", fecha_nacimiento: ISODate ("1986-08-25"), nacionalidad: "Portugues", residencia: "Arabia Saudi" } 
{ nombre: "Lionel Messi", fecha_nacimiento: ISODate ("1988-06-07"), nacionalidad: "Argentino", residencia: "Paris" }, 
{ nombre: "Fernando Lago", fecha_nacimiento: ISODate ("1994-11-20"), nacionalidad: "Español", residencia: "Vigo" }, 

]);

#Añadimos los datos a la coleccion vuelo
db.vuelo.insertMany([ 
{ origen: "Paris", destino: "Barcelona", fecha_salida: ISODate ("2023-10-01"), fecha_llegada: ISODate ("2023-10-01") }, 
{ origen: "Oporto", destino: "Al-Tihal", fecha_salida:  ISODate ("2023-10-01"), fecha_llegada: ISODate ("2023-10-01") },
{ origen: "Santiago", destino: "Zurich", fecha_salida: ISODate ("2023-08-19"), fecha_llegada: ISODate ("2023-08-19") }
]);

#Añadimos los datos a la coleccion ciudad
db.ciudad.insertMany([
  {
    nombre: "Paris",
    poblacion: 3451016,
    descripcion: "Ciudad del amor y conocida por la Torre Eiffel"
  },
  {
    nombre: "Oporto",
    poblacion: 187945,
    descripcion: "La ciudad mas bonita de Portugal, llena de cuestas"
  },
   {
    nombre: "Santiago",
    poblacion: 65342,
    descripcion: "Ciudad del Xacobeo y la fiesta de Galicia"
  },

]);