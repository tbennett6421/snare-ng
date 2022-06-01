while IFS="" read -r p || [ -n "$p" ]
do
  nikto -host $p -output $p.xml &
done < webservers.lst
