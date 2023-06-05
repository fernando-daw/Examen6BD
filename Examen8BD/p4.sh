#colección movies de la BD sample_mflix
#Actualiza el campo year de la pelicula de título “Civilization” a “1985”
db.movies.updateOne( { title: "Civilization" }, { $set: { year: "1985" } } );
#Actualiza el campo comentarios de todas las películas, sumándole 10
db.movies.updateMany( {}, { $inc: { comentarios: 10 } } );
#Actualiza el campo year de las peliculas con duración (runtime) mayor a 100 para que sea 100 (es decir, no habrá ninguna duración mayor que 100)
db.movies.updateMany( { runtime: { $gt: 100 } }, { $set: { year: 100 } } );
#Borra las que sean el género Action
db.movies.deleteMany( { genres: "Action" });
#Borra las películas de entre los años 1950 y 1970 y que tengan menos de 80 votos en imdb
db.movies.deleteMany( { year: { $gte: 1950, $lte: 1970 }, votes: { $lt: 80 } });