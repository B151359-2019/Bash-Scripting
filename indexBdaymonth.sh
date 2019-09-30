#!/bin/sh
#Script sorting and separating people by birthday month

count=0
IFS=$'\t'
month=10
outfile="Month.$month.details"
rm -f *.details
while read name email city birthday_day birthday_month birthday_year country
do
if test -z "$name" || test "$country" == "country"
 then
 continue
 else
 if test "$birthday_month" -eq $month
 then
 count=$((count+1))
 echo -e "$count\t$name\t$birthday_month\t$country" >> "$outfile"
 fi
fi
done < example_people_data.tsv 
