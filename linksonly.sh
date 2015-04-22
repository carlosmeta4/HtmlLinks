#! /bin/bash
#echo -n "Source URL?: "
#read -e address
curl $1 |sed 's/>/>\n/g' |sed '/^$/d' |egrep -i -e 'http.?:\/\/' |awk -F'http|HTTP' '{print "http" $2}' | awk -F'"' '{print $1}'|egrep -v -i -e"w3\.org|macromedia|adobe\.com|facebook\.com|google|addthis| " |sort -u
