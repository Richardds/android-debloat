#!/bin/bash

REPOSIOTRY_URL=https://f-droid.org/repo/
API_URL=https://f-droid.org/api/v1/

PACKAGE="${1}"
VERSION="${2}"

if [ -z "${PACKAGE}" ]; then
    >&2 echo 'Missing package ID argument'
    exit 22
fi

# Fetch package metadata via F-Droid API
PACKAGE_API_URL="${API_URL}/packages/${PACKAGE}"
PACKAGE_METADATA=$(wget --tries=3 -qO - "${PACKAGE_API_URL}")

# Validate API response
if [ "$(jq -r 'has("error")' <<< "${PACKAGE_METADATA}")" == 'true' ]; then
    ERROR="$(jq -r .errror <<< "${PACKAGE_METADATA}")"
    >&2 echo "Failed to fetch metadata of package '${PACKAGE}'. Error: ${ERROR}"
    exit 2
fi

# Validate desired package version
if [ -z "${VERSION}" ]; then
    # Get suggested version
    VERSION_CODE=$(jq -r .suggestedVersionCode <<< "${PACKAGE_METADATA}")
else
    VERSION_CODE="$(jq -r ".packages[] | select(.versionName == \"${VERSION}\") | .versionCode" <<< "${PACKAGE_METADATA}")"
    # Check for version availability
    if [ -z "${VERSION_CODE}" ] || [ "${VERSION_CODE}" == 'null' ]; then
        >&2 echo "Version '${VERSION}' of package '${PACKAGE}' is not available."
        >&2 echo "Following versions are available:"
        jq -r '.packages[] | .versionName' <<< "${PACKAGE_METADATA}" >&2
        exit 2
    fi
fi

APK_PATH="install/${PACKAGE}@${VERSION_CODE}.apk"

if [ ! -f "${APK_PATH}" ]; then
    APK_URL="${REPOSIOTRY_URL}/${PACKAGE}_${VERSION_CODE}.apk"
    wget --tries=3 --show-progress --progress=bar -qO "${APK_PATH}" "${APK_URL}"
fi

echo "${VERSION_CODE}"
