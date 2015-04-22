#! /bin/bash
#echo -n "Source URL?: "
#read -e address
curl $1 |sed 's/>/>\n/g' |sed '/^$/d' |grep 'a href' |awk -F'"' '{print $2}' |egrep -i -e '^\/info'|sed 's/\/info/http:\/\/www\.fordham\.edu\/info/g'
