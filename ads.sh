#Revision 10 starting to play with formatting
#curl -ks "http://pi.hole/admin/api.php"|cut -d , -f3 |sed 's/"\+//g'| sed 's/:\+/: /g' | sed 's/_\+/ /g'

# This is my final working version that does the formatting nicely.
#curl -ks "http://pi.hole/admin/api.php"|cut -d , -f3|sed 's/"\+//g'|sed 's/:\+/: /g'|sed 's/_\+/ /g'|sed -e "s/\b\(.\)/\u\1/g"

# This was mnrmnaugh's version that he came up with in 2 minutes and is much more condensed and nicer
curl -ks "http://pi.hole/admin/api.php"| awk -F'[:,]' '{print "Ads blocked today: " $6}'

# This is david's version, that he came up with in 30 seconds and will still work if the json changes ordering of "ads_blocked_today"
# echo -n 'Ads blocked today: ' && curl -ks "http://pi.hole/admin/api.php" | grep -oP '(?<="ads_blocked_today":)[0-9]+'

# David flexing on me for no good reason, part 2:
# echo "Ads blocked today: $(curl -ks "http://pi.hole/admin/api.php" | grep -oP '(?<="ads_blocked_today":)[0-9]+')"

# n2's php route:
# echo -n "Ads blocked today:" && php -r "echo (json_decode(file_get_contents(\"http://pi.hole/admin/api.php\"),true))[\"ads_blocked_today\"];" && echo "" 
