#!/bin/sh
#script indexing countries found in example_people_data

count=0
while read name email city birthday_day birthday_month birthday_year country; do
count=$((count+1))
echo -e "$count\t$country"
done < example_people_data.tsv | head -10


