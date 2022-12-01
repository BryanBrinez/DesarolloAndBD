const express = require('express');
const cors = require("cors");
const { Pool } = require('pg');
const { Client } = require('pg');

const port = 3000;

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send('Hello World!');
});


app.post("/beneficiario", (req, res) => {
  const benData = req.body;
  //console.log

  //console.log(benData.id_1);
  inserBen(benData.paren, benData.id_1, benData.id_2);

  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port http://localhost:${port}`);
});


async function inserBen(ben, id1, id2) {
  try {
    const client = new Client({
      user: 'postgres',
      host: 'localhost',
      password: '123456789',
      database: 'healthsoft'
    });
    await client.connect();

    const queryToInsert = "insert into beneficiario values ('" + ben + "','" + id1 + "','" + id2 + "')";


    const res = await client.query(queryToInsert);

    console.log(res.rows); // Hello world!
    await client.end();
  }
  catch (error) {
    console.log(error);

  }
}

app.post("/lAdmin", (req, res) => {
  const benData = req.body;
  alert(benData);

  //console.log(benData.id_1);
lAdmin(benData.user,benData.password);
  res.send('Hello World!');
});

async function lAdmin (login,password){
  try {
    const client = new Client({
      user: 'postgres',
      host: 'localhost',
      password: '123456789',
      database: 'healthsoft'
    });
    await client.connect();
    console.log(login);

    const queryToInsert = "INSERT INTO public.\"LoginAdministrador\" VALUES ('" + login +"','" + password +"')";


    const res = await client.query(queryToInsert);
    

    console.log("res.rows"); // Hello world!
    await client.end();
  }
  catch (error) {
    console.log(error);

  }
}
