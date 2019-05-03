#!/bin/bash 
SHASUM=`(find app/ -type f -print0 2>/dev/null; find config/ -type f -print0 2>/dev/null) | xargs -0 sha1sum`
echo "Started watch on folder. In case something changes, rails will be reloaded."
while [[ true ]]; do
	sleep 3
	SHASUMTEMP=`(find app/ -type f -print0 2>/dev/null; find config/ -type f -print0 2>/dev/null) | xargs -0 sha1sum`
	if [[ $SHASUM != $SHASUMTEMP ]]; then
		echo "Detected change on folder. Reloading"
		# Takes the folder and inserts inside docker again
		docker cp . notabot_web_1:/app
		echo `diff <(echo "$SHASUM") <(echo "$SHASUMTEMP")`
		SHASUM=$SHASUMTEMP
	fi
done