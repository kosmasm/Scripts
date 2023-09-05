#!/bin/bash

updates=$( yum check-update )

if [ $? = 100 ]
then
echo -e "<img>/usr/share/icons/oxygen/22x22/emblems/emblem-important.png</img>"
echo -e "<tool>Updates Available</tool>"
echo -e "<click>gpk-update-viewer</click>"
else
echo -e "<img>/usr/share/icons/oxygen/22x22/actions/dialog-ok.png</img>"
echo -e "<tool>all updates applied</tool>"
echo -e "<click>gpk-update-viewer</click>"
fi
