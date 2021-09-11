# Configuration

Icecast can be configured by providing an `.xml` file with its configuration options.

By default it uses the `icecast.xml` file but you can override that with the `-c` argument.

For more info see here: https://icecast.org/docs/icecast-latest/config-file.html

# Overriding config file

Some special options can be set by environmental variables:

- `DECAY_SOURCE_PASSWORD` overrides the `source-password` option
- `DECAY_RELAY_PASSWORD` overrides the `relay-password` option
- `DECAY_ADMIN_PASSWORD` overrides the `admin-password` option
- `DECAY_HOST` overrides the `hostname` option

And some can be set by start script arguments:

- `-p PORT` overrides the `port` option
