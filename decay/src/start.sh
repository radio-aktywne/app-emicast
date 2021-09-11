#!/bin/sh

print_usage() {
    # Prints script usage

    cat <<EOF
Usage: $0 [-p PORT] [-c CONFIG] [-u USER]
    -p, --port                            port to listen on (default: 8000)
    -c, --config                          config file path (default: /etc/icecast2/icecast.xml)
    -u, --user                            user to run icecast with, should be in a group with the same name (default: icecast)
EOF
}

replace() {
    # Replaces value in XML config file
    # $1    - config file path
    # $2    - tag
    # $3    - value
    sed -i "s/<$2>[^<]*<\/$2>/<$2>$3<\/$2>/g" "$1"
}

safe_replace() {
    # Replaces value in XML config file if value is non-empty
    # $1    - config file path
    # $2    - tag
    # $3    - value
    if [ -n "$3" ]; then
        replace "$1" "$2" "$3"
    fi
}

port='8000'
config='/etc/icecast2/icecast.xml'
user='icecast'

while [ "$#" -gt 0 ]; do
    case "$1" in
        -p|--port) shift; port="$1" ;;
        -c|--config) shift; config="$1" ;;
        -u|--user) shift; user="$1" ;;
        -h|--help) print_usage; exit;;
    esac
    shift
done

# replace default options with environmental ones
safe_replace "$config" 'source-password' "$DECAY_SOURCE_PASSWORD"
safe_replace "$config" 'relay-password'  "$DECAY_RELAY_PASSWORD"
safe_replace "$config" 'admin-password'  "$DECAY_ADMIN_PASSWORD"
safe_replace "$config" 'hostname'        "$DECAY_HOST"
safe_replace "$config" 'port'            "$port"
safe_replace "$config" 'user'            "$user"
safe_replace "$config" 'group'           "$user"

icecast -b -c "$config"                 # start icecast in background
tail -F /var/log/icecast2/error.log     # follow logs live
