const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3001;

app.use(cors());
app.use(bodyParser.json());
app.use(express.json());

// Crear la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'inmobiliaria'
});

// Conectar a la base de datos
connection.connect(error => {
  if (error) {
    console.error('Error al conectar a la base de datos:', error);
    return;
  }
  console.log('Conexión a la base de datos establecida');
});

// Endpoint para registrar un usuario 
app.post('/register', (req, res) => {
   const { username, password, email } = req.body; 
   
   const hashedPassword = bcrypt.hashSync(password, 10); const sql = 'INSERT INTO usuarios (username, password, email) VALUES (?, ?, ?)'; 
   connection.query(sql, [username, hashedPassword, email], (error, results) => { 
    if (error) { console.error('Error al registrar el usuario:', error); res.status(500).json({ error: 'Hubo un error al registrar el usuario' }); 
  } else { res.status(200).json({ success: true, message: 'Usuario registrado con éxito' });
 } 
});
});

// Endpoint para iniciar sesión 
app.post('/login', (req, res) => { 
  const { username, password } = req.body; 
  const sql = 'SELECT * FROM usuarios WHERE username = ?'; 
  
  connection.query(sql, [username], (error, results) => { 
    if (error) { 
      console.error('Error al iniciar sesión:', error); 
      res.status(500).json({ error: 'Hubo un error al iniciar sesión' });
     } else if (results.length > 0) { 
      const user = results[0]; 
      const passwordMatch = bcrypt.compareSync(password, user.password); 
      if (passwordMatch) { 
        res.status(200).json({ success: true, message: 'Inicio de sesión exitoso' }); 
      } else {
         res.status(401).json({ success: false, message: 'Credenciales incorrectas' }); } 
        } else { 
          res.status(401).json({ success: false, message: 'Usuario no encontrado' }); 
    } 
  }); 
});

// Endpoint para insertar una vivienda
app.post('/vivienda', (req, res) => {
  const { id, habitaciones, coordenadas, anio, piscina, descripcion, ruta, location, tipo, venta, alquiler, superficie, alt } = req.body;
  const sql = 'INSERT INTO vivienda SET ?';
  
  connection.query(sql, req.body, (error, results) => {
    if (error) {
      console.error('Error al insertar en la base de datos:', error);
      res.status(500).json({ error: 'Hubo un error al insertar los datos en la base de datos' });
    } else {
      res.status(200).json({ message: 'Propiedad subida con éxito', id: results.insertId });
    }
  });
});

// Endpoint para obtener la historia de la empresa
app.get('/empresahistoria', (req, res) => {
  connection.query('SELECT * FROM empresahistoria', (error, resultado) => {
    if (error) {
      console.error('Error al obtener datos:', error);
      res.status(500).json({ error: 'Error al obtener la historia de la empresa' });
    } else {
      res.json(resultado);
    }
  });
});
// Endpoint para obtener web de Oficinas de la empresa
app.get('/empresaoficinas', (req, res) => {
  connection.query('SELECT * FROM empresaoficinas', (error, resultado) => {
    if (error) {
      console.error('Error al obtener datos:', error);
      res.status(500).json({ error: 'Error al obtener la web de las oficinas de la empresa' });
    } else {
      res.json(resultado);
    }
  });
});

// Endpoint para obtener información de contacto
app.get('/contactar', (req, res) => {
  connection.query('SELECT * FROM contactar', (error, resultado) => {
    if (error) {
      console.error('Error al obtener datos de contacto:', error);
      res.status(500).json({ error: 'Error al obtener información de contacto' });
    } else {
      res.status(200).json(resultado);
    }
  });
})


// Endpoint para obtener viviendas en Alquiler
app.get('/alquilar/:donde/:tipo', (req, res) => {
  const sql = 'SELECT * FROM alquilar WHERE location = ? AND tipo = ?';
  connection.query(sql, [req.params.donde, req.params.tipo], (error, resultado) => {
    if (error) {
      console.error('Error en la consulta:', error);
      res.status(500).json({ error: 'Error al realizar la consulta' });
    } else {
      console.log(resultado);
      res.status(200).json({ cantidad: resultado.length, msg: resultado });
    }
  });
});


// Endpoint para obtener viviendas según ubicación y tipo
app.get('/comprar_vivienda/:donde/:tipo', (req, res) => {
  const sql = 'SELECT * FROM comprar_vivienda WHERE location = ? AND tipo = ?';
  connection.query(sql, [req.params.donde, req.params.tipo], (error, resultado) => {
    if (error) {
      console.error('Error en la consulta:', error);
      res.status(500).json({ error: 'Error al realizar la consulta' });
    } else {
      console.log(resultado);
      res.status(200).json({ cantidad: resultado.length, msg: resultado });
    }
  });
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`API arrancada en puerto ${port}`);
});


















/*const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.json());


const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'inmobiliaria'
});

connection.connect();


app.post('/vivienda', (req, res) => {
  // Extrae los datos del cuerpo de la solicitud
  const { id, habitaciones, ubicacion, anio, piscina, descripcion, ruta, location, tipo, venta, alquiler, superficie, alt } = req.body;

  // Crea la consulta SQL para insertar los datos en la base de datos
  const sql = `INSERT INTO vivienda (id, habitaciones, ubicacion, anio, piscina, descripcion, ruta, location, tipo, venta, alquiler, superficie, alt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  // Ejecuta la consulta SQL
  connection.query(sql, [id, habitaciones, ubicacion, anio, piscina, descripcion, ruta, location, tipo, venta, alquiler, superficie, alt], (error, results) => {
      if (error) {
          console.error(error);
          res.status(500).json({ error: 'Hubo un error al insertar los datos en la base de datos' });
      } else {
          res.status(200).json({ message: 'Propiedad subida con éxito', id: results.insertId });
      }
  });
});








app.get('/empresahistoria', (req, res) => {
  connection.query('SELECT * FROM empresahistoria', function (error, resultado, fields) {
      if (error) throw error;
      res.json(resultado);
  });
});

app.get('/contactar', (req, res) => {
  connection.query('SELECT * from contactar', function (error, resultado, fields) {
      if (error) throw error;
      res.status(200).json(resultado);
    });
})

app.get('/vivienda/:donde/:tipo', (req, res) => {
  connection.query(`SELECT * FROM vivienda WHERE location = '${req.params.donde}' AND tipo = ${req.params.tipo}`, function (error, resultado, fields) {
    if (error) throw error;
    console.log(resultado);
    res.status(200).json({ cantidad: resultado.length, msg: resultado });
  });
});

app.listen(port, () => {
  console.log(`API arrancada en puerto ${3000}`);
});*/
