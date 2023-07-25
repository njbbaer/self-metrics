#!/bin/bash
set -e

# Ensure server PID file does not exist
rm -f /myapp/tmp/pids/server.pid

# Check if the database exists and is migrated
bundle exec rake db:version || bundle exec rake db:setup
bundle exec rake db:migrate

# Execute the container's main process
exec "$@"