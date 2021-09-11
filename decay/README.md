<h1 align="center">decay</h1>

<div align="center">

Icecast broadcasting ❄️

[![Testing docker build](https://github.com/radio-aktywne/decay/actions/workflows/docker-build.yml/badge.svg)](https://github.com/radio-aktywne/decay/actions/workflows/docker-build.yml)
[![Deploying docs](https://github.com/radio-aktywne/decay/actions/workflows/docs.yml/badge.svg)](https://github.com/radio-aktywne/decay/actions/workflows/docs.yml)

</div>

---

`decay` is an [Icecast](https://icecast.org) server that you can send audio to and have it broadcasted to multiple listeners.

## Usage

To start the server `cd` into `src` and run:

```sh
./start.sh
```

The server will run on [`http://localhost:8080`](http://localhost:8080).
However, you still need to mount a source first to listen to any music.

For more info about arguments, run:

```sh
./start.sh --help
```

## Configuration

Icecast can be configured by providing an `.xml` file with its configuration options.
By default it uses the `icecast.xml` file but you can override that with the `-c` argument.

Some special options can be set by environmental variables:

- `DECAY_SOURCE_PASSWORD` overrides the `source-password` option
- `DECAY_RELAY_PASSWORD` overrides the `relay-password` option
- `DECAY_ADMIN_PASSWORD` overrides the `admin-password` option
- `DECAY_HOST` overrides the `hostname` option
