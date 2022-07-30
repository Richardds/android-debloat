#!/bin/bash

#
# Android debug bridge
#

ADB_WSL_PATH=/mnt/c/Development/Android/platform-tools/adb.exe

if [ "$(uname -a | grep microsoft-standard-WSL)" ]; then
    "${ADB_WSL_PATH}" $@ | dos2unix
else
    adb $@
fi
