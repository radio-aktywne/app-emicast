---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the service at runtime using various environment variables:

- `QUOKKA__SERVER__HOST` -
  host to bind to
  (default: `0.0.0.0`)
- `QUOKKA__SERVER__PORT` -
  port to bind to
  (default: `10000`)
- `QUOKKA__CREDENTIALS__ADMIN__USER` -
  admin username
  (default: `admin`)
- `QUOKKA__CREDENTIALS__ADMIN__PASSWORD` -
  admin password
  (default: `password`)
- `QUOKKA__CREDENTIALS__SOURCE__USER` -
  username for clients that want to send audio to the server
  (default: `source`)
- `QUOKKA__CREDENTIALS__SOURCE__PASSWORD` -
  password for clients that want to send audio to the server
  (default: `password`)
