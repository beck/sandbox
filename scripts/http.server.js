var express = require('express');
var app = express();

app.use('/', express.static(__dirname + '/../public'));
var server = app.listen(8080);

console.log('listening..', __dirname)

setTimeout(server.close.bind(server), 5000);
