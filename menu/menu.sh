#!/bin/bash
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
PURPLE='\e[1;95m'
CYAN='\e[1;36m'
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
white='\e[1;37m'
NC='\e[0m'
# ==========================================
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		geo="\033[1;31mExpired\033[0m"
        else
        geo=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
clear
# VPS Information
clear
Desa=$(curl -s ipinfo.io/city )
#Up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
domain=$(cat /etc/xray/domain)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
clear
figlet Geo Project | lolcat
echo -e ""
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "
echo -e "   \E[41;1;39m              ⇱ INFORMASI ENVY VPS ⇲                  \E[0m"
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "
echo -e "  $green HOSTNAME             ${color1}:$white  $HOSTNAME"
echo -e "  $green DOMAIN               ${color1}:$white  $domain"
echo -e "  $green IP VPS               ${color1}:$white  $IPVPS"
echo -e "  $green ISP NAME             ${color1}: $white $ISP"
echo -e "  $green CITY                 ${color1}: $white $Desa"
echo -e "  $green OPERATING SYSTEM     ${color1}:$white  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "  $green TOTAL AMOUNT OF RAM  ${color1}: $white $tram MB"
#echo -e "  $green WAKTU AKTIF          ${color1}:$white $Up"
echo -e "  $green DATE                 ${color1}:$white  $DATE"
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   \E[41;1;39m             ⇱ DASHBOARD ENVY MENU ⇲                  \E[0m"
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -e "   [${green}01${NC}]${color1} •$white SSH & OPENVPN (${color2}menu-ssh${color3})$NC"
echo -e "   [${green}02${NC}]${color1} •$white SSTP - L2TP - PPTP - WIREGUARD (${color2}menu-vpn${color3})$NC"
echo -e "   [${green}03${NC}]${color1} •$white SHADOWSOCKS & SHADOWSOCKSR (${color2}menu-shadowsocks${color3})$NC"
echo -e "   [${green}04${NC}]${color1} •$white V2RAY VMESS & V2RAY VLESS (${color2}menu-v2ray${color3})$NC"
echo -e "   [${green}05${NC}]${color1} •$white TROJAN & TROJANGO (${color2}menu-trojan${color3})$NC"
echo -e "   [${green}06${NC}]${color1} •$white TRIAL ACCOUNT (${color2}menu-trial${color3})$NC"
echo -e "   [${green}07${NC}]${color1} •$white SHOW LOG CREATE ACCOUNT (${color2}Show Log${color3}) $NC"
echo -e "   [${green}08${NC}]${color1} •$white STATUS RUNNING SERVICE (${color2}running${color3}) $NC"
echo -e "   [${green}09${NC}]${color1} •$white SETTING MENU (${color2}setting-menu${color3}) $NC"
echo -e "   [${green}10${NC}]${color1} •$white SYSTEM MENU (${color2}system-menu${color3}) $NC"
echo ""
echo -e "   [${green}00${NC}]${color1} •$white BACK TO EXIT MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "   ${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "   \E[41;1;39m            ⇱ ENVY VPN PROJECT ⇲                  \E[0m"
echo -e "   ${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "  $green VERSION        ${color1}•$Lyellow\033[1;36m $(cat /opt/.ver)\e[0m"
echo -e "  $green CLIENT NAME    ${color1}•$Lyellow $Name"
echo -e "  $green SCRIPT EXPIRED ${color1}•$Lyellow $exp"
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e "  $CYAN ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e  ""
 read -p "  Select menu :  " menu
echo -e   ""
case $menu in
1 | 01)
menu-ssh
;;
2 | 02)
menu-vpn
;;
3 | 03)
menu-shadowsocks
;;
4 | 04)
menu-v2ray
;;
5 | 05)
menu-trojan
;;
6 | 06)
menu-trial
;;
7 | 07)
cat /etc/log-create-user.log
;;
8 | 08)
running
;;
9 | 09)
setting-menu
;;
10)
system-menu
;;
0 | 00)
exit
;;
*)
menu
;;
esac
