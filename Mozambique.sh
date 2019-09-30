#!/bin/sh
#Script filtering example_people_data.tsv for Mozambique
#setting vars
IFS=$'\t'
fnr=0
wantedCountry="Mozambique"
inputFile="example_people_data.tsv"
inputFileLength="$(wc -l $inputFile | cut -d ' ' -f1)"
outfile="Country.$wantedCountry.details"

#initial Actions
rm -f *.details
unset my_array
my_array=()

#Main Actions
while read name email city birthdayDay birthdayMonth birthdayYear country
do
  fnr=$((fnr+1))
  if test -z "$name" || test "$country"="country"
  then
    echo "" > /dev/null
  else
    if test "$country"=="$wantedCountry"
    then
      my_array+="$fnr\t$name\t$country"
    fi
  fi
done < $inputFile
#end of the file
echo -e "\n### Here are the end of file results for $wantedCountry: " > $outfile
for i in "${my_array[@]}"
do
  echo -e "$i"
  echo "looping"
done
