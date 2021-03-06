#!/bin/bash
#отправка сообщений телеграм-бота в чат


#переменные
ftb=/usr/share/alert_bot/
cuf=/usr/share/alert_bot/
fPID=/usr/share/alert_bot/cu21_pid.txt

Z1=$1


if ! [ -f $fPID ]; then
PID=$$
echo $PID > $fPID
token=$(sed -n "1p" $ftb"settings.conf" | tr -d '\r')
chat_id=$(sed -n "1p" $cuf"send21.txt" | tr -d '\r')
f_text=$(sed -n "2p" $cuf"send21.txt" | tr -d '\r')

IFS=$'\x10'
text=`cat $f_text`


echo "token="$token
echo "chat_id="$chat_id
echo $text

curl -L -s -X POST https://api.telegram.org/bot$token/sendMessage -F chat_id="$chat_id" -F text=$text > $cuf"out021.txt"


mv $cuf"out021.txt" $cuf"out21.txt"

fi
rm -f $fPID
