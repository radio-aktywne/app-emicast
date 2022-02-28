# Usage

To start the server `cd` into `src` and run:

```sh
./start.sh
```

The server will run on [`http://localhost:8000`](http://localhost:8000).
However, you still need to mount a source first to listen to any music.

## Mounting sources

To mount a source you need to use a client that can communicate with Icecast.

For example, you can use `liquidsoap` for that:

```sh
docker run savonet/liquidsoap:main 'output.icecast(host="localhost", port=8000, password="hackme", mount="radio.mp3", %mp3, sine())'
```

Now you should hear a sine wave at [`http://localhost:8000/radio.mp3`](http://localhost:8000/radio.mp3).

## Listening

You can listen to any active mount point.
If a mount point is called `radio.mp3` then you can reach the stream at [`http://localhost:8000/radio.mp3`](http://localhost:8000/radio.mp3).

Icecast is responsible for handling as many listeners as possible and making sure all of them get the live audio.

## Full usage

```
$ ./start.sh --help
Usage: ./start.sh [-p PORT] [-c CONFIG] [-u USER]
    -p, --port      port to listen on (default: 8000)
    -c, --config    config file path (default: /etc/icecast2/icecast.xml)
    -u, --user      user to run icecast with, should be in a group with the same name (default: icecast)
```
