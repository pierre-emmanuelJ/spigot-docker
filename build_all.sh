#!/bin/bash

ALL_VERSIONS="1.13 1.13.1 1.13.12 1.14 1.14.1 1.14.2 1.14.3 1.14.4 1.15 1.15.1 1.15.2 latest"


for v in $ALL_VERSIONS; do
    SPIGOT_REV="$v" make docker && make docker-push
done
