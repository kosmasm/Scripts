#!/bin/bash

####### CONFIG LINES ########
path="/home/kosmas/.eortologion"
execut=" -q "
temp="/home/kosmas/.eortologion/temp"
#### END OF CONFIG LINES ####
cd $path
for i 
do
execut=`echo "$execut" "$i"` 
done
eortologion $execut > "$temp"
msg=`cat "$temp"`
zenity --title="Εορτολόγιο" --info --height 400 --text "$msg" --no-wrap
rm "$temp"
