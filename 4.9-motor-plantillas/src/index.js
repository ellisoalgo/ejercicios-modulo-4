// importar las dependencias que necesitas
const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
require("dotenv").config();

// creo mi servidor
const api = express();
const PORT = 4500; // 1025- 6500...

//configurar
api.use(cors());
api.use(express.json({ limit: '15mb' }));
api.set("view engine", "ejs");

async function conexion() {
  //defino la ubicacion y datos de BD
  const conn = await mysql.createConnection({
    host: 'localhost',
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: 'refugio',
  });
  //me conecto a la BD  definida
  await conn.connect();
  return conn;
}

api.get("/", async (req, res)=>{
  const conn = await conexion();
  const select = "SELECT * FROM pets";
  const [data] = await conn.query(select);
  res.render("home", {petList: data});
  conn.end();
})

api.get("/pet/:idPet", async (req, res)=>{
  const idPet = req.params.idPet
  // otra forma: const {idPet} = req.params
  const conn = await conexion();
  const select = "SELECT * FROM pets WHERE id = ?";
  const [results] = await conn.query(select, [idPet]);
  res.render("detail", {pet: results[0]});
  conn.end();
})

// arrancar el servidor por un puerto indicado
api.listen(PORT, () => {
  console.log(`http://localhost:${PORT}`);
});

//servidores estaticos, html, img, css, js, form contacto (html)
api.use(express.static('./src/css'));
