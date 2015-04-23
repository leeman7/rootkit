#!/bin/sh
##################################################
#	FIND
# Author: Lee Nardo
# Date: 2/22/2015
# Class: UNIX Programming
# File: find.sh
#
##################################################
#
#Summary:
#   This is the .sh or script for drill3 that 
#  searches the base directory and preceding 
#  directories above for files associated
#  with the file name requested. If the script
#  does not file the file or reaches the root
#  directory the script will terminate with an
#  error code, stating the file was not found.
#
##################################################

# VARIABLES
DIR=pwd
FILE=$1
ROOT=$($HOME|cd ..|cd ..)

# check if file was entered in standard input
if [ $1 ];then
	echo "-----SEARCHING FOR FILE:$FILE-----"
# The while loop is used to control the logic to
# search the next directory above for the file.
	while [ $DIR ];do
# this if statement controls the structure to move 
# up in directories if the file we are searching for
# is not found.
		if [ -e $FILE ];then
			echo "file exists";exit 0
		elif [ "$DIR" -ef / ];then
			echo "root reached";exit 1
		else
			echo "moving up";cd ..;DIR=pwd
		fi
	done
# no file entered in standard input, proceed to send to standard error
# and exit with error status 2
elif [ $1 2>&0 ]; then
	exit 2
fi
