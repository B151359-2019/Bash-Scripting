#Script counting country names in example_people_data.tsv
IFS=$'\t'
declare -A countries
while read line
do
country=$(cut -f7)
countries[$country]=0
done < example_people_data.tsv 

for cntry in ${!countries[@]}; do 
  echo $cntry
done

unset IFS
