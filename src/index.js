const express = require('express');
const cors = require('cors');
require("dotenv").config();
const mysql = require("mysql/promise");

async function getConnection() {
    const connectionData ={
        host: process.env["MySQL_HOST"],
        port: process.env["MySQL_PORT"],
        user: process.env["MySQL_USER"],
        password: process.env["MySQL_PASS"],
        database: process.env["MySQL_SCHEMA"]
    };

    const connection = await mysql.createConnection(connectionData);
    await connection.connect();

    return connection;
};

const app = express();

app.use(cors());
app.use(express.json());

const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening on port <http://localhost:${port}>`);
});

app.get('/', function (req, res) {
    res.send('Hello World!');
  });