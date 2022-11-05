<h1 align="center">streamcast</h1>

<div align="center">

icecast broadcasting ❄️

[![Build](https://github.com/radio-aktywne/streamcast/actions/workflows/build.yaml/badge.svg)](https://github.com/radio-aktywne/streamcast/actions/workflows/build.yaml)
[![Docs](https://github.com/radio-aktywne/streamcast/actions/workflows/docs.yaml/badge.svg)](https://github.com/radio-aktywne/streamcast/actions/workflows/docs.yaml)

</div>

---

`streamcast` is an [Icecast](https://icecast.org) server that you can send audio to and have it broadcasted to multiple listeners.

## Usage

To start the server `cd` into `src` and run:

```sh
./start.sh
```

The server will run on [`http://localhost:8000`](http://localhost:8000).
However, you still need to mount a source first to listen to any music.

For more info about arguments, run:

```sh
./start.sh --help
```

## Configuration

Icecast can be configured by providing an `.xml` file with its configuration options.
By default, it uses the `icecast.xml` file, but you can override that with the `-c` argument.

Some special options can be set by environmental variables:

- `STREAMCAST_SOURCE_PASSWORD` overrides the `source-password` option
- `STREAMCAST_RELAY_PASSWORD` overrides the `relay-password` option
- `STREAMCAST_ADMIN_PASSWORD` overrides the `admin-password` option
- `STREAMCAST_HOST` overrides the `hostname` option
