# Open Table Listener

This project pings Open Table to check whether a given restaurant reservation search has changed.

## Deployment

This project is designed to be deployed to an Amazon EC2, a DigitalOcean droplet, or the like.

```
git clone https://github.com/mokolodi1/open-table-listener/
cd open-table-listener
```

## Setup

First, grab the network call from Open Table using the following method.

![Screenshot showing how to capture the network call that we'll use here](grab_curl_from_open_table.png)

Copy that cURL command into `open_table_curl.sh`. This is in a separte file in order to not reveal my cookies to GitHub.

## Usage

Launch the following command in a `tmux` window to ensure it keeps running when `ssh` window is closed.

```
FROM_SMS_NUMBER="+1831XXXXXXX" TO_SMS_NUMBER="+1609XXXXXXX" SMS_MESSAGE="https://www.opentable.com/gjelina" TWILIO_SID="XXX" TWILIO_AUTH_TOKEN="XXX" watch -n 60 ./text_if_open_table_changed.sh
```

### Variables

`FROM_SMS_NUMBER` and `TO_SMS_NUMBER` are the numbers you'd like to text from and to (your Twilio number and your own phone number respectively).

`SMS_MESSAGE` is the message that will be sent.

`TWILIO_SID` and `TWILIO_AUTH_TOKEN` can be fetched from [the Twilio console page](https://console.twilio.com/).

## Important notes

You may receive a single text when you launch the command if it's the first time you're checking a given reservation.
