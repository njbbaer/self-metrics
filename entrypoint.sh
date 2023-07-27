#!/bin/bash

set -e

# Ensure server PID file does not exist
rm -f /self-metrics/tmp/pids/server.pid

bundle exec rails db:version || bundle exec rails db:setup
bundle exec rails db:migrate

exec "$@"