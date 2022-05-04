# Usage: see README

touch response.txt
mv response.txt old_response.txt

./open_table_curl.sh > response.txt 2> /dev/null

cmp response.txt old_response.txt || curl -X POST https://api.twilio.com/2010-04-01/Accounts/$TWILIO_SID/Messages.json --data-urlencode "From=$FROM_SMS_NUMBER" --data-urlencode "Body=$SMS_MESSAGE" --data-urlencode "To=$TO_SMS_NUMBER" -u "$TWILIO_SID:$TWILIO_AUTH_TOKEN"
