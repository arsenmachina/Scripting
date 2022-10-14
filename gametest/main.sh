#!/bin/bash 

. ./src/menu.sh
. ./src/search_and_print.sh
. ./src/add_book.sh 
. ./src/get_book.sh


    print_menu ;

   case $usr_choise in 
        1 ) echo $da ;;
        2 ) echo "2" ;;
        3 ) _add ;;
        4 ) echo 4 ;;
        5 ) get_book ;;
        6 ) echo 6 ;;
        7 ) echo 7 ;;
        8 ) echo 8 ;;

   esac