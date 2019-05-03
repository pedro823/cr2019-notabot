#!/bin/bash
COMMAND="*/15 * * * * /root/clear_db.sh >>/root/delete.log 2>>&1"
echo $(crontab -l ; echo $COMMAND) | crontab -
