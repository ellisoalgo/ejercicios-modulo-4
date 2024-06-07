//importar
const express = require('express');
const cors = require('cors');

//crear servidor
const server = express();

//aceptar peticiones desde fuera
server.use(cors());

//datos que deberian estar en una DB
const pets = [
    {name: "Fifi", type: "dog"},
    {name: "Pancake", type: "cat"},
    {name: "Lili", type: "cat"}
]

//endpoints - uno por cada fetch que se vaya a hacer
server.get("/pets", (req, res)=>{
    //req, petición de la APP WEB --> body, url, autorizaciones...
    //res --> respuesta a devolver
    //buscar los datos en una BD --> con un select
    if(pets.length === 0){
        res.status(500).json({message: "no hay mascotas", success: false})
    } else {
        res.status(200).json({message: pets, success: true})
    }
});

server.get("/update", (req, res)=>{
    res.send("modificar mascota");
})

//configuración
const PORT = 5001;
server.listen(PORT, () => {
  console.log(`server is running http://localhost:${PORT}`);
});