#!/bin/sh
#Script practicing appending data to country from  example_people_data.tsv
#variable set up and clean up
IFS=$'\t'
rm -f "CountryCount.details"
unset countries
declare -A countries=()
outfile="CountryCount.details"
cnt=0
ln=0
#loop through lines, test for header and blank spaces, then increment if country exists in arr otherwise add it
while read -r name email city birthday_day birthday_month birthday_year country; do 
ln=$((ln+1))
if test -z "$country" || test "$country" == "country" ; then
    continue
  else
  if [ -n "${countries[$country]+1}" ]
  then 
    countries+=(["$country"]+=("$ln\t$name\t$country"))
  else
     countries+=(["$country"]=("$ln\t$name\t$country"))
  fi
fi
done < example_people_data.tsv 
echo "${countries[@]}"
#write # of country and country
#for cntry in "${!countries[@]}"; do 
#  echo "${countries[${cntry}]}" "${cntry}" >> $outfile
#done

unset IFS 
