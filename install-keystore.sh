#!/bin/sh

BUILD_SRC_ROOT=$BUILD_SOURCESDIRECTORY
KEYSTORE_FILENAME="keystore"

if [ ! -z "$2" ]; then
	BUILD_SRC_ROOT="$2"
fi

if [ ! -z "$3" ]; then
	KEYSTORE_FILENAME="$3"
fi

if [ -z "$1" ]; then
	echo "Keystore is missing."
	exit 1
fi

if [ -z "$BUILD_SRC_ROOT" ]; then
	echo "Source code root directory is not specified."
	exit 1
fi

# Create .certs directory under the source root if doesn't exist
[ -d "$BUILD_SRC_ROOT/.certs" ] || mkdir -p "$BUILD_SRC_ROOT/.certs"

# Decode the base64-encoded certificate contexts to the files
echo "$1" | base64 --decode > "$BUILD_SRC_ROOT/.certs/$KEYSTORE_FILENAME.jks"


exit 0