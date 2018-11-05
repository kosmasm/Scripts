SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
subject="'Emailing file(s):"
for a in $*; do
c="${a##*/}"
subject=${subject}${c},\
done
subject=`echo $subject|sed s/\ $//`
subject=`echo $subject|sed s/,$/\'/`
att="'"
for a in $*; do
att="${att}file://$a,"
done
att=`echo $att|sed s/,$/\'/`
thunderbird -compose subject=${subject},attachment=$att
IFS=$SAVEIFS
