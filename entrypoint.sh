#!/bin/bash

set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /self-metrics/tmp/pids/server.pid

# Create appuser group if it does not exists
if ! getent group appuser >/dev/null; then
    groupadd -g $PGID appuser
fi

# Create appuser if it does not exist
if ! getent passwd appuser >/dev/null; then
    useradd -m -s /bin/bash -u $PUID -g $PGID appuser
fi

# Set ownership of the app dir
chown -R appuser:appuser /self-metrics

# Setup database
gosu appuser bundle exec rails db:prepare

# Execute command
exec gosu appuser "$@"