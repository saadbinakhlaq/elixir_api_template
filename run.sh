#!/bin/bash

set -e


# Ensure the app's dependencies are installed
echo "\n Running dependencies"
mix deps.get

# Prepare Dialyzer if the project has Dialyxer set up
if mix help dialyzer >/dev/null 2>&1
then
  echo "\nFound Dialyxer: Setting up PLT..."
  mix do deps.compile, dialyzer --plt
else
  echo "\nNo Dialyxer config: Skipping setup..."
fi

# Wait for Postgres to become available.
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

echo "\nPostgres is available: continuing with database setup..."

if psql -lqt -h db -U postgres | cut -d \| -f 1 | grep -qw ${MYAPP}_dev; then
    echo "database ${MYAPP}_dev exists"
else
    echo "database  does not exists"
    echo "creating db: ${MYAPP}"
    mix ecto.create
fi

echo "\n Launching Phoenix web server..."
# Start the phoenix web server
mix phx.server