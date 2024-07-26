---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `EMICAST__SERVER__HOST` -
  host to bind to
  (default: `0.0.0.0`)
- `EMICAST__SERVER__PORT` -
  port to bind to
  (default: `8000`)
- `EMICAST__CREDENTIALS__ADMIN__USER` -
  admin username
  (default: `admin`)
- `EMICAST__CREDENTIALS__ADMIN__PASSWORD` -
  admin password
  (default: `password`)
- `EMICAST__CREDENTIALS__SOURCE__USER` -
  username for clients that want to send audio to the server
  (default: `source`)
- `EMICAST__CREDENTIALS__SOURCE__PASSWORD` -
  password for clients that want to send audio to the server
  (default: `password`)
