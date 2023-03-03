#!/bin/bash
set -ex

echo 'Database initialization start ====================='

psql <<-EOSQL
	SELECT 'CREATE DATABASE $DB'
	WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB')\gexec
	DO \$\$
	BEGIN
		IF EXISTS (
			SELECT FROM pg_catalog.pg_roles
			WHERE  rolname = '$DBUSER') THEN
			RAISE NOTICE 'Role $DBUSER already exists. Skipping.';
		ELSE
			CREATE USER $DBUSER WITH PASSWORD '$DBUSER_PASSWD';
			GRANT ALL PRIVILEGES ON DATABASE $DB TO $DBUSER;
			ALTER DATABASE $DB OWNER TO $DBUSER;
		END IF;
	END \$\$;
EOSQL