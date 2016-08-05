#!/bin/bash
#sh WA08_enhencement_ibmlturan 1

HOSTRemote=172.31.70.224
USERRemote=siebel
# Our Folders
MH_BATCH_PROCESS_OUT=/mnt/icrm/deneme/siebel/MH/*
KR_BATCH_PROCESS_OUT=/mnt/icrm/deneme/siebel/KR/*
SD_BATCH_PROCESS_OUT=/mnt/icrm/deneme/siebel/SD/*
#GT_BATCH_PROCESS_OUT=

# Remote folders
MH_FAX_PATH=/app_fax/MH
KR_FAX_PATH=/app_fax/KURUMSAL
SD_FAX_PATH=/app_fax/SHOPDESTEK
#GT_FAX_PATH=

#sftp $USERRemote@$HOSTRemote <<EOF
for f in $KR_BATCH_PROCESS_OUT
do
   echo "Parsing $f file new..."
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
   #echo "Processing $f file..."

   echo "Processing $fileName file..."
   scp $f  $USERRemote@$HOSTRemote:$KR_FAX_PATH/$yearPart2/
   #cp $f /app_fax/KURUMSAL/$yearPart2/$filename 
done


for f in $SD_BATCH_PROCESS_OUT
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
   scp $f  $USERRemote@$HOSTRemote:$SD_FAX_PATH/$yearPart2/
   #cp $f  /app_fax/SHOPDESTEK/$yearPart2/$filename 
done


for f in $MH_BATCH_PROCESS_OUT
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
   #echo "Processing $f file..."

   echo "Processing $fileName file..."
   scp $f  $USERRemote@$HOSTRemote:$MH_FAX_PATH/$yearPart2/
   #cp $f  /mnt/icrm/deneme/siebelout/$yearPart2/$filename 
done
#EOF
