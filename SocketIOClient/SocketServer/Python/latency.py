from sanic import Sanic

import socketio

sio = socketio.AsyncServer(async_mode='sanic')
app = Sanic()
sio.attach(app)


@sio.on('connect')
async def on_connect(sid, environ):
    print("client connect")


@sio.on('ping_from_client')
async def ping(sid, data):
    await sio.emit('pong_from_server')


if __name__ == '__main__':
    app.run()
