#!/bin/sh
#Script counting country names in example_people_data.tsv

IFS=$'\t'

declare -iA countries

while read -r line; do
  country=$(cut -f7)
  if [[ -z "${countries[${country}]}" ]]
  then 
    let '++countries[$country]'
  else
     countries+=(["$country"]=1)
  fi
done < example_people_data.tsv 

for cntry in "${!countries[@]}"; do 
  echo "${cntry}" "${countries[${cntry}]}"
done

unset IFS 
