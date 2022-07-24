#!/bin/bash

#
# Uninstall a list of packages
#

DEFAULT_LIST_PATH=delete.txt

LIST_PATH="${1}"
if [ -z "${LIST_PATH}" ]; then
    LIST_PATH="${DEFAULT_LIST_PATH}"
fi

./update.sh

comm -12 installed.txt "${LIST_PATH}" | while read PACKAGE; do
    printf "\n=== %s ===\n" "${PACKAGE}"
    ./uninstall.sh "${PACKAGE}"
done

printf "\n=== Done ===\n"
