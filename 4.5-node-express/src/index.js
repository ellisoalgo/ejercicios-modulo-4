//import
const express = require("express")

//crear server
const server = express();

//configuración
const PORT = 3000;
server.listen(PORT, ()=>{
    console.log(`server is running at http://localhost:${PORT}`)
});

//rutas endpoints -> API
server.get("/", (req, res)=>{
    const student = {
        name: "Anacleta",
        email: "ana@gmail.com"
    }
    res.json(student)
});

//servidores de estáticos
const staticServerWeb = "./web";
server.use(express.static(staticServerWeb));
