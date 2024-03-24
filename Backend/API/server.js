const express = require('express');
const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('config/db.js');

const app = express();


// Sincronizar modelos con la base de datos
sequelize.sync()
  .then(() => {
    console.log('Tablas sincronizadas correctamente');
  })
  .catch(err => {
    console.error('Error al sincronizar tablas:', err);
  });

app.listen(3000, () => {
  console.log('Servidor iniciado en el puerto 3000');
});