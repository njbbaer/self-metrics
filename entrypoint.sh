#!/bin/bash

set -e

rm -f /self-metrics/tmp/pids/server.pid

groupadd -g $PGID dockeruser
useradd -m -s /bin/bash -u $PUID -g $PGID dockeruser
chown -R dockeruser:dockeruser /self-metrics

gosu dockeruser bundle exec rails db:prepare
exec gosu dockeruser "$@"