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
#
# The encoding argument may be used to specify to the compiler which encoding
# the source file uses. It will be one of the integers in the following array:

enc[4]=""			# UTF-8
enc[10]=""			# UTF-16
enc[5]=""			# ISO Latin 1
enc[9]=""			# ISO Latin 2
enc[30]=""			# Mac OS Roman
enc[12]=""			# Windows Latin 1
enc[3]=""			# Japanese (EUC)
enc[8]=""			# Japanese (Shift JIS)
enc[1]=""			# ASCII


