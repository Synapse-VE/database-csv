#!/bin/bash

set -e

if ! docker ps --format '{{.Names}}' | grep -q "^$POSTGRES_CONTAINER_NAME$"; then
  echo "[Global Ranking] Error: The PostgreSQL container '$POSTGRES_CONTAINER_NAME' is not running."
  exit 1
elif [ -z "$POSTGRES_CONTAINER_NAME" ]; then
  echo "[Global Ranking] Error: Please set the 'POSTGRES_CONTAINER_NAME' environment variable."
  exit 1
elif [ -z "$SQL_USER" ]; then
  echo "[Global Ranking] Error: Please set the 'SQL_USER' environment variable."
  exit 1
elif [ -z "$SQL_PASSWORD" ]; then
  echo "[Global Ranking] Error: Please set the 'SQL_PASSWORD' environment variable."
  exit 1
fi

GLOBAL_DB="empire-ranking-global"

DBS=$(docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d postgres -t -c \
  "SELECT datname FROM pg_database WHERE datistemplate = false AND datname NOT IN ('postgres', 'template0', 'template1', '$GLOBAL_DB')")

docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "CREATE EXTENSION IF NOT EXISTS postgres_fdw;"

docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "DROP VIEW IF EXISTS players_global CASCADE; DROP MATERIALIZED VIEW IF EXISTS global_ranking;"

VIEW_SQL=""
UNION_SQL=""

escape_sql() {
  echo "$1" | sed "s/'/''/g"
}

for DB in $DBS; do
  if [[ "$DB" == "empire-ranking" ]]; then
    # Special case for the default region "fr1"
    REGION="fr1"
  else
    REGION=$(echo "$DB" | sed 's/empire-ranking-//')
  fi

  echo "Configuring foreign table for region: $REGION (database: $DB)"

  docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
    psql -U $SQL_USER -d $GLOBAL_DB -c \
    "DROP SERVER IF EXISTS ${REGION}_server CASCADE; CREATE SERVER ${REGION}_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '$DB', host 'localhost');"

  USER_ESCAPED=$(escape_sql "$SQL_USER")
  PASS_ESCAPED=$(escape_sql "$SQL_PASSWORD")

  docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
    psql -U $SQL_USER -d $GLOBAL_DB -c \
    "CREATE USER MAPPING IF NOT EXISTS FOR \"$SQL_USER\" SERVER ${REGION}_server OPTIONS (user '$USER_ESCAPED', password '$PASS_ESCAPED');"

  docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
    psql -U $SQL_USER -d $GLOBAL_DB -c \
    "DROP FOREIGN TABLE IF EXISTS players_${REGION}; CREATE FOREIGN TABLE players_${REGION} (id BIGINT, might_current BIGINT) SERVER ${REGION}_server OPTIONS (schema_name 'public', table_name 'players');"

  if [ -z "$UNION_SQL" ]; then
    UNION_SQL="SELECT '$REGION' AS region, id, might_current FROM players_${REGION}"
  else
    UNION_SQL="$UNION_SQL UNION ALL SELECT '$REGION', id, might_current FROM players_${REGION}"
  fi
done

docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "CREATE VIEW players_global AS $UNION_SQL;"

docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "CREATE MATERIALIZED VIEW global_ranking AS SELECT region, id, RANK() OVER (ORDER BY might_current DESC) AS global_rank FROM players_global;"

docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "CREATE UNIQUE INDEX global_ranking_unique_idx ON global_ranking(region, id);"

echo "[Global Ranking] Setup complete. Refreshing the global ranking materialized view..."
docker exec -e PGPASSWORD=$SQL_PASSWORD $POSTGRES_CONTAINER_NAME \
  psql -U $SQL_USER -d $GLOBAL_DB -c \
  "REFRESH MATERIALIZED VIEW CONCURRENTLY global_ranking;"


#echo "docker exec -e PGPASSWORD=\$SQL_PASSWORD $POSTGRES_CONTAINER_NAME psql -U $SQL_USER -d $GLOBAL_DB -c 'REFRESH MATERIALIZED VIEW CONCURRENTLY global_ranking;'"
