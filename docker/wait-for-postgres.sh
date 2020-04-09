#!/bin/sh
# wait-for-postgres.sh

set -e

POSTGRES_PASSWORD=postgres

until PGPASSWORD=$POSTGRES_PASSWORD psql -h postgres -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

echo "Postgres is up - executing command"
