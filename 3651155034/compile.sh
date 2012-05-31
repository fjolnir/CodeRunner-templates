#!/bin/bash

compname=`echo "$1" | sed 's/\(.*\)\..*/\1/'`
/usr/local/bin/nasm -fmacho64 "$1" -o "$4/$1.o"
status=$?
if [ $status -ne 0 ]
then
    exit 1
fi
ld "$4/$1.o" -o "$compname" -macosx_version_min 10.7
if [ $status -ne 0 ]
then
    exit 1
fi
echo $compname
exit 0