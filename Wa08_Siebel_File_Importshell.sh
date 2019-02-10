#sync from bgfsat
* * * * * /home/siebweb/script/altbayicopy.sh > /dev/null 2>&1
#!/bin/sh -x
#sh WA08_enhencement_ibmlturan 1


# Siebel folders
#SIEBEL_MH=/siebel/WA08/faxnumber1.sit
#SIEBEL_KURUMSAL=/siebel/WA08/faxnumber2.sit
#SIEBEL_SHOPDESTEK=/siebel/WA08/faxnumber3.sit

# our folders
#LOCAL_MH=/mnt/icrm/deneme/MH
#LOCAL_KURUMSAL=/mnt/icrm/deneme/KR
#LOCAL_SHOPDESTEK=/mnt/icrm/deneme/SD

mkdir -p /app_fax/siebelfaxes/MH
scp -pr siebel@127.0.0.1:/siebel/WA08/faxnumber1.sit/* /app_fax/siebelfaxes/MH/.

mkdir -p /app_fax/siebelfaxes/KURUMSAL
scp -pr siebel@127.0.0.1:/siebel/WA08/faxnumber2.sit/* /app_fax/siebelfaxes/KURUMSAL/.

mkdir -p /app_fax/siebelfaxes/SHOPDESTEK
scp -pr siebel@127.0.0.1:/siebel/WA08/faxnumber3.sit/* /app_fax/siebelfaxes/SHOPDESTEK/.

chmod 777 /app_fax/siebelfaxes/MH
chmod 777 /app_fax/siebelfaxes/KURUMSAL
chmod 777 /app_fax/siebelfaxes/SHOPDESTEK
