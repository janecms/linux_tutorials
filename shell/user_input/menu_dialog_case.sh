#!/bin/bash

temp=$(mktemp -t test.XXXXXX)

temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
 df -k >$temp
 dialog --textbox $temp 20 60
}

function whoseon {
 who > $temp
 dialog --textbox $temp 20 50
}

function memusage {
  cat /proc/meminfo  > $temp

 dialog --textbox $temp 20 50
}



function menu {
 clear
 echo 
 echo -e "\t\t\t Sys Admin Menu \n"
 echo -e "\t1. Display disk space"
 echo -e "\t2. Display logged on users"
 echo -e "\t3. Display memory usage"
 echo -e "\t0. Exit program\n\n"
 echo -en "\t\tEnter option: "
 read -n 1 option

}


while [ 1 ]
do
dialog --menu "Sys Admin Menu" 20 30 10 1 "Display disk space" 2 "Display users" \
 3 "Display memory usage" 0 "Exit" 2> $temp2
if [ $? -eq 1 ]
then
break
fi

selection=$(cat $temp2)
echo $selection



case $selection in
1)
diskspace ;;
2)
whoseon ;;
3)
memusage ;;
0)
break ;;
*)
dialog --msgbox "Sorry, invalid selection" 10 30
esac
done
rm -f $temp 2> /dev/null
rm -f $temp2 2> /dev/null
