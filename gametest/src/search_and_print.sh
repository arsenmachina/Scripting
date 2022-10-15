#!/bin/bash



function PrintMenu(){

    printf "
            1: Вывести спсиок всех книг.(Используйте q для выхода или ctr+c)\n
            2: Только книги в наличии.\n
            3: Только одолженных кому-либо.\n"
        
    imitation_return=true 
        
    while [ "$imitation_return" == true ]; do valid_input_menu 13 ; done
    #Переменная из функции валидации не забыть $usr_choise;

    case $usr_choise in
    1 ) printAll ;;
    2 ) printNouIssue ;;
    3 ) printIssue ;;

    esac 


}






function printAll() {
    less ./db.txt
}

function printNouIssue() {
    printf "\n";
    cat ./db.txt | grep -w "Not issued" -B 6 -A 1
}

function printIssue() {
    printf "\n";
    cat ./db.txt | grep "Return-date" -B 7 -A 1 
}

