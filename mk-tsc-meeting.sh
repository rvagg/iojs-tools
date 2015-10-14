#!/bin/bash

# only works on Linux or OSX with coreutils installed

# if running OSX with coreutils installed
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
__dirname="$(CDPATH= cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
meeting_date=$(TZ=UTC date --date="Wednesday 8pm" --rfc-3339=seconds)
common_fmt="%a %d-%b-%Y %R"
utc_short=$(TZ=UTC date --date="$meeting_date" +"%F")

echo -n "Previous Meeting Google Docs URL: "
read prev_doc_url
echo -n "This Meeting Google Docs URL: "
read curr_doc_url

cat << EOF

Node Foundation TSC Meeting $utc_short

--------------------------------------

## Time

**UTC $(TZ=UTC date --date="$meeting_date" +"$common_fmt")**:

* San Francisco: $(TZ=America/Los_Angeles date --date="$meeting_date" +"$common_fmt")
* Amsterdam: $(TZ=Europe/Amsterdam date --date="$meeting_date" +"$common_fmt")
* Moscow: $(TZ=Europe/Moscow date --date="$meeting_date" +"$common_fmt")
* Sydney: $(TZ=Australia/Sydney date --date="$meeting_date" +"$common_fmt")
* Tokyo: $(TZ=Asia/Tokyo date --date="$meeting_date" +"$common_fmt")

Or in your local time:
* http://www.timeanddate.com/worldclock/fixedtime.html?msg=Node+Foundation+TSC+Meeting+${utc_short}&iso=$(TZ=UTC date --date="$meeting_date" +"%Y%m%dT20")
* or http://www.wolframalpha.com/input/?i=8pm+UTC%2C+$(TZ=UTC date --date="$meeting_date" +"%b+%d%%2C+%Y")+in+local+time

## Links

* **Minutes Google Doc**: <${curr_doc_url}>
* _Previous Minutes Google Doc: <${prev_doc_url}>_

## Agenda

Extracted from **tsc-agenda** labelled issues and pull requests from the **nodejs org** prior to the meeting.

$(node ${__dirname}/tsc-meeting-agenda/)

## Invited

* @bnoordhuis (TSC)
* @chrisdickinson (TSC)
* @cjihrig (TSC)
* @domenic (observer)
* @Fishrock123 (TSC)
* @indutny (TSC)
* @jasnell (TSC)
* @mhdawson (observer)
* @misterdjules (TSC)
* @mikeal (observer)
* @mscdex (TSC)
* @orangemocha (TSC)
* @piscisaureus (TSC)
* @rvagg (TSC)
* @shigeki (TSC)
* @srl295 (observer)
* @trevnorris (TSC)

## Notes

The agenda comes from issues labelled with `tsc-agenda` across **all of the repositories in the nodejs org**. Please label any additional issues that should be on the agenda before the meeting starts. I'm using a [tool](https://github.com/rvagg/iojs-tools/tree/master/tsc-meeting-agenda) to fetch the list so it's not a big deal to collate.

## Joining the meeting

Uberconference; participants should have the link & numbers, contact me if you don't.

EOF
