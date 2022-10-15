#!/bin/bash


function give_book() {


if [[ "$1" == 13 ]] 2>/dev/null; then printf "Выданные книги:\n"; printIssue; else printf "Книги которые можно выдать:\n"; printNouIssue; fi

#общие шаги
read -p "Id the Book: " Sid;
searchLine=`grep -wn "ID: $Sid" ./db.txt | awk -F ":" '{print $1}'`
if [ -z "$searchLine"] 2>/dev/null; then echo "ID not found"; return -1; fi;
searchLine=`expr $searchLine + 4`;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $2}'`   # поиск кому выдали(как я уже говорил позволяет редактровать с пробелом)

#Только для возрата 
if [[ "$1" == 13 ]] 2>/dev/null; then echo "" > /dev/null;
sed -i -e "$searchLine s/$entrySed/Borrowed: Not issued /" ./db.txt;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $3}'`; # Поиск даты возрата для замены
sed -i -e "$searchLine s/$entrySed/ Return_date: NULL/" ./db.txt # Обнуление даты возрата
echo "Success!"
else  #Только для получения книги
read -p "Name of the borrower(Example Arsen Magomedov or Arsen): " name_borr;
if (( $name_borr )) 2>/dev/null || [ -z "$name_borr" ] || [[ $name_borr == 0 ]] 2>/dev/null; then echo "Can't to use numbers or void string!"; return -1 ;fi
read -p "Rerurn Date(Example 02.02.2022): " return_date;
if [[ $return_date != [0-9]*[1-9]*.[0-9]*[1-9]*.[0-2]*[0-9]*[0-9]*[0-9]* ]]; then echo "Incorrect format date!\n"; return -1; fi;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $2}'`  #Для возможности редактироавния данных с пробелом 
sed -i -e "$searchLine s/$entrySed/Borrowed: $name_borr /" ./db.txt;
entrySed=`head -n $searchLine db.txt | tail -n 1 | awk -F "|" '{print $3}'`
sed -i -e "$searchLine s/$entrySed/ Return-date: $return_date/" ./db.txt 2>/dev/null
echo "Success!"
fi


}
