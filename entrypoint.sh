#!/bin/bash

set -e

rm -f /self-metrics/tmp/pids/server.pid

if ! getent group appuser >/dev/null; then
    groupadd -g $PGID appuser
fi

if ! getent passwd appuser >/dev/null; then
    useradd -m -s /bin/bash -u $PUID -g $PGID appuser
fi

chown -R appuser:appuser /self-metrics

gosu appuser bundle exec rails db:prepare
exec gosu appuser "$@"