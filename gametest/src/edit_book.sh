#!/bin/bash

function PrepeareeditBook() {

echo "Exist ID: " ; cat ./db.txt | grep ID |  awk '{print $3}' | sort ;
read -p "Id the Book which You want to Edit: " Sid;
searchLine=`grep -wn "ID: $Sid" ./db.txt | awk -F ":" '{print $1}'`
if [ -z "$searchLine"] 2>/dev/null; then echo "ID not found"; return -1; fi;


LineB=`expr $searchLine - 2`  #Переменные для седа так как карочка фиксирована немного совсем чуть-чуть захаркодил
LineA=`expr $searchLine + 6`

if [[ "$1" == 13 ]]; then echo '' > /dev/null; 
else 
printf "Before Edit\n";
sed -n $LineB,$LineA\p ./db.txt;   #Отображение перед изменением 
EditBook $searchLine;
printf "After Edit\n";
sed -n $LineB,$LineA\p ./db.txt;
fi

}


function EditBook() {
    lineInfo=`expr $1 + 2`
    printf "Input paramettrs which you want change:\n"

    
    while [ -z $autor ] 2>/dev/null ; do read -p "Input autor (Can't be empty!): " autor; done;  #check empty var
    while [ -z $book_name ] 2>/dev/null ; do read -p "Input name the book (Can't be empty!): " book_name; done;
    
    entrySed=`head -n $lineInfo db.txt | tail -n 1 | awk -F "|" '{print $2}'`  #Вхоэждения для автора
    sed -i -e "$lineInfo s/$entrySed/ Author: $autor /" ./db.txt 2>/dev/null
    entrySed=`head -n $lineInfo db.txt | tail -n 1 | awk -F "|" '{print $3}'` #Вхождения для имени книги
    sed -i -e "$lineInfo s/$entrySed/ Name book: $book_name /" ./db.txt 2>/dev/null
    read -p "Input ISBN: " isbn
    read -p "Input year of publishing: " yeofpub
    if [ -z $isbn ]; then echo "Empty ISBN skip it.";   #Если ISBN пустой оставляем старый
    else entrySed=`head -n $lineInfo db.txt | tail -n 1 | awk -F "|" '{print $4}'`; sed -i -e "$lineInfo s/$entrySed/ ISBN: $isbn /" ./db.txt 2>/dev/null;
    fi
    if [ -z $yeofpub ]; then echo "Empty  year of publishing: skip it." ; 
    else entrySed=`head -n $lineInfo db.txt | tail -n 1 | awk -F "|" '{print $5}'`; sed -i -e "$lineInfo s/$entrySed/ year of publishing: $yeofpub /" ./db.txt 2>/dev/null;
    fi

    entrySed=`head -n $1 db.txt | tail -n 1 | awk -F "|" '{print $4}'`;
    last_update=`date +%D`
    sed -i -e "$1 s/$entrySed/ Last update: $last_update /" ./db.txt 2>/dev/null;

    

}