#!/bin/bash

set -e

for APP in $(./pm.sh list packages -3 -f); do
  APP_PATH="$(sed -nr 's/package:(.+)\/base.apk=.+$/\1\/base.apk/p' <<< "${APP}")"
  APP_ID="$(sed -nr 's/package:.+\/base.apk=(.+)$/\1/p' <<< "${APP}")"

  APP_ID="${APP_ID%%[[:cntrl:]]}"

  ./adb.sh pull "${APP_PATH}" "backup/${APP_ID}.apk"
  ./adb.sh backup -f "backup/${APP_ID}.ab" "${APP_ID}"
done

printf "\n=== Done ===\n"
