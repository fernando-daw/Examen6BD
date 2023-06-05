#Muéstrame 3 pedidos (supplies) de la BD.
db.sales.find().limit(3)
#Muéstrame el promedio de edad de los clientes (customer) agrupado por tienda (storeLocation)
db.sales.aggregate([ { $group: { _id: "$storeLocation", averageAge: { $avg: "$customer.age" } } } ])
#¿Cuántos clientes mujeres de más de 40 años han hecho pedidos en nuestra tienda?
db.sales.countDocuments({ "customer.gender": "F", "customer.age": { $gt: 40 } });
#Muéstrame la tienda, el email del cliente y su edad, de los 5 pedidos con mejor valoración (satisfaction) de los clientes
db.sales.aggregate([ { $sort: { "customer.satisfaction": -1 } }, { $limit: 5 }, { $project: { _id: 0, storeLocation: 1, "customer.email": 1, "customer.age": 1, "customer.satisfaction": 1 } } ]);