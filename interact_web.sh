#!/bin/bash
clear
echo "Connecting to docker..."
docker exec -it notabot_web_1 /bin/bash
echo "Disconnected from notabot_web_1!"
read