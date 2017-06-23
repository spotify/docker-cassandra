#!/usr/bin/env bash

set -eo pipefail

HOST="$(hostname --ip-address || echo '127.0.0.1')"

if cqlsh -u cassandra -p cassandra "$HOST" <<< "describe keyspaces;"; then
    # look for additional, on the container volumes health check scripts
    HEALTHD="/var/lib/cassandra/health";

    if [ -d "$HEALTHD" ]
    then
        for f in `find "$HEALTHD" -type f -perm /a+x`
            do eval "HOST=\"$HOST\" \"$f\"" || exit 1
        done;
    fi;

    exit 0
fi

exit 1
