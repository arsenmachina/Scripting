#!/bin/bash

function print


server@server:~/Desktop/gametest$ grep -wn "ID: 5" db.txt 
41:          | ID: 5   |  Added: 10/14/22   |  Last update: 10/14/22                                                                        
server@server:~/Desktop/gametest$ sed -i -e "45 s/Borrowed:/Borrowed: Magomedov A.K/" ./db.txt 
server@server:~/Desktop/gametest$ sed -i -e "45 s/Return_date:/Return_date: 02/12/2022/" ./db.txt 
sed: -e expression #1, char 37: unknown option to `s'
server@server:~/Desktop/gametest$ sed -i -e "45 s/Return_date:/Return_date: 02\/12\/2022/" ./db.txt 
server@server:~/Desktop/gametest$ sed -i -e "45 s/Borrowed:/Borrowed: Magomedov A.K/" ./db.txt ^C