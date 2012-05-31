#!/bin/bash

compname=`echo "$1" | sed 's/\(.*\)\..*/\1\.bc/'`
/usr/local/clang/bin/llvm-as "$1" -o "$compname"
status=$?
if [ $status -ne 0 ]
then
    exit 1
fi
echo $4/$compname
exit 0