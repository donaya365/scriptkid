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
# ==========================================
# Getting
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/ascii-home| lolcat
echo "SET-BR" | lolcat
echo "Backup / Restore" | lolcat
echo "Progress..." | lolcat
sleep 3
MYIP=$(curl -sS ipinfo.io/ip)
# Link Hosting Kalian
#donaya365="autosscript.site/backup"

apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://autosscript.site/backup/rclone.conf" >/dev/null 2>&1
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user paoandest@gmail.com
from paoandest@gmail.com
password 37373737 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/local/sbin
wget -O autobackup "https://autosscript.site/backup/autobackup.sh" >/dev/null 2>&1
wget -O backup "https://autosscript.site/backup/backup.sh" >/dev/null 2>&1
wget -O restore "https://autosscript.site/backup/restore.sh" >/dev/null 2>&1
wget -O strt "https://autosscript.site/backup/strt.sh" >/dev/null 2>&1
wget -O limitspeed "https://autosscript.site/backup/limitspeed.sh" >/dev/null 2>&1
wget -O autobackup-setup "https://autosscript.site/backup/autobackup-setup.sh" >/dev/null 2>&1
wget -O backup-info "https://autosscript.site/backup/backup-info.sh" >/dev/null 2>&1
wget -O backup2 "https://autosscript.site/backup/backup2.sh" >/dev/null 2>&1
wget -O restore2 "https://autosscript.site/backup/restore2.sh" >/dev/null 2>&1
chmod +x autobackup-setup >/dev/null 2>&1
chmod +x backup-info >/dev/null 2>&1
chmod +x autobackup >/dev/null 2>&1
chmod +x backup >/dev/null 2>&1
chmod +x restore >/dev/null 2>&1
chmod +x strt >/dev/null 2>&1
chmod +x limitspeed >/dev/null 2>&1
chmod +x backup2 >/dev/null 2>&1
chmod +x restore2 >/dev/null 2>&1
cd
rm -f /root/set-br.sh