var exp = require('express');
var app = exp();
var bodyParser = require('body-parser');


var server = app.listen(8080, function(){
    console.log("Check it: http://localhost:8080 ")
  })


//http://localhost:8080 
// app.get('/', function(req,res){
//   res.send('The Main Page');
// })


app.get('/app', function(req,res){
    res.sendFile(__dirname + "/" + "index.html");
})

var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.post('/sendToDB', urlencodedParser, function(req, res) {
    console.log(req.body.word + req.body.desc);
    res.end();
})

//////The next bit will assist in connecting to the database

var sql = require('mysql');

var  connection = sql.createConnection({
    //To make a connection you need these credentials/ specifiers
    host: 'localhost',
    user: 'root',
    password: 'password', //yes the password, is password
    port: 3306,
    database: 'PersonalDict' // Note, this is the database name, under the "schemas" tab (in SQLWorkbench)

});


//This will establish the connection with the above values
connection.connect(function(error){
    if(error){
        console.log("There's an error");
    } else{
        console.log("connected!");
    }
});

app.get('/', function(req,res){
    connection.query("SELECT * FROM dict", function(error, rows, fields){
        if(error){
            console.log("error");
        }else{
            console.log("Good");
            console.log(rows)
        }
    });

})