#!/bin/sh
#Script generating multiple files based on country

count=0
IFS=$'\t'
while read name email city birthday_day birthday_month birthday_year country
do
if test -z $name || test $country="country"
 then
 count=count
 else
 count=$((count+1))
 echo -e "$count\t$name\t$city\t$country" >> ${country// /}.details
fi
done < example_people_data.tsv

