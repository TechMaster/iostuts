var express = require('express');

var bodyParser = require ('body-parser');
var app = express();
var socketserver = require('http').createServer();
var io = require('socket.io')(socketserver);
var socketClientsArray = [];


// event called on Socket.IO connection
io.on('connect', function(socket)
{
	console.log('client connected')

	socket.on('ping_from_client', function(msg){
		console.log(msg);
    	io.emit('pong_from_server', msg);
  	});

})

socketserver.listen(8000); // Socket.IO, port 8080
app.listen (3000); // API, port 3000