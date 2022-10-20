echo "<background>" >> background-0.xml
echo "  <starttime>" >> background-0.xml
echo "    <year>2009</year>" >> background-0.xml
echo "    <month>08</month>" >> background-0.xml
echo "    <day>04</day>" >> background-0.xml
echo "    <hour>00</hour>" >> background-0.xml
echo "    <minute>00</minute>" >> background-0.xml
echo "    <second>00</second>" >> background-0.xml
echo "  </starttime>" >> background-0.xml
echo "<!-- This animation will start at midnight. -->" >> background-0.xml
echo "  <static>" >> background-0.xml
echo "    <duration>1795.0</duration>" >> background-0.xml

for a in /tmp/aa/*; do
	echo "<to>$a</to>" >> background-0.xml
	echo "</transition>" >> background-0.xml
	echo "--" >> background-0.xml
	echo "<static>" >> background-0.xml
	echo "<duration>1795.0</duration>" >> background-0.xml
	echo "<file>$a</file>" >> background-0.xml
	echo "</static>" >> background-0.xml
	echo "--" >> background-0.xml
	echo "<transition>" >> background-0.xml
	echo "<duration>5.0</duration>" >> background-0.xml
	echo "<from>$a</from> " >> background-0.xml
done
