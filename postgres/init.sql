-- Create databases
CREATE DATABASE immich;
CREATE DATABASE nextcloud;
CREATE DATABASE mealie;
CREATE DATABASE gamevault;
CREATE DATABASE plex;

-- Create users with passwords
CREATE USER immich WITH PASSWORD 'immich_password';
CREATE USER nextcloud WITH PASSWORD 'nextcloud_password';
CREATE USER mealie WITH PASSWORD 'mealie_password';
CREATE USER gamevault WITH PASSWORD 'gamevault_password';
CREATE USER plex WITH PASSWORD 'plex_password';

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