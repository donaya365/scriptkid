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
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m              ⇱ AUTOREBOOT ⇲              \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "   [${green}1${NC}]${color1} •$white  Auto Reboot 30 minutes"
echo -e "   [${green}2${NC}]${color1} •$white  Auto Reboot 1 Hours"
echo -e "   [${green}3${NC}]${color1} •$white  Auto Reboot 12 Hours"
echo -e "   [${green}4${NC}]${color1} •$white  Auto Reboot 24 Hours"
echo -e "   [${green}5${NC}]${color1} •$white  Auto Reboot 1 weeks"
echo -e "   [${green}6${NC}]${color1} •$white  Auto Reboot 1 mount"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [${green}x${NC}]${color1} •$white BACK TO EXIT MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "     Please Input Number  [1-6 or x] :  "  autoreboot
echo -e ""
case $autoreboot in
1)
echo "*/30 * * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
2)
echo "0 * * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
3)
echo "0 */12 * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
4)
echo "0 0 * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
5)
echo "0 0 */7 * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
6)
echo "0 0 1 * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
;;
x)
setting-menu
;;
*)
;;
esac