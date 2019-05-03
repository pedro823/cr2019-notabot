#!/bin/bash
chmod +x *.sh

tmux has-session -t notabot
if [ $? != 0 ]; then
    tmux new -s notabot -d "echo \"Waiting for container...\" && sleep 7 && ./interact_web.sh" \; split-window -h "docker-compose up ; echo \"Docker stopped! (press any key to continue)\" ; read" \; split-window -b ./watchfolder.sh \; select-pane -L \; attach
else
    tmux attach -t notabot
fi
