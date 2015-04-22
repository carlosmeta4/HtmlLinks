#! /bin/bash
#echo -n "Source URL?: "
#read -e address
NAME1=$(date |awk '{print $4}' |sed 's/:/_/g')
NAME2=$(date |awk '{print $1 "-" $2 "-" $3}')
FILE=/home/dodo/SCRIPTS/html/links$NAME1
FILE2=/home/dodo/SCRIPTS/html/URLs$NAME2

curl $1 |sed 's/>/>\n/g' |sed '/^$/d' |grep 'a href' |awk -F'"' '{print $2}' |egrep -i -e '\/info\/|fordham' |egrep -v -i -f patterns.txt |sed 's/  //g'|awk -F"#" '{print $1}' |sed 's/^\/info/http:\/\/www\.fordham\.edu\/info/g' |sed 's/^\/downloads/http:\/\/www\.fordham\.edu\/downloads/g' |sort -u >$FILE

for LIST in $(cat $FILE);do
curl $LIST |sed 's/>/>\n/g' |sed '/^$/d' |grep 'a href' |awk -F'"' '{print $2}' |egrep -i -e '\/info\/|fordham' |egrep -v -i -f patterns.txt |sed 's/  //g'|awk -F"#" '{print $1}'|sed 's/^\/info/http:\/\/www\.fordham\.edu\/info/g' |sed 's/^\/downloads/http:\/\/www\.fordham\.edu\/downloads/g'|sort -u >>$FILE2

cat $FILE2 |sort -u >completelist$NAME2.txt

#curl $FILE |sed 's/>/>\n/g' |sed '/^$/d' |grep 'a href' |awk -F'"' '{print $2}' |egrep -i -e '^\/info'|sed 's/\/info/http:\/\/www\.fordham\.edu\/info/g' |egrep -v -i -e"w3\.org|macromedia|adobe\.com|facebook\.com|google|addthis|\.png|\/rss\/news$|socialmedia$|maps_and_directions$|contact_us$|info_for_current_students$|info_for_parents$|info_for_faculty_and_staff$|veteransmilitary$|fordham_facts$|Leadership_administration$|about$|academic_resources$|academics$|admissions_and_aid$|advisory_boards$|athletics$|campuses$|career_services$|celebrating_donors$|centers_and_institutes$|club_sports$|colleges_and_schools$|commencement|core_curriculum|costs_and_affordability|deans_of_students_and_student_life|departments_and_programs|disability_services|events_and_activities|faith_and_service|fordham_facts|fordham_fund|fordham_it|give|graduate_admission|graduate_financial_aid#|history_and_mission|honors_programs|leadership_and_administration|maps_and_directions|multicultural_affairs|partnerships_and_affiliations|policies|provosts_office|public_safety|research|resources|safety_health_and_wellness|school_of_professional_and_continuing_studies|student_fellowships|student_life|student_organizations|study_abroad|summer_session|the_financial_aid_campaign|undergraduate_admission|undergraduate_financial_aid$|ways_to_give| " |sort -u >$FILE

done
