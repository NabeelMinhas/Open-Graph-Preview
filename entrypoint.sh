#!/bin/bash

set -e


# Run database setup and migration
bundle exec rails db:create
bundle exec rails db:migrate

# Start the Rails server
exec "$@"
