#!/bin/bash

#
# Android asset packaging tool
#

AAPT_WSL_PATH=/mnt/c/Development/Android/build-tools/33.0.0/aapt.exe

if [ "$(uname -a | grep microsoft-standard-WSL)" ]; then
    "${AAPT_WSL_PATH}" ${@} | dos2unix
else
    aapt ${@}
fi
