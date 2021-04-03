from sanic import Sanic
from sanic.response import html

import socketio

sio = socketio.AsyncServer(async_mode='sanic')
app = Sanic()
sio.attach(app)
count = 0


@sio.on('connect')
async def on_connect(sid, environ):
    print("client connect")


@sio.on('ping_from_client')
async def ping(sid, data):
    print(data)
    global count
    count = count + 1
    await sio.emit('pong_from_server', count)


if __name__ == '__main__':
    app.run()
