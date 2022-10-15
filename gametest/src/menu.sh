#!/bin/bash




function print_menu() {

    check_db
    
    printf "Welcome to catalog Book!\n
       
        1: Поиск и печать записей каталога.\n
        2: Удаление книги.\n
        3: Добавление книги.\n
        4: Редактирование книги.\n
        5: Одолжить книгу.\n
        6: Возврат книги.\n
        7: Интерактивное редактирование одной или более записей в консоли.\n
        8: Резервное копирование или шифрование..(Реализация на BASH довольно проста положил в backup.sh\n"

        imitation_return=true 
        
        while [ "$imitation_return" == true ]; do valid_input_menu ; done 
       
}


valid_input_menu() {
    read -p "Please choise your action: " usr_choise;

    if [[ `echo -n "$usr_choise" | wc -c ` > 1 ]] || [ -z "$usr_choise"] 2> /dev/null  # Блок проверки на колл-во символов и пустую строку
    then 
    printf "ERROR: Please, choise numbers from menu!\n";
    return -1
    fi
    #########################################

    if [[ "$1" == 13 ]] 2>/dev/null; then   regular_check='[^1-3]' ; #Регулярка исключающая все символы кроме целых 1-3 для принта

    else
    regular_check='[^1-8]' #Регулярка исключающая все символы кроме целых 1-8 для меню
    fi                       
    if [[ $usr_choise == $regular_check ]] 2>/dev/null
    then
        printf "ERROR: You can't to use spec.symbols and string or use numbers not diapason in menu!\n"
        return -1
    fi

imitation_return=0;

}

function check_db {
if [ -e $PWD/db.txt ] 2> /dev/null
then 
    printf "Init Database."
else 
    printf "Dtabase don't exist, create it..."
    touch db.txt 
    chmod 600 db.txt
fi

}