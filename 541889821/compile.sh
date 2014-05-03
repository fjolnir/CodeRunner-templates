#!/bin/bash
# This is a CodeRunner compilation script. Compilation scripts are used to
# compile code before being run using the run command specified in CodeRunner
# preferences. This script should have the following properties:
#
# Launch directory ($PWD):		Will be the same as the file being run
#
# Exit status:					Should be 0 on success (will cause CodeRunner
#								to continue and execute the run command)
#
# Output (stdout):				On success, one line of text which can be accessed
#								using the $compiler variable in the run command
#
# Output (stderr):				Anything outputted here will be displayed in
#								the CodeRunner console
#
# Arguments:					$1	Filename of the source file
#								$2	Encoding of the source file
#								$3	Compilation flags set in CodeRunner preferences
#								$4	Path of a temporary directory (without / suffix)


compname=`echo "$1" | sed 's/\(.*\)\..*/\1/'`
/usr/local/tranquil/bin/tqc "$1" -o "$compname" $3
status=$?
if [ $status -eq 0 ]
then
    echo $compname
    exit 0
fi
exit $status