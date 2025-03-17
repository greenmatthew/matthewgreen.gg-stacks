# PostgreSQL Stack

This directory contains the configuration for a centralized PostgreSQL database server with pgAdmin for web-based management.

## Features

- PostgreSQL server with vector search capabilities (pgvecto-rs)
- Web-based management via pgAdmin
- Persistent storage using host filesystem mounts
- Traefik integration for secure web access
- Shared network for application access

## Setup Instructions

1. Create the required directories on your host:
   ```bash
   mkdir -p /mnt/data/postgres /mnt/data/pgadmin
   ```

2. Ensure proper permissions:
   ```bash
   chmod 700 /mnt/data/postgres /mnt/data/pgadmin
   ```

3. Create your `.env` file:
   ```bash
   cp .env.example .env
   # Edit .env with your specific values
   ```

4. Deploy the stack:
   ```bash
   docker-compose up -d
   ```

## Connecting Applications

Other applications can connect to this PostgreSQL server by:

1. Using the `postgres_network` Docker network
2. Connecting to the host `postgres` on port `5432`
3. Using the database credentials defined in the application's specific environment

For best practices, use the postgres-init container to initialize application-specific databases:

```yaml
services:
  app-db-init:
    image: greenmatthew/postgres-init:latest
    environment:
      PG_HOST: postgres
      PG_ADMIN_USER: postgres
      PG_ADMIN_PASSWORD: ${POSTGRES_PASSWORD}
      APP_DB_NAME: myapp
      APP_DB_USER: myapp
      APP_DB_PASSWORD: ${MYAPP_DB_PASSWORD}
      DB_EXTENSIONS: pg_trgm
    networks:
      - postgres_network
```

## Accessing pgAdmin

Once deployed, you can access pgAdmin at:

- With Traefik enabled (`USE_TRAEFIK` set): https://[PGADMIN_DOMAIN]
- Without Traefik: http://[your-server-ip]:[PGADMIN_PORT] (default port is 5050)

Add a new server connection with:
- Host: postgres
- Port: 5432
- Username: [POSTGRES_USER]
- Password: [POSTGRES_PASSWORD]