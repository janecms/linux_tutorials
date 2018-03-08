
#!/bin/bash

tempfile=$(mktemp -t tmp.XXXXXX)
echo "$1" > $tempfile
 sed  '{
:start
 s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/
 t start
 }' $tempfile


rm -rf $tempfile
