#!/bin/bash

echo "Deleting existing pak file..."
for file in `find ../pakset -name '*.pak'`; do
		rm $file
done
echo "done. Packing from dat file..."

for file in `find . -name '*.dat'`; do
    pakoption=`cat $file | grep "#!" | tr -d "#!" | tr -d " "`
    if [ "$pakoption" = "" ]
    then
	echo "pak size is not specified. $file has been ignored."
	continue
    fi
    pakname=`echo $file | sed -e "s/dat/pak/g"`
    pakname=`basename $pakname`
    pakname="../pakset/$pakname"
    echo "searching $file"
    echo "packing using $pakoption"
    echo "packed in $pakname"
    ./../bin/makeobj.exe $pakoption $pakname $file
done
