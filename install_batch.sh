#!/bin/bash

#
# Install a list of packages
#

DEFAULT_LIST_PATH=install.txt

LIST_PATH="${1}"
if [ -z "${LIST_PATH}" ]; then
    LIST_PATH="${DEFAULT_LIST_PATH}"
fi

while IFS=' ' read -ra PARAMETERS; do
    printf "\n=== %s ===\n" "${PARAMETERS[1]}"

    case "${PARAMETERS[0]}" in
        local)
            ./install.sh "${PARAMETERS[1]}" "${PARAMETERS[2]}"
            ;;

        fdroid)
            ./install.sh "${PARAMETERS[1]}" "$(./fetch_fdroid.sh "${PARAMETERS[1]}" "${PARAMETERS[2]}")"
            ;;
        *)
            >&2 echo "Invalid source type '${PARAMETERS[0]}'"
            ;;
    esac
done < "${LIST_PATH}"

printf "\n=== Done ===\n"
