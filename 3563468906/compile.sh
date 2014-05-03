#!/bin/bash

compname=`echo "$1" | sed 's/\(.*\)\..*/\1/'`
clang -arch i386 "$1" -o "$compname"
status=$?
if [ $status -ne 0 ]
then
    exit 1
fi
echo $compname
exit 0