#!/bin/bash
# My Telegram : https://t.me/donaya365
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
off='\x1b[m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
source /var/lib/donaya365store/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m Create Account SSH "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

MYIP=$(curl -sS ipinfo.io/ip)
wssl="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
wso="$(cat ~/log-install.txt | grep -w "Websocket Ovpn" | cut -d: -f2|sed 's/ //g')"
ohps="$(cat ~/log-install.txt | grep -w "OHP_SSH" | cut -d: -f2|sed 's/ //g')"
ohpd="$(cat ~/log-install.txt | grep -w "OHP_Dropbear" | cut -d: -f2|sed 's/ //g')"
ohpo="$(cat ~/log-install.txt | grep -w "OHP_OpenVPN" | cut -d: -f2|sed 's/ //g')"
open="$(cat ~/log-install.txt | grep -w "OpenSSH" | cut -d: -f2|sed 's/ //g')"
drop="$(cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2|sed 's/ //g')"
web="$(cat ~/log-install.txt | grep -w "Websocket Ovpn" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[41;1;39m SSH OpenVPN & Websocket Account ${off}" | tee -a /etc/log-create-user.log
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username      : $Login" | tee -a /etc/log-create-user.log
echo -e "Password      : $Pass" | tee -a /etc/log-create-user.log
echo -e "Created       : $hariini" | tee -a /etc/log-create-user.log
echo -e "Expired       : $expi" | tee -a /etc/log-create-user.log
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP/Host       : BUG.${domain}" | tee -a /etc/log-create-user.log
echo -e "OpenSSH       : $open" | tee -a /etc/log-create-user.log
echo -e "Dropbear      : $drop" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS       :$ssl" | tee -a /etc/log-create-user.log
echo -e "Port Squid    :$sqd" | tee -a /etc/log-create-user.log
echo -e "Port OHP      : SSH $ohps, Dropbear $ohpd, Ovpn $ohpo" | tee -a /etc/log-create-user.log
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "SSH WS        : $ws" | tee -a /etc/log-create-user.log
echo -e "SSH WS SSL    : $wssl" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS    : $wso" | tee -a /etc/log-create-user.log
#echo -e "${CYAN}==Payload WS==\033[0m" | tee -a /etc/log-create-user.log
#echo -e "\E[41;1;39m GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]${off}" | tee -a /etc/log-create-user.log
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link Ovpn     : http://$MYIP:89/" | tee -a /etc/log-create-user.log
echo -e "badvpn        : 7100-7200-7300" | tee -a /etc/log-create-user.log
echo -e "${CYAN}━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[41;1;39m Enjoy Our Auto Script Service $off" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e ""
read -n 1 -s -r -p "Press Any Key To Back On Menu"

menu-ssh
