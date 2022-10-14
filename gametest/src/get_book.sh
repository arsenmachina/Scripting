#!/bin/bash


function give_book() {

read -p "Id the Book: " Sid;
searchLine=`grep -wn "ID: $Sid" ./db.txt | awk -F ":" '{print $1}'`
if [ -z "$searchLine"] 2>/dev/null; then echo "ID not found"; return -1; fi;
searchLine=`expr $searchLine + 4`;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $2}'`   # поиск кому выдали(как я уже говорил позволяет редактровать с пробелом)


if [[ "$1" == 13 ]] 2>/dev/null; then sed -i -e "$searchLine s/$entrySed/Borrowed: Not issued /" ./db.txt;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $3}'`; # Поиск даты возрата для замены
sed -i -e "$searchLine s/$entrySed/ Return_date: NULL/" ./db.txt # Обнуление даты возрата
else
read -p "Name of the borrower: " name_borr;
read -p "Rerurn Date: " return_date;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $2}'`  #Для возможности редактироавния данных с пробелом 
sed -i -e "$searchLine s/$entrySed/Borrowed: $name_borr /" ./db.txt;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $3}'`
sed -i -e "$searchLine s/$entrySed/ Return_date: $return_date/" ./db.txt
fi
}
