# 
# List only the lines describing the problem in the kernel change page
#
#!/bin/bash
[ -f $1 ] || { echo No file given. Exiting.; exit 1; }
grep -A2 Date: $1 | grep -v Date: | grep -v ^$ | grep -v ^-- |  cut -c5- | sort | grep -v ^Linux
