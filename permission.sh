#!/bin/sh
##################################################################
# Find Directories and Change Permissions
# Summary: 
# This script explores the usage of the find command from the 
# UNIX shell. The find command allows the user to find files
# and directories corresponding in the system  as well as excute
# or print desired content. The find command allows lots of usage
# mostly with the execute commands as it can run another command
# on the found directory and manipulate the data futher.
##################################################################
DIR=/share/programs/
# 1. Print all files, directories, etc. owned by user under directory /share
# 2. Print all regular files owned by use under the directory /share
echo "-------------FIND USER OWNED FILES/DIRECTORIES IN SHARE-------------"
find /share -type f -user "@" -print ;
find /share -type d -user "@" -print ;

# 3. Pring all empty directories under /usr/src
echo "-------------FIND EMPTY DIRECTORIES IN SOURCE---------------"
find /usr/src -type d -empty ;

# 4. Set the setgid bit on all directories under /share/project
echo "-------------SETGUID ON ALL DIRECTORIES IN SHARE--------------"
find /share/project/ -maxdepth 5 -type d -print -exec chmod 4555 {} /share/project/ \;

# 5. Make all executable files under /share/programs non-writeable
echo "-------------MAKE EXECUTABLES NON-WRITEABLE---------------"
for file in $DIR; do
	find /share/programs/ -executable -type f -print -exec chattr +i {} /share/programs/.. \;
done

