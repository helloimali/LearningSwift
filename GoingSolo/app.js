var exp = require('express');
var app = exp();
var bodyParser = require('body-parser');


var server = app.listen(8080, function(){
    console.log("Check it: http://localhost:8080 ")
  })


//http://localhost:8080 
app.get('/', function(req,res){
  res.send('The Main Page');
})


app.get('/app', function(req,res){
    res.sendFile(__dirname + "/" + "index.html");
})

var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.post('/sendToDB', urlencodedParser, function(req, res) {
    console.log(req.body.word + req.body.desc);
    res.end();
})

  