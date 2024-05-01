#!/bin/bash
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Lyellow='\e[93m'
bd='\e[1m'
clear
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

IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")
NameUser=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')

clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • BACKUP DATA VPS •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "[ ${green}INFO${NC} ] Create password for database"
echo -e ""
read -rp " Enter password : " -e InputPass
echo -e ""
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
ips=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
chatid="-1001200104631";
api="5115491195:AAEdAz3MyyQLY89HcEG7UAG-xLvmQz0u_Rs";
date=$(date +"%Y-%m-%d" | cut -d "-" -f 2-3);
time=$(date +"%H:%M:%S" | cut -d ":" -f 1-2);
rm -f $NameUser-$date-$time.zip
echo -e "[ ${GREEN}INFO${NC} ] Processing... "
rm -rf /root/backup
mkdir /root/backup
cd /root
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp /etc/shadow /root/backup/ &> /dev/null
cp /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/wireguard /root/backup/wireguard &> /dev/null
cp /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
cp /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf &> /dev/null
cp -r /var/lib/donaya365store/ /root/backup/donaya365store &> /dev/null
cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp /etc/crontab /root/backup/crontab &> /dev/null
cd /root
#zip -r $ips-$date-$time.zip backup > /dev/null 2>&1
#zip -rP $InputPass $NameUser-$date-$time.zip backup > /dev/null 2>&1
zip -rP $InputPass $NameUser-$date-$time.zip backup > /dev/null 2>&1
#curl -F document=@"$ips-$date-$time.zip" https://api.telegram.org/bot$api/sendDocument?chat_id=$chatid
curl -F document=@"$NameUser-$date-$time.zip" https://api.telegram.org/bot$api/sendDocument?chat_id=$chatid
rm -f $NameUser-$date-$time.zip
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • BACKUP DATA VPS •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " ${Lyellow} $bd BUKA FILE BACKUP DI TELEGRAM $BLUE[$GREEN https://t.me/backupkuy $BLUE] ${NC}"
echo -e ""
echo -e " ${Lyellow} $bd SESUAI CLIENT NAME $BLUE[$GREEN $NameUser $BLUE]${NC} ${Lyellow} DI VPS TEMAN - TEMAN ${NC}"
echo -e ""
echo -e " ${Lyellow} $bd GUNAKAN BOT SEBIJAK MUNGKIN ${NC} "
echo -e ""
echo -e " ${Lyellow} $bd TERIMAKASIH ${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-backup
echo -e ""

