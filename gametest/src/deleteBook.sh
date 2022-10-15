#!/bin/bash 


function DeleteBook() {



PrepeareeditBook 13;
sed $LineB,$LineA\d ./db.txt  > ./db.txt.tmp && mv db.txt.tmp db.txt;

}