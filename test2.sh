#!/bin/bash
#sh WA08_enhencement_ibmlturan 1
#A bash script which copies a set of files from one directory to another
#Destinaton folder is created by the year part from the file name which is to be copied
#eg A_20160730 will be copied under /mnt/icrm/deneme/siebelout/2016,
#B_20150730 will be copied under /mnt/icrm/deneme/siebelout/2015

echo "start test"
# Destination folder
LOCAL_MH=/mnt/icrm/deneme/siebelout
# Local folder
SIEBEL_MH=/mnt/icrm/deneme/siebel/*

for f in $SIEBEL_MH
do
	echo "Parsing $f file..."
	filename=$(basename "$f")
	echo "filename...$filename"
	extension="${filename##*.}"
	filenamewoext="${filename%.*}"
	echo "extension...$extension"
	echo "filenamewoext...$filenamewoext"
	parts=$(echo $filenamewoext | tr "_" "\n")
	START=1
	END=2
	i=$START
	yearPart=
	for part in $parts
	do
		echo "part..[$part]"
		echo "i..[$i]"
		if [ $i -eq 2 ]
		then  yearPart=[$part]
		fi
		echo "YearPart... $yearPart"
		((i=i+1))
	done
	yearPart2=${yearPart:1:4}
	echo "YearPart2... $yearPart2"
	echo "Processing $fileName file..."
	if [ ! -d $LOCAL_MH/$yearPart2 ];
	then mkdir -p echo $LOCAL_MH/$yearPart2
	echo "Dir created.....";
	fi;
	cp $f  $LOCAL_MH/$yearPart2/$filename
	#mv $f  $LOCAL_MH/$filename
done
echo "end"

 
