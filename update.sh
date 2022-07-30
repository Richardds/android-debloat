#!/bin/bash

#
# Updates the list of packages installed on the device
#

./pm.sh list packages | grep -v '^$' | cut -d: -f2 | sort > installed.txt
