const express = require('express');
const cors = require('cors');
require("dotenv").config();
const mysql = require("mysql2/promise");

const app = express();

app.use(cors());
app.use(express.json());

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


const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening on port <http://localhost:${port}>`);
});

app.get('/', function (req, res) {
    res.send('Hello World!');
});

app.get('/songs', async (req,res) => {
    const conn = await getConnection();

    const [result] = await conn.query(
        `SELECT * 
         FROM songs`
    ); 

    await conn.end();

    res.send(result)
} );

app.post('/songs', async (req, res) => {
    const { name, length, embed_code, album_id } = req.body;

    if (!name || !length || !embed_code || !album_id) {
        return res.status(400).json({ message: 'Faltan datos necesarios' });
    }

    const conn = await getConnection();
    const [result] = await conn.query(
        'INSERT INTO songs (name, length, embed_code, albums_album_id) VALUES (?, ?, ?, ?)',
        [name, length, embed_code, album_id]
    );

    await conn.end();

    res.status(201).json({
        message: 'Canción creada con éxito',
        song_id: result.insertId
    });
});

app.get('/songs/:id', async (req, res) => {
    const { id } = req.params;
    
    const conn = await getConnection();
    const [result] = await conn.query('SELECT * FROM songs WHERE song_id = ?', [id]);
    await conn.end();

    if (result.length === 0) {
        return res.status(404).json({ message: 'Canción no encontrada' });
    }

    res.status(200).json(result[0]);
});

app.put('/songs/:id', async (req, res) => {
    const { id } = req.params;
    const { name, length, embed_code, album_id } = req.body;

    if (!name || !length || !embed_code || !album_id) {
        return res.status(400).json({ message: 'Faltan datos necesarios' });
    }

    const conn = await getConnection();
    const [result] = await conn.query(
        'UPDATE songs SET name = ?, length = ?, embed_code = ?, albums_album_id = ? WHERE song_id = ?',
        [name, length, embed_code, album_id, id]
    );
    await conn.end();

    if (result.affectedRows === 0) {
        return res.status(404).json({ message: 'Canción no encontrada' });
    }

    res.status(200).json({ message: 'Canción actualizada con éxito' });
});

app.delete('/songs/:id', async (req, res) => {
    const { id } = req.params;

    const conn = await getConnection();
    const [result] = await conn.query('DELETE FROM songs WHERE song_id = ?', [id]);
    await conn.end();

    if (result.affectedRows === 0) {
        return res.status(404).json({ message: 'Canción no encontrada' });
    }

    res.status(200).json({ message: 'Canción eliminada con éxito' });
});



