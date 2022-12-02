// const express = require('express')
// const cors = require('cors')

// const app = express()
// const port = 3000

// let transactionArr = []

// app.use(
//     express.urlencoded({
//         extended:true
//     })
// )

// app.use(express.json({
//     type: "*/*"
// }))

// app.use(cors());

// app.get('/transaction', (req,res) => {
//     res.send(JSON.stringify(transactionArr));
// })
// app.post('/transaction', (req,res) => {
    
//     let transaction = req.body;
//     transactionArr.push(transaction);
//     // console.log(req.body)
//     res.send(JSON.stringify("guardada bb"));
//     console.log(transactionArr);
// })

// app.listen(port, () => {
//     console.log(`estoy ejecutandome en http://localhost:${port}`)
// })
console.log("execute")

const { Client } = require('pg')
const client = new Client()
await client.connect()
 
const res = await client.query('SELECT $1::text as message', ['Hello world!'])
console.log(res.rows[0].message) // Hello world!
await client.end()