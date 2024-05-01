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
tyblue='\e[1;36m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# ==========================================
# initializing var
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
    rm -f /etc/.$user.ini
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
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
curl -sS https://raw.githubusercontent.com/donaya365/perizinan/main/ascii-home | lolcat
echo "SSH & Ovpn" | lolcat
echo "Progress..." | lolcat
sleep 3
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted.."
else
red "Permission Denied!"
exit 0
fi
clear
# ==================================================
# Link Hosting Kalian
donaya365="autosscript.site/ssh"

# Link Hosting Kalian Untuk Xray
donaya365n="autosscript.site/xray"

# Link Hosting Kalian Untuk Trojan Go
donaya365nn="autosscript.site/trojango"

# Link Hosting Kalian Untuk Stunnel5
donaya365nnn="autosscript.site/stunnel5"

# Link Hosting Kalian Untuk menu
donaya365nnnn="autosscript.site/menu"

# Link Hosting Kalian Untuk banner
donaya365nnnnn="autosscript.site/banner"

# Link Hosting Kalian Untuk dom
donaya365nnnnnn="autosscript.site/dom"

# Link Hosting Kalian Untuk trial
donaya365nnnnnnn="autosscript.site/trial"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=LEKONG
locality=SUMBAWA
organization=GEOPROJECT
organizationalunit=GEOPROJECT
commonname=GEOPROJECT
email=ADMIN@GEOLSTORE.NET

# simple password minimal
wget -O /etc/pam.d/common-password "https://${donaya365}/password" >/dev/null 2>&1
chmod +x /etc/pam.d/common-password >/dev/null 2>&1

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

sleep 1
# Ubah izin akses
echo -e "[ ${tyblue}NOTES${NC} ] Ubah izin akses"
chmod +x /etc/rc.local
sleep 1
# enable rc local
echo -e "[ ${tyblue}NOTES${NC} ] enable rc local"
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo -e "[ ${tyblue}NOTES${NC} ] disable ipv6 "
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

sleep 1
#update
clear
echo ""
echo -e "[ ${tyblue}NOTES${NC} ] PROSES ALL INSTALL "
sleep 1
echo -e "[ ${green}INFO${NC} ] Update....."
apt update -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Upgrade....."
apt upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Toilet....."
apt install toilet -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Dist-upgrade....."
apt dist-upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] remove --purge ufw firewalld....."
apt-get remove --purge ufw firewalld -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Remove --Purge Exim4....."
apt-get remove --purge exim4 -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install  Curl....."
apt -y install wget curl >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Ruby....."
apt install ruby -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Python....."
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Make....."
apt install make -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Cmake....."
apt install cmake -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Coreutils....."
apt install coreutils -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Rsyslog....."
apt install rsyslog -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Net-tools....."
apt install net-tools -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Zip....."
apt install zip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Unzip....."
apt install unzip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Nano....."
apt install nano -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Sed....."
apt install sed -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Gnupg....."
apt install gnupg -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Gnupg1....."
apt install gnupg1 -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Bc....."
apt install bc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install jq....."
apt install jq -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install apt-transport-https....."
apt install apt-transport-https -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Build-essential....."
apt install build-essential -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Dirmngr....."
apt install dirmngr -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libxml-parser-perl....."
apt install libxml-parser-perl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Neofetch....."
apt install neofetch -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Git....."
apt install git -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Lsof....."
apt install lsof -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libsqlite3-dev....."
apt install libsqlite3-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libz-dev....."
apt install libz-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install gcc....."
apt install gcc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install g++....."
apt install g++ -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libreadline-dev....."
apt install libreadline-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Zlib1g-dev....."
apt install zlib1g-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libssl-dev....."
apt install libssl-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Libssl1.0-dev....."
apt install libssl1.0-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Install Dos2unix....."
apt install dos2unix -y >/dev/null 2>&1

# set time GMT +7
echo -e "[ ${tyblue}NOTES${NC} ] set time GMT +7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
echo -e "[ ${tyblue}NOTES${NC} ] set locale"
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
echo -e "[ ${green}INFO${NC} ] reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof"
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof >/dev/null 2>&1
echo "clear" >> .profile
echo "figlet -f slant GEO PROJECT | lolcat" >> .profile
echo "sleep 0.5" >> .profile
echo "clear" >> .profile
echo "running " >> .profile
echo "echo -e \" - Script Mod By Geo Project\" | lolcat" >> .profile
echo "echo -e \"\x1b[96m - Silahkan Ketik\x1b[m \x1b[92mMENU\x1b[m \x1b[96mUntuk Melihat daftar Perintah\x1b[m\"" >> .profile

# install webserver
echo -e "[ ${green}INFO${NC} ] install webserver"
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl >/dev/null 2>&1
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${donaya365}/nginx.conf > /etc/nginx/nginx.conf
curl https://${donaya365}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
#wget -O /home/vps/public_html/index.html "https://${donaya365}/index.html1"
/etc/init.d/nginx restart
/etc/init.d/nginx status
cd

# install badvpn
echo -e "[ ${green}INFO${NC} ] install badvpn-udpgw64"
cd
wget -O /usr/local/sbin/badvpn-udpgw "https://${donaya365}/badvpn-udpgw64"
chmod +x /usr/local/sbin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
echo -e "[ ${tyblue}NOTES${NC} ] setting port ssh"
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
echo -e "[ ${green}INFO${NC} ] install dropbear"
apt -y install dropbear >/dev/null 2>&1
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
/etc/init.d/dropbear status

# install squid
echo -e "[ ${green}INFO${NC} ] install squid"
cd
apt -y install squid3 >/dev/null 2>&1
wget -O /etc/squid/squid.conf "https://${donaya365}/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# Install SSLH
echo -e "[ ${green}INFO${NC} ] install sslh"
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
echo -e "[ ${tyblue}NOTES${NC} ] Settings SSLH"
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:80 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
echo -e "[ ${tyblue}NOTES${NC} ] Restart Service SSLH"
###############$$$$
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# setting vnstat
echo -e "[ ${green}INFO${NC} ] install vnstat"
apt -y install vnstat >/dev/null 2>&1
/etc/init.d/vnstat restart
/etc/init.d/vnstat status
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
/etc/init.d/vnstat status
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

mkdir -p /usr/local/donaya365
mkdir -p /etc/donaya365

# install stunnel 5 
echo -e "[ ${green}INFO${NC} ] install stunnel 5 "
cd /root/
wget -q -O stunnel-5.62.zip "https://${donaya365nnn}/stunnel-5.62.zip"
unzip -o stunnel-5.62.zip
cd /root/stunnel
chmod +x configure
./configure
make
make install
cd /root
rm -r -f stunnel
rm -f stunnel-5.62.zip
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Download Config Stunnel5"
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/stunnel5/stunnel5.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
echo -e "[ ${tyblue}NOTES${NC} ] make a certificate "
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel5/stunnel5.pem

# Service Stunnel5 systemctl restart stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Service Stunnel5 systemctl restart stunnel5 "
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/donaya365
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/donaya365/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Service Stunnel5 /etc/init.d/stunnel5 "
wget -q -O /etc/init.d/stunnel5 "https://${donaya365nnn}/stunnel5.init"

# Ubah Izin Akses
echo -e "[ ${tyblue}NOTES${NC} ] Ubah Izin Akses "
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/donaya365/stunnel5

# Remove File
echo -e "[ ${tyblue}NOTES${NC} ] Remove File "
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
echo -e "[ ${tyblue}NOTES${NC} ] Restart Stunnel 5 "
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

#OpenVPN
echo -e "[ ${green}INFO${NC} ] Install OpenVPN"
wget https://${donaya365}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
echo -e "[ ${green}INFO${NC} ] install fail2ban"
apt -y install fail2ban >/dev/null 2>&1

# Install BBR
echo -e "[ ${green}INFO${NC} ] Install BBR "
wget https://${donaya365}/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# banner /etc/issue.net
echo -e "[ ${green}INFO${NC} ] Install Banner"
wget -O /etc/issue.net "https://${donaya365}/issue.net"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
echo -e "[ ${tyblue}NOTES${NC} ] Blokir torrent "
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
echo -e "[ ${green}INFO${NC} ] Download File Script "
cd /usr/local/sbin
wget -O portwsnon "https://${donaya365}/portwsnon.sh" >/dev/null 2>&1
wget -O portwstls "https://${donaya365}/portwstls.sh" >/dev/null 2>&1
wget -O onoffservice "https://${donaya365}/onoffservice.sh" >/dev/null 2>&1
wget -O addhost "https://${donaya365}/addhost.sh" >/dev/null 2>&1
wget -O autoreboot "https://${donaya365}/autoreboot.sh" >/dev/null 2>&1
wget -O about "https://${donaya365}/about.sh" >/dev/null 2>&1
wget -O menu "https://${donaya365}/menu.sh" >/dev/null 2>&1
wget -O addssh "https://${donaya365}/addssh.sh" >/dev/null 2>&1
wget -O trialssh "https://${donaya365}/trialssh.sh" >/dev/null 2>&1
wget -O delssh "https://${donaya365}/delssh.sh" >/dev/null 2>&1
wget -O member "https://${donaya365}/member.sh" >/dev/null 2>&1
wget -O delexp "https://${donaya365}/delexp.sh" >/dev/null 2>&1
wget -O cekssh "https://${donaya365}/cekssh.sh" >/dev/null 2>&1
wget -O restart "https://${donaya365}/restart.sh" >/dev/null 2>&1
wget -O speedtest "https://${donaya365}/speedtest_cli.py" >/dev/null 2>&1
wget -O info "https://${donaya365}/info.sh" >/dev/null 2>&1
wget -O ram "https://${donaya365}/ram.sh" >/dev/null 2>&1
wget -O bbr "https://${donaya365}/bbr.sh" >/dev/null 2>&1
wget -O renewssh "https://${donaya365}/renewssh.sh" >/dev/null 2>&1
wget -O autokill "https://${donaya365}/autokill.sh" >/dev/null 2>&1
wget -O ceklim "https://${donaya365}/ceklim.sh" >/dev/null 2>&1
wget -O tendang "https://${donaya365}/tendang.sh" >/dev/null 2>&1
wget -O clearlog "https://${donaya365}/clearlog.sh" >/dev/null 2>&1
wget -O changeport "https://${donaya365}/changeport.sh" >/dev/null 2>&1
wget -O portovpn "https://${donaya365}/portovpn.sh" >/dev/null 2>&1
wget -O portwg "https://${donaya365}/portwg.sh" >/dev/null 2>&1
wget -O porttrojan "https://${donaya365}/porttrojan.sh" >/dev/null 2>&1
wget -O portsstp "https://${donaya365}/portsstp.sh" >/dev/null 2>&1
wget -O portsquid "https://${donaya365}/portsquid.sh" >/dev/null 2>&1
wget -O portv2ray "https://${donaya365}/portv2ray.sh" >/dev/null 2>&1
wget -O portvless "https://${donaya365}/portvless.sh" >/dev/null 2>&1
wget -O wbmn "https://${donaya365}/webmin.sh" >/dev/null 2>&1
wget -O xp "https://${donaya365}/xp.sh" >/dev/null 2>&1
wget -O swapkvm "https://${donaya365}/swapkvm.sh" >/dev/null 2>&1
wget -O addv2ray "https://${donaya365n}/addv2ray.sh" >/dev/null 2>&1
wget -O trialv2ray "https://${donaya365n}/trialv2ray.sh" >/dev/null 2>&1
wget -O addvless "https://${donaya365n}/addvless.sh" >/dev/null 2>&1
wget -O addtrojan "https://${donaya365n}/addtrojan.sh" >/dev/null 2>&1
wget -O delv2ray "https://${donaya365n}/delv2ray.sh" >/dev/null 2>&1
wget -O delvless "https://${donaya365n}/delvless.sh" >/dev/null 2>&1
wget -O deltrojan "https://${donaya365n}/deltrojan.sh" >/dev/null 2>&1
wget -O cekv2ray "https://${donaya365n}/cekv2ray.sh" >/dev/null 2>&1
wget -O cekvless "https://${donaya365n}/cekvless.sh" >/dev/null 2>&1
wget -O cektrojan "https://${donaya365n}/cektrojan.sh" >/dev/null 2>&1
wget -O renewv2ray "https://${donaya365n}/renewv2ray.sh" >/dev/null 2>&1
wget -O renewvless "https://${donaya365n}/renewvless.sh" >/dev/null 2>&1
wget -O renewtrojan "https://${donaya365n}/renewtrojan.sh" >/dev/null 2>&1
wget -O certv2ray "https://${donaya365n}/certv2ray.sh" >/dev/null 2>&1
wget -O addtrgo "https://${donaya365nn}/addtrgo.sh" >/dev/null 2>&1
wget -O deltrgo "https://${donaya365nn}/deltrgo.sh" >/dev/null 2>&1
wget -O renewtrgo "https://${donaya365nn}/renewtrgo.sh" >/dev/null 2>&1
wget -O cektrgo "https://${donaya365nn}/cektrgo.sh" >/dev/null 2>&1
wget -O menu-backup "https://${donaya365nnnn}/menu-backup.sh" >/dev/null 2>&1
wget -O menu-domain "https://${donaya365nnnn}/menu-domain.sh" >/dev/null 2>&1
wget -O menu-l2tp "https://${donaya365nnnn}/menu-l2tp.sh" >/dev/null 2>&1
wget -O menu "https://${donaya365nnnn}/menu.sh" >/dev/null 2>&1
wget -O menu-pptp "https://${donaya365nnnn}/menu-pptp.sh" >/dev/null 2>&1
wget -O menu-shadowsocks "https://${donaya365nnnn}/menu-shadowsocks.sh" >/dev/null 2>&1
wget -O menu-ssh "https://${donaya365nnnn}/menu-ssh.sh" >/dev/null 2>&1
wget -O menu-sstp "https://${donaya365nnnn}/menu-sstp.sh" >/dev/null 2>&1
wget -O menu-tools "https://${donaya365nnnn}/menu-tools.sh" >/dev/null 2>&1
wget -O menu-trial "https://${donaya365nnnn}/menu-trial.sh" >/dev/null 2>&1
wget -O menu-trojan "https://${donaya365nnnn}/menu-trojan.sh" >/dev/null 2>&1
wget -O menu-v2ray "https://${donaya365nnnn}/menu-v2ray.sh" >/dev/null 2>&1
wget -O menu-vpn "https://${donaya365nnnn}/menu-vpn.sh" >/dev/null 2>&1
wget -O setting-menu "https://${donaya365nnnn}/setting-menu.sh" >/dev/null 2>&1
wget -O system-menu "https://${donaya365nnnn}/system-menu.sh" >/dev/null 2>&1
wget -O ipsec-menu "https://${donaya365nnnn}/ipsec-menu.sh" >/dev/null 2>&1
wget -O sstp-menu "https://${donaya365nnnn}/sstp-menu.sh" >/dev/null 2>&1
wget -O cloudflare-pointing "https://${donaya365}/cloudflare-pointing.sh" >/dev/null 2>&1
wget -O cloudflare-setting "https://${donaya365}/cloudflare-setting.sh" >/dev/null 2>&1
wget -O menu-wireguard "https://${donaya365nnnn}/menu-wireguard.sh" >/dev/null 2>&1
wget -O bbr "https://${donaya365nnnn}/bbr.sh" >/dev/null 2>&1
wget -O status "https://${donaya365nnnn}/status.sh" >/dev/null 2>&1
wget -O running "https://${donaya365nnnn}/running.sh" >/dev/null 2>&1
wget -O addcf "https://${donaya365nnnnnn}/addcf.sh" >/dev/null 2>&1
wget -O cfd "https://${donaya365nnnnnn}/cfd.sh" >/dev/null 2>&1
wget -O cff "https://${donaya365nnnnnn}/cff.sh" >/dev/null 2>&1
wget -O cfh "https://${donaya365nnnnnn}/cfh.sh" >/dev/null 2>&1
wget -O domen "https://${donaya365nnnnnn}/host.sh" >/dev/null 2>&1
wget -O pointing "https://${donaya365nnnnnn}/pointing.sh" >/dev/null 2>&1
wget -O banner "https://${donaya365}/banner.sh" >/dev/null 2>&1
wget -O bw "https://${donaya365nnnnnn}/bw.sh" >/dev/null 2>&1
wget -O update "https://${donaya365nnnnnn}/update.sh" >/dev/null 2>&1
wget -O domen "https://${donaya365nnnnnn}/host.sh" >/dev/null 2>&1
wget -O trial-akun "https://${donaya365nnnnnnn}/trial-akun.sh" >/dev/null 2>&1
wget -O triall2tp "https://${donaya365nnnnnnn}/triall2tp.sh" >/dev/null 2>&1
wget -O trialpptp "https://${donaya365nnnnnnn}/trialpptp.sh" >/dev/null 2>&1
wget -O trialss "https://${donaya365nnnnnnn}/trialss.sh" >/dev/null 2>&1
wget -O trialssh "https://${donaya365nnnnnnn}/trialssh.sh" >/dev/null 2>&1
wget -O trialssr "https://${donaya365nnnnnnn}/trialssr.sh" >/dev/null 2>&1
wget -O trialsstp "https://${donaya365nnnnnnn}/trialsstp.sh" >/dev/null 2>&1
wget -O trialtrojan "https://${donaya365nnnnnnn}/trialtrojan.sh" >/dev/null 2>&1
wget -O trialv2ray "https://${donaya365nnnnnnn}/trialv2ray.sh" >/dev/null 2>&1
wget -O trialvless "https://${donaya365nnnnnnn}/trialvless.sh" >/dev/null 2>&1
wget -O trialwg "https://${donaya365nnnnnnn}/trialwg.sh" >/dev/null 2>&1
wget -O trialtrgo "https://${donaya365nnnnnnn}/trialtrgo.sh" >/dev/null 2>&1
chmod +x trialpptp >/dev/null 2>&1
chmod +x trialss >/dev/null 2>&1
chmod +x onoffservice
chmod +x trialssh >/dev/null 2>&1
chmod +x trialssr >/dev/null 2>&1
chmod +x trialsstp >/dev/null 2>&1
chmod +x trialtrojan >/dev/null 2>&1
chmod +x triall2tp >/dev/null 2>&1
chmod +x trialv2ray >/dev/null 2>&1
chmod +x trialvless >/dev/null 2>&1
chmod +x trialwg >/dev/null 2>&1
chmod +x trialtrgo >/dev/null 2>&1
chmod +x autoreboot >/dev/null 2>&1
chmod +x addhost >/dev/null 2>&1
chmod +x menu >/dev/null 2>&1
chmod +x addssh >/dev/null 2>&1
chmod +x trialssh >/dev/null 2>&1
chmod +x delssh >/dev/null 2>&1
chmod +x member >/dev/null 2>&1
chmod +x delexp >/dev/null 2>&1
chmod +x cekssh >/dev/null 2>&1
chmod +x restart >/dev/null 2>&1
chmod +x speedtest >/dev/null 2>&1
chmod +x info >/dev/null 2>&1
chmod +x about >/dev/null 2>&1
chmod +x autokill >/dev/null 2>&1
chmod +x tendang >/dev/null 2>&1
chmod +x ceklim >/dev/null 2>&1
chmod +x ram >/dev/null 2>&1
chmod +x renewssh >/dev/null 2>&1
chmod +x clearlog >/dev/null 2>&1
chmod +x changeport >/dev/null 2>&1
chmod +x portovpn >/dev/null 2>&1
chmod +x portwg >/dev/null 2>&1
chmod +x porttrojan >/dev/null 2>&1
chmod +x portsstp >/dev/null 2>&1
chmod +x portsquid >/dev/null 2>&1
chmod +x portv2ray >/dev/null 2>&1
chmod +x portvless >/dev/null 2>&1
chmod +x wbmn >/dev/null 2>&1
chmod +x xp >/dev/null 2>&1
chmod +x swapkvm >/dev/null 2>&1
chmod +x addv2ray >/dev/null 2>&1
chmod +x addvless >/dev/null 2>&1
chmod +x addtrojan >/dev/null 2>&1
chmod +x delv2ray >/dev/null 2>&1
chmod +x delvless >/dev/null 2>&1
chmod +x deltrojan >/dev/null 2>&1
chmod +x cekv2ray >/dev/null 2>&1
chmod +x cekvless >/dev/null 2>&1
chmod +x cektrojan >/dev/null 2>&1
chmod +x renewv2ray >/dev/null 2>&1
chmod +x renewvless >/dev/null 2>&1
chmod +x renewtrojan >/dev/null 2>&1
chmod +x certv2ray >/dev/null 2>&1
chmod +x addtrgo >/dev/null 2>&1
chmod +x deltrgo >/dev/null 2>&1
chmod +x renewtrgo >/dev/null 2>&1
chmod +x cektrgo >/dev/null 2>&1
chmod +x menu-backup >/dev/null 2>&1
chmod +x menu-domain >/dev/null 2>&1
chmod +x menu-l2tp >/dev/null 2>&1
chmod +x menu >/dev/null 2>&1
chmod +x menu-pptp >/dev/null 2>&1
chmod +x menu-shadowsocks
chmod +x menu-ssh >/dev/null 2>&1
chmod +x menu-sstp >/dev/null 2>&1
chmod +x menu-tools >/dev/null 2>&1
chmod +x menu-trial >/dev/null 2>&1
chmod +x menu-trojan >/dev/null 2>&1
chmod +x menu-v2ray >/dev/null 2>&1
chmod +x menu-vpn >/dev/null 2>&1
chmod +x menu-wireguard >/dev/null 2>&1
chmod +x menu-wireguard >/dev/null 2>&1
chmod +x running >/dev/null 2>&1
chmod +x status >/dev/null 2>&1
chmod +x bbr >/dev/null 2>&1
#chmod +x update >/dev/null 2>&1
chmod +x portwsnon >/dev/null 2>&1
chmod +x portwstls >/dev/null 2>&1
#chmod +x cfd >/dev/null 2>&1
#chmod +x cff >/dev/null 2>&1
#chmod +x cfh >/dev/null 2>&1
chmod +x domen
chmod +x bbr
chmod +x setting-menu
chmod +x system-menu
chmod +x cloudflare-pointing
chmod +x cloudflare-setting
chmod +x banner
chmod +x pointing >/dev/null 2>&1
chmod +x bw >/dev/null 2>&1
chmod +x ipsec-menu
chmod +x sstp-menu
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
echo -e "[ ${green}INFO${NC} ] remove unnecessary files "
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx "
/etc/init.d/nginx restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting openvpn "
/etc/init.d/openvpn restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/cron restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/ssh restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/dropbear restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/fail2ban restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting sslh "
/etc/init.d/sslh restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel5 "
/etc/init.d/stunnel5 restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/vnstat restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/fail2ban restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting squid "
/etc/init.d/squid restart
/etc/init.d/squid status
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
