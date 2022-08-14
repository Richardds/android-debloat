#!/bin/bash

#
# Install a package located in install directory
#

PACKAGE="${1}"
VERSION_CODE="${2}"

if [ -z "${PACKAGE}" ]; then
    >&2 echo 'Missing package ID argument'
    exit 22
fi

if [ -z "${VERSION_CODE}" ]; then
    APK_PATH="install/${PACKAGE}.apk"
else
    APK_PATH="install/${PACKAGE}@${VERSION_CODE}.apk"
fi

if [ -f "${APK_PATH}" ]; then
    ./adb.sh install -r -d "${APK_PATH}"
else
    >&2 echo "Package '${PACKAGE}' of version code '${VERSION_CODE}' not found."
    exit 2
fi
