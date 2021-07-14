#!/bin/bash
#скрипт принимает отправленные менеджером сообщения о тяжести и бренности бытия и преобразует их в понятный язык для телеграмм-бота


#переменные
fhome=/usr/share/alert_bot/
fcache=/dev/cache/1/
fPID=$fhome"pid1.txt"


echo "start"
tm=0
k=0;

[ -f $fhome"tm.txt" ] && tm=$(sed -n 1"p" $fhome"tm.txt" | tr -d '\r')

while true #основной цикл
do
k=$((k+1))
tm=$((tm+1))
echo $tm > $fhome"tm.txt"
echo $tm
nc -l -p 9087 > $fcache$tm".txt"
date2=`date '+ %Y-%m-%d %H:%M:%S'`
chmod +rx -R $fcache
echo $date2"   "$fcache$tm".txt"
sleep 0.8

[ "$k" -ge "$kmax" ] && Init && k=0 && echo "k reset"	#реинициализация

done

