#!/bin/bash
# My Telegram : https://t.me/sampiiiiu
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
# ==========================================
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
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m             ⇱ BACKUP DATA VPS ⇲                \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "[ ${green}INFO${NC} ] Create password for database"
echo -e ""
read -rp " Enter password : " -e InputPass
echo -e ""
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${green}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

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
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/donaya365/GEO-PROJECT-BACKUP.git /root/GEO-PROJECT-BACKUP/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/GEO-PROJECT-BACKUP/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/GEO-PROJECT-BACKUP/$NameUser/$NameUser-last-backup" ]; then
touch /root/GEO-PROJECT-BACKUP/$NameUser/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/GEO-PROJECT-BACKUP/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/GEO-PROJECT-BACKUP/$NameUser/
}

Save_And_Exit () {
    cd /root/GEO-PROJECT-BACKUP
    git config --global user.email "geogabut1981@gmail.com" &> /dev/null
    git config --global user.name "donaya365" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/donaya365/GEO-PROJECT-BACKUP.git
    git push -f https://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@github.com/donaya365/GEO-PROJECT-BACKUP.git &> /dev/null
}

if [ ! -d "/root/GEO-PROJECT-BACKUP/" ]; then
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${green}INFO${NC} ] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/donaya365/GEO-PROJECT-BACKUP/main/$NameUser/$NameUser.zip"
sleep 1
echo -e "[ ${green}INFO${NC} ] Backup done "
sleep 1
echo -e "[ ${green}INFO${NC} ] Generete Link Backup "
echo
sleep 2
rm /root/linkbackup &> /dev/null
echo -e "$link" >> /root/linkbackup
echo -e "The following is a link to your vps data backup file.
Your VPS IP $IP

$link
save the link pliss!

If you want to restore data, please enter the link above.
Thank You For Using Our Services"
echo -e ""
echo -e "Link location /root/linkbackup"
rm -rf /root/backup &> /dev/null
rm -rf /root/GEO-PROJECT-BACKUP &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-backup