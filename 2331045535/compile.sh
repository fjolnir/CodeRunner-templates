#!/bin/bash

compname=`echo "$1" | sed 's/\(.*\)\..*/\1\.bc/'`
PATH=/usr/local/clang/bin:$PATH
llvm-as "$1" -o "$compname"
llvm-ld "$compname"
status=$?
if [ $status -ne 0 ]
then
    exit 1
fi
echo "`pwd`/a.out.bc"
exit 0