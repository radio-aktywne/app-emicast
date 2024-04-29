---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `STREAMCAST__SERVER__HOST` -
  host to bind to
  (default: `0.0.0.0`)
- `STREAMCAST__SERVER__PORT` -
  port to bind to
  (default: `8000`)
- `STREAMCAST__CREDENTIALS__ADMIN__USER` -
  admin username
  (default: `admin`)
- `STREAMCAST__CREDENTIALS__ADMIN__PASSWORD` -
  admin password
  (default: `password`)
- `STREAMCAST__CREDENTIALS__SOURCE__USER` -
  username for clients that want to send audio to the server
  (default: `source`)
- `STREAMCAST__CREDENTIALS__SOURCE__PASSWORD` -
  password for clients that want to send audio to the server
  (default: `password`)
