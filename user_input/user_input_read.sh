#!/bin/bash
read -t 5 -p "Enter your name: "  name
read -s -p "Enter your password: " pass

echo "welcome $name"

count=1
cat test | while read txtline
do
 echo "Line $count : $txtline"
 count=$[$count+1]
done

echo "Finished processing the file"
