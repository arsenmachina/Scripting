#!/bin/bash


function get_book() {

read -p "Id the Book: " Sid;
read -p "Name of the borrower: " name_borr;
read -p "Rerurn Date: " return_date;

serchLine=`grep -wn "ID: $Sid" ./db.txt | awk -F ":" '{print $1}'`
serchLine=`expr $serchLine + 4`;

sed -i -e "$serchLine s/Borrowed:/Borrowed: $name_borr/" ./db.txt;
sed -i -e "$searchLine s/Return_date:/Return_date: $return_date/" ./db.txt


}