var exp = require('express');
var app = exp();
var bodyParser = require('body-parser');


var server = app.listen(process.env.PORT || 8080, function(){
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


//////The next bit will assist in connecting to the database

var sql = require('mysql');

var  connection = sql.createConnection({
    //To make a connection you need these credentials/ specifiers
    host: 'us-cdbr-iron-east-02.cleardb.net',
    user: 'b9f0d361207a76',
    password: 'fb8e5000', //yes the password, at some point, was password - Don't give me that look
    port: 3306,
    database: 'heroku_834120148db6749' // Note, this is the database name, under the "schemas" tab (in SQLWorkbench)

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
    
    res.sendFile(__dirname + "/" + "index.html");


})


app.get('/returnEntireDB', urlencodedParser, function(req,res){
    
    var connectionQuery = "SELECT * FROM new_table";
    
    connection.query(connectionQuery, function(error,rows,fields){
        // this will return everything from dict

        if(error){
            console.log("error");
        }else{
            console.log("Good");
            console.log(rows);
            res.send(JSON.stringify(rows));
        }
    });


})

app.post('/sendToDB', urlencodedParser, function(req, res) {

    var one = req.body.word;
    var two = req.body.desc;

    //var connectionQuery = "INSERT INTO new_table(word,def)VALUES('" + one + "','"+two+"')";
    var connectionQuery = "INSERT INTO `heroku_834120148db6749`.`new_table` (`Name`, `Email`) VALUES ('" + one + "','"+two+"')";
    

    connection.query(connectionQuery, function(error, rows, fields){
        
        //This will add "a" and "b" into the "dict" table, into the colms word and def
        //INSERT INTO dict(word,def)VALUES('A','B')

        if(error){
            console.log("error");
        }else{
            console.log("Good");
            console.log(rows)

        }
    });

    res.end();
})