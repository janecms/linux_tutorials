#!/bin/bash
name=$(basename $0)
echo The zero parameter is set to: $name

echo  The first parameter is $1.
echo The last parameter was ${!#}

echo There were $# parameters supplied.

# $*变量会将所有参数当成单个参数
echo "Using the \$* method: $*"

# $@变量会单独处理每个参数
count=1
for param in "$@"
do
 echo "\$@ Parameter #$count = $param"
 count=$[$count + 1]
done


factorial=1
for ((number=1;number<=$1;number++))
do
  factorial=$[ $factorial * number]
done

count=1
while [ -n "$1" ]
do
 echo "Parameter #$count = $1"
 count=$[ $count + 1 ]
 shift
done
echo  the factorial of $1 is $factorial



