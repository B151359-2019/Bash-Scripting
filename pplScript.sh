#!/bin/sh
#Script counting country names in example_people_data.tsv
#variable set up and clean up
IFS=$'\t'
rm -f "CountryCount.details"
unset countries
declare -A countries=()
outfile="CountryCount.details"
cnt=0

#loop through lines, test for header and blank spaces, then increment if country exists in arr otherwise add it
while read -r name email city birthday_day birthday_month birthday_year country; do 
if test -z "$country" || test "$country" == "country" ; then
    continue
  else
  if [ -n "${countries[$country]+1}" ]
  then 
    countries[$country]=$((countries[$country]+1))
  else
     countries+=(["$country"]=1)
  fi
fi
done < example_people_data.tsv 

#count total # of countries
for i in "${countries[@]}"; do
  cnt=$((cnt+i))
done

echo $cnt " total countries" > $outfile

#write # of country and country
for cntry in "${!countries[@]}"; do 
  echo "${countries[${cntry}]}" "${cntry}" >> $outfile
done |
sort -rn -k3

unset IFS 
