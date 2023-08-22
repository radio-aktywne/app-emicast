#!/bin/sh

replace() {
	# Replace value in XML file
	# $1    - file path
	# $2    - XPath
	# $3    - value

	xmlstarlet edit --inplace --update "$2" --value "$3" "$1"
}

safe_replace() {
	# Replace value in XML file if value is non-empty
	# $1    - file path
	# $2    - XPath
	# $3    - value

	if [ -n "$3" ]; then
		replace "$1" "$2" "$3"
	fi
}

config="$(mktemp --tmpdir=/tmp)"

# Create a copy of the config file
cat ./src/config.xml >"${config}"

# Replace values in the config file
safe_replace "${config}" '/icecast/authentication/source-password' "${STREAMCAST_SOURCE_PASSWORD:-}"
safe_replace "${config}" '/icecast/authentication/admin-user' "${STREAMCAST_ADMIN_USER:-}"
safe_replace "${config}" '/icecast/authentication/admin-password' "${STREAMCAST_ADMIN_PASSWORD:-}"
safe_replace "${config}" '/icecast/hostname' "${STREAMCAST_HOST:-}"
safe_replace "${config}" '/icecast/listen-socket/port' "${STREAMCAST_PORT:-}"

# Start icecast
icecast -c "${config}"

# Remove the copied config file
rm --force "${config}"
