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

enc[4]="UTF8"			# UTF-8
enc[10]="UTF16"			# UTF-16
enc[5]="ISO8859-1"		# ISO Latin 1
enc[9]="ISO8859-2"		# ISO Latin 2
enc[30]="MacRoman"		# Mac OS Roman
enc[12]="CP1252"		# Windows Latin 1
enc[3]="EUCJIS"			# Japanese (EUC)
enc[8]="SJIS"			# Japanese (Shift JIS)
enc[1]="ASCII"			# ASCII


rm -rf "$4"/java-compiled
mkdir "$4"/java-compiled
javac "$1" -d "$4"/java-compiled -encoding ${enc[$2]} $3
status=$?

if [ $status -ne 0 ]
then
exit $status
fi

currentDir="$PWD"
cd "$4"/java-compiled/
files=`ls -1 *.class`
status=$?
if [ $status -ne 0 ]
then
exit 1
fi

# Copy the created files to current directory
cd "$currentDir"
for file in $files
do
mv -f "$4"/java-compiled/$file "$file"
done

# If javac only produced 1 file, output the name of that file without extension
count=`echo "$files" | wc -l`
if [ $count -eq 1 ]
then
for file in $files
do
length=${#file}
first=`expr $length - 6`
classname=`echo "$file" | cut -c 1-"$first"`
echo $classname
exit 0
done
fi

# Otherwise output the name of the input file without extension (this should be the same as the class name)
file="$1"
length=${#file}
first=`expr $length - 5`
classname=`echo "$file" | cut -c 1-"$first"`
echo $classname
exit 0

