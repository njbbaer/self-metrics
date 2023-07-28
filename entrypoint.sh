#!/bin/bash

set -e

rm -f /self-metrics/tmp/pids/server.pid

groupadd -g $PGID appuser
useradd -m -s /bin/bash -u $PUID -g $PGID appuser
chown -R appuser:appuser /self-metrics

gosu appuser bundle exec rails db:prepare
exec gosu appuser "$@"