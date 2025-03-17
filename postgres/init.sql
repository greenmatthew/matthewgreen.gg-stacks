-- Create databases
CREATE DATABASE immich;
CREATE DATABASE nextcloud;
CREATE DATABASE mealie;
CREATE DATABASE gamevault;
CREATE DATABASE plex;

-- Create users with passwords from environment variables
CREATE USER immich WITH PASSWORD '${IMMICH_DB_PASSWORD}';
CREATE USER nextcloud WITH PASSWORD '${NEXTCLOUD_DB_PASSWORD}';
CREATE USER mealie WITH PASSWORD '${MEALIE_DB_PASSWORD}';
CREATE USER gamevault WITH PASSWORD '${GAMEVAULT_DB_PASSWORD}';
CREATE USER plex WITH PASSWORD '${PLEX_DB_PASSWORD}';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE immich TO immich;
GRANT ALL PRIVILEGES ON DATABASE nextcloud TO nextcloud;
GRANT ALL PRIVILEGES ON DATABASE mealie TO mealie;
GRANT ALL PRIVILEGES ON DATABASE gamevault TO gamevault;
GRANT ALL PRIVILEGES ON DATABASE plex TO plex;

-- Connect to immich database and set up extensions
\c immich
CREATE EXTENSION IF NOT EXISTS vectors;
ALTER DATABASE immich OWNER TO immich;

-- Connect to nextcloud database and set up extensions
\c nextcloud
CREATE EXTENSION IF NOT EXISTS pg_trgm;
ALTER DATABASE nextcloud OWNER TO nextcloud;

-- Connect to mealie database
\c mealie
ALTER DATABASE mealie OWNER TO mealie;

-- Connect to gamevault database
\c gamevault
ALTER DATABASE gamevault OWNER TO gamevault;

-- Connect to plex database
\c plex
ALTER DATABASE plex OWNER TO plex;

-- Return to postgres database
\c postgres