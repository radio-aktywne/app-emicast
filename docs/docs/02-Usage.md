---
slug: /usage
title: Usage
---

## Mounting sources

To mount a source you need to use a client that can communicate with [`Icecast`](https://icecast.org).

For example, you can use [`Liquidsoap`](https://www.liquidsoap.info) for that:

```sh
docker run --network host savonet/liquidsoap:main \
    'output.icecast(
        host="localhost",
        port=8000,
        password="password",
        mount="radio.mp3",
        %mp3,
        sine()
    )'
```

Now you should hear a sine wave at
[`http://localhost:8000/radio.mp3`](http://localhost:8000/radio.mp3).

## Listening

You can listen to any active mount point.
If a mount point is called `radio.mp3`
then you can reach the stream at
[`http://localhost:8000/radio.mp3`](http://localhost:8000/radio.mp3).

`Icecast` is responsible for handling as many listeners as possible
and making sure all of them get the live audio.

## Administration

There are various endpoints with internal insights and statistics:

- `/admin/listclients?mount=/radio.mp3` - list clients listening to `/radio.mp3`
- `/admin/stats` - various statistics
- `/admin/publicstats` - subset of statistics that are safe to expose to the public
- `/admin/listmounts` - list all active mount points
- `/admin/streamlist` - list all active streams

All of them return data in JSON format.
You need to authenticate with basic auth to access them.
