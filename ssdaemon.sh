[200~
NOWTIME=$(date +%Y-%m-%d:%H:%M:%S)

ps -ef | grep sslocal | grep -v grep

if [ $? -ne 0 ];then
	echo "$NOWTIME ssserver has stoped, restart now!"
else
	echo "$NOWTIME ssserver is running..."
fi
