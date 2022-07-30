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

for PACKAGE in $(comm -12 installed.txt "${LIST_PATH}"); do
    printf "\n=== %s ===\n" "${PACKAGE}"
    ./uninstall.sh "${PACKAGE}"
done

printf "\n=== Done ===\n"
