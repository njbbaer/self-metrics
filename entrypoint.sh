#!/bin/bash

set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /self-metrics/tmp/pids/server.pid

# Setup database
bundle exec rails db:prepare

# Execute command
exec "$@"