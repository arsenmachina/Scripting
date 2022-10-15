#!/bin/bash 

function _add {

    
   
    while [ -z $autor ] 2>/dev/null ; do read -p "Input autor (Can't be empty!): " autor; done;  #check empty var
    while [ -z $book_name ] 2>/dev/null ; do read -p "Input name the book (Can't be empty!): " book_name; done;
    read -p "Input ISBN: " isbn
    read -p "Input year of publishing: " yeofpub 
    last_update=`date +%D`
    date_add=`date +%D`
    
    if [[ `du -b ./db.txt | awk '{print $1}'` -lt 300 ]]; then id=1  #if file is empty set id 1 for init 
    else
    id=`tail -n 7 ./db.txt | grep ID | head -n 1 | awk '{print $3}'`   #find id in db
    id=`expr $id + 1`;  #increment id
    echo "ID: $id"
    fi

    


    printf "\n
          | SERVICE INFORMATION                                                                 
          |__________________________________________________________________________________________________________________________________________________
          | ID: $id   |  Added: $date_add   |  Last update: $last_update                                                                        
          |__________________________________________________________________________________________________________________________________________________
          | Author: $autor  |   Name book:   $book_name   |   ISBN: $isbn   |  year of publishing: $yeofpub           
          |__________________________________________________________________________________________________________________________________________________
          | Borrowed: Not issued  |   Return_date:      
          ---------------------------------------------------------------------------------------------------------------------------------------------------" >> db.txt
}