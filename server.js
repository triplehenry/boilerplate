var express = require('express');
var path = require('path');

var app = express(),
http = require('http'),
server = http.createServer(app);

app.use(express.static(path.join(__dirname, 'static')));

app.get('/', function(req, res, next){
    res.render('./index.html');
});

server.listen(8333);

