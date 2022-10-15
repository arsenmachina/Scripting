#!/bin/bash 

. ./src/menu.sh
. ./src/search_and_print.sh
. ./src/add_book.sh 
. ./src/get_book.sh


    print_menu ;

   case $usr_choise in 
        1 ) PrintMenu ;;
        2 ) echo "2" ;;
        3 ) _add ;;
        4 ) echo 4 ;;
        5 ) give_book ;;
        6 ) give_book 13 ;;  #Код который 13 для выполнения разных дейсвтий в функции
        7 ) echo 7 ;;
        8 ) echo 8 ;;

   esac