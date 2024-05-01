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
green='\e[0;32m'
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
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
domain=$(cat /etc/xray/domain)
tls=$(cat /etc/xray/geo-vmessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
vl=$(cat /etc/xray/geo-vlessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/geo-vmessgrpc.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
created=`date -d "0 days" +"%d-%m-%Y"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/geo-vmessgrpc.json
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/geo-vlessgrpc.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "Geo",
      "type": "none",
      "host": "${sni}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vlesslink1="vless://${uuid}@${domain}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=Geo&sni=${domain}#$user"
systemctl restart geo-vmess-grpc.service
systemctl restart geo-vless-grpc.service
service cron restart
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m               ⇱ XRAY GRPC ⇲              \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port VMess        : ${tls}"
echo -e "Port VLess        : ${vl}"
echo -e "ID                : ${uuid}"
echo -e "Alter ID          : 0"
echo -e "Mode              : Gun"
echo -e "Security          : TLS"
echo -e "Type              : grpc"
echo -e "Service Name      : Geo"
echo -e "SNI               : ${domain}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Link VMess GRPC  : "
echo -e "${vmesslink1}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Link VLess GRPC  : "
echo -e "${vlesslink1}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
