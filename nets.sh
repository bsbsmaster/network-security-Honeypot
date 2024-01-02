#!/bin/bash
#Name : marwan nazi  +  class : 7736 / 18 + Unit:Jmagen773618 + Student : s17 + Teacher :שמרית
function folder()
{
#echo  where is the folder
echo  "{@}### logs will be  saved in $(pwd)/report/log.txt ###{@}"
echo ""
#make a folder and delelet if the folder exist  
rm -rf report
sleep 1
mkdir $(pwd)/report
chmod 777 report
#start rec
echo "{@} the user created  a folder called report path:  $(pwd)/report : $(date) {@}">>$(pwd)/report/log.txt
echo "">>$(pwd)/report/log.txt
}
##########################################

function input()
{
# tell the user 
echo " {#} Alerter , Network Honeypot .{#} "
echo ""
# the user need to pick a service to start honey bot
echo "Please choose an option (1-5):"
echo ""
echo "1. Option ftp  "
echo "2. Option smb"
echo "3. Option telnet"
echo "4. Option start all services"
echo ""
read -p "{#} Your choice: " c
echo ""
#rec
echo "{@} the user picked a service  $c at  : $(date) {@}">>$(pwd)/report/log.txt
echo "">>$(pwd)/report/log.txt
}
##########################################

function honey()
{
#rec
echo "{@}  start  msfconsle servers  : $(date) {@}">>$(pwd)/report/log.txt
echo "">>$(pwd)/report/log.txt
echo "">>$(pwd)/report/log.txt
echo "">>$(pwd)/report/log.txt
#start msfconsle data base 
sudo systemctl start postgresql.service >>$(pwd)/report/log.txt 2>&1
sudo msfdb init >>$(pwd)/report/log.txt 2>&1
sudo msfdb reinit  >>$(pwd)/report/log.txt 2>&1
}
##########################################

function msf()
{
if [ "$c" == 1 ] 
then
#tell the user
echo " Alerter started using ftp "
echo ""
#tell the user 
echo "it will take 50 sec"
echo ""
echo " Monitoring...."
echo ""
#this command will use msfconsle and use a auxiliary and run and sleep for 50 sec and exit + live mode 
msfconsole -q -x "use auxiliary/server/capture/ftp; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "LOGIN" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
#vrible for ip 
cat $(pwd)/report/log.txt | grep -oE "\b[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\b" | grep -v "0.0.0.0" | sort | uniq >> $(pwd)/report/ip.txt
i=$(cat $(pwd)/report/ip.txt)
#scan  for anyinfo 
echo "(#) Scanning IP: $i"
echo ""
whois "$i" >> "$(pwd)/report/scan.txt" 2>&1
nmap -Pn -sC "$i" >> "$(pwd)/report/scan.txt" 2>&1
curl ipinfo.io/"$i" >> "$(pwd)/report/scan.txt" 2>&1
echo "{@}### Scans will be saved in $(pwd)/report/scan.txt ##{@}"
########################################## 

elif [ "$c" == 2 ]
then 
#tell the user
echo " Alerter started using smb "
echo ""
#tell the user 
echo "it will take 60 sec"
echo ""
echo " Monitoring...."
echo "" 
#if the user pick one  this command will start a http server
msfconsole -q -x "use auxiliary/server/capture/smb; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "SMB connection" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
#vrible for ip 
cat $(pwd)/report/log.txt | grep -oE "\b[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\b" | grep -v "0.0.0.0" | sort | uniq >> $(pwd)/report/ip.txt
i=$(cat $(pwd)/report/ip.txt)
#scan  for anyinfo 
echo "(#) Scanning IP: $i"
echo ""
whois "$i" >> "$(pwd)/report/scan.txt" 2>&1
nmap -Pn -sC "$i" >> "$(pwd)/report/scan.txt" 2>&1
curl ipinfo.io/"$i" >> "$(pwd)/report/scan.txt" 2>&1
echo "{@}### Scans will be saved in $(pwd)/report/scan.txt ##{@}"
##########################################
	
elif [ "$c" == 3 ]
then 
#tell the user
echo " Alerter started using telnet "
echo ""
#tell the user 
echo "it will take 60 sec"
echo ""
echo " Monitoring...."
echo "" 
#if the user pick one  this command will start a http server
msfconsole -q -x "use auxiliary/server/capture/telnet; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "LOGIN" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
#vrible for ip 
cat $(pwd)/report/log.txt | grep -oE "\b[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\b" | grep -v "0.0.0.0" | sort | uniq >> $(pwd)/report/ip.txt
i=$(cat $(pwd)/report/ip.txt)
#scan  for anyinfo 
echo "(#) Scanning IP: $i"
echo ""
whois "$i" >> "$(pwd)/report/scan.txt" 2>&1
nmap -Pn -sC "$i" >> "$(pwd)/report/scan.txt" 2>&1
curl ipinfo.io/"$i" >> "$(pwd)/report/scan.txt" 2>&1
echo "{@}### Scans will be saved in $(pwd)/report/scan.txt ##{@}"	
##########################################
elif [ "$c" == 3 ]
then 
#tell the user
echo " Alerter started using telnet "
echo ""
#tell the user 
echo "it will take 60 sec"
echo ""
echo " Monitoring...."
echo "" 
#if the user pick one  this command will start a http server
msfconsole -q -x "use auxiliary/server/capture/telnet; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "LOGIN" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
#vrible for ip 
cat $(pwd)/report/log.txt | grep -oE "\b[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\b" | grep -v "0.0.0.0" | sort | uniq >> $(pwd)/report/ip.txt
i=$(cat $(pwd)/report/ip.txt)
#scan  for anyinfo 
echo "(#) Scanning IP: $i"
echo ""
whois "$i" >> "$(pwd)/report/scan.txt" 2>&1
nmap -Pn -sC "$i" >> "$(pwd)/report/scan.txt" 2>&1
curl ipinfo.io/"$i" >> "$(pwd)/report/scan.txt" 2>&1
echo "{@}### Scans will be saved in $(pwd)/report/scan.txt ##{@}"
##########################################
	
elif [ "$c" == 4 ]
then 
#tell the user
echo " Alerter started using All Servers "
echo ""
#tell the user 
echo "it will take 4 Minutes"
echo ""
echo " Monitoring.... (ftp)"
echo ""
#this command will use msfconsle and use a auxiliary and run and sleep for 50 sec and exit + live mode 
msfconsole -q -x "use auxiliary/server/capture/ftp; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "LOGIN" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""	
echo " Monitoring.... (smb)"
echo ""
msfconsole -q -x "use auxiliary/server/capture/smb; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "SMB connection" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
echo " Monitoring.... (telnet)"
echo ""
msfconsole -q -x "use auxiliary/server/capture/telnet; run; sleep 50; exit" | tee -a "$(pwd)/report/log.txt" | grep --line-buffered "LOGIN" | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; fflush(); }' & wait
echo ""
#vrible for ip 
cat $(pwd)/report/log.txt | grep -oE "\b[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\b" | grep -v "0.0.0.0" | sort | uniq >> $(pwd)/report/ip.txt
i=$(cat $(pwd)/report/ip.txt)
#scan  for anyinfo 
echo "(#) Scanning IP: $i"
echo ""
whois "$i" >> "$(pwd)/report/scan.txt" 2>&1
nmap -Pn -sC "$i" >> "$(pwd)/report/scan.txt" 2>&1
curl ipinfo.io/"$i" >> "$(pwd)/report/scan.txt" 2>&1
echo "{@}### Scans will be saved in $(pwd)/report/scan.txt ##{@}"
else
echo "Invalid choice, please run the script again "
exit
fi
	
}
folder
input
honey
msf
