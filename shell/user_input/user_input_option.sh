#!/bin/bash

set -- $(getopt -q ab:cd "$@")

echo

#while [ -n "$1" ]
#do
#   case "$1" in
#    -a) echo "found  the -a option" ;;
#    -b) param="$2"
#	echo "found the -b option ,with paramter value $param"
#	shift ;;
#   -c) echo "found the -c option"  ;;
#    --) shift  
#        break ;; 	
#    *) echo "$1 is not an option"
#   esac	
#  shift 
#done


echo
 while getopts :ab:cd opt
do

  case "$opt" in 
    -a) echo "found  the -a option" ;;
    -b) param="$2"
	echo "found the -b option ,with paramter value $param"
        shift ;;
   -c) echo "found the -c option"  ;;
    --) shift  
        break ;; 	
    *) echo "$1 is not an option"
  esac	
done

# 

shift $[ $OPTIND - 1 ]
echo 
count=1
for param in "$@"
do
 echo "Parameter $count: $param"
 count=$[ $count + 1 ]
done
