#!/bin/bash

#
# Android shell (root)
#

./adb.sh shell su -c "$@"

# Change line 7 to `./adb.sh shell $@` if your device is not rooted.
