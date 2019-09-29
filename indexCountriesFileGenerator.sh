#!/bin/sh
#Script generating multiple files based on country

count=0
IFS=$'\t'
rm -f *.details
while read name email city birthday_day birthday_month birthday_year country
do
if test -z "$name" || test "$country" == "country"
 then
 continue
 else
 count=$((count+1))
 outfile="${country// /}".younger.details
 if test "$birthday_year" -le 1980
 then
 outfile="${country// /}".older.details
 fi #birthday before 1980
 echo -e "$count\t$name\t$city\t$country" >> "$outfile"
fi
done < example_people_data.tsv 
