#!/bin/bash

#
# Uninstall a package and its data
#

PACKAGE="${1}"

DELETE_LIST=delete.txt
if [ -z "$(grep "^${PACKAGE}$" "${DELETE_LIST}")" ]; then
    echo "${PACKAGE}" >> "${DELETE_LIST}"
fi

echo "Eliminating package '${PACKAGE}'"

echo "Suspending..."
./pm.sh suspend --user 0 "${PACKAGE}"
./pm.sh suspend "${PACKAGE}"

echo "Resetting permissions..."
./pm.sh reset-permissions --user 0 "${PACKAGE}"
./pm.sh reset-permissions "${PACKAGE}"

echo "Clearing..."
./pm.sh clear --user 0 "${PACKAGE}"
./pm.sh clear "${PACKAGE}"

echo "Disabling..."
./pm.sh disable --user 0 "${PACKAGE}"
./pm.sh disable "${PACKAGE}"

echo "Uninstalling..."
./pm.sh uninstall --user 0 "${PACKAGE}"
./pm.sh uninstall "${PACKAGE}"
