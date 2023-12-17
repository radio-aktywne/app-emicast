#!/bin/sh

tmpconfig="$(mktemp)"

# Replace environment variables in config file and save to temporary file
envsubst <src/config.xml >"${tmpconfig}"

# Start Icecast
icecast -c "${tmpconfig}"

# Cleanup
rm --force "${tmpconfig}"
