#!/bin/bash

compname=`echo "$1" | sed 's/\(.*\)\..*/\1/'`
clang -arch armv7 -isysroot `xcode-select --print-path`/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.0.sdk "$1" -o "$compname"
status=$?
if [ $status -ne 0 ]
then
    exit 1
fi
echo $compname
exit 0