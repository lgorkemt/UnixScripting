#!/bin/bash
#sh WA08_enhencement_ibmlturan 1
#Copies a set of files from one folder to another

#Source folder
SIEBEL_MH=/d101/iccb/shell/source

#Destination folder
LOCAL_MH=/d101/iccb/shell/destination/*

HOSTSiebel=172.31.70.224 
USERSiebel=siebel
echo "started" 
#If remote connection needed
#sftp $USERSiebel@$HOSTSiebel <<EOF
for f in $SIEBEL_MH
do
   filename=$(basename "$f")
   #extension="${filename##*.}"  
   mv $f  $LOCAL_MH/$filename
done
#EOF
