var socket = require('socket.io-client')('http://localhost:8000');
socket.on('connect', function(){
	socket.emit("ping_from_client", "ping_from_client")
});

socket.on('pong_from_server', function(data){
	console.log(data);
	// call the rest of the code and have it execute after 3 seconds
	socket.emit("ping_from_client", data);
	
});
socket.on('disconnect', function(){});