#!/bin/bash

set -e

# Ensure server PID file does not exist
rm -f /self-metrics/tmp/pids/server.pid

bundle exec rails db:prepare

exec "$@"