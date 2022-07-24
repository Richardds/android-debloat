#!/bin/bash

#
# Updates the list of packages installed on the device
#

./pm.sh list packages | grep -v '^$' | sort | cut -d: -f2 > installed.txt
