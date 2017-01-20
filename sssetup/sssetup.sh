#! /bin/bash

# this script will install shadowsocks server on this system(onle useful in ubuntu by far)
# and open specified port for specified ip
# e.x
# if the manager server ip is 123.45.67.89 and run this script on shadowsocks server(e.x 65.4.32.1)
# then onle the 123.45.67.89 can access the shadowsocks server on the specified port
# attention! you must run this script as root

# auther classTC<classtc15@gmail.com>
# version 0.0.1

ssconfdir="/etc/shadowsocks"
ssconf="/etc/shadowsocks/ssconf.json"
ssaddr="0.0.0.0"

method="aes-256-cfb"
passlen=8
ssport=9001
mgrip="0.0.0.0"

usages="
Run options:\n
  -m METHOD       \t encryption method, default: aes-256-cfb\n
  -l PASSLEN      \t password length, default: 8\n
  -p LOCAL_PORT   \t ssserver run at this port,default: 9001\n
  -i MANAGER_IP   \t manager server ip\n
  -h HELP         \t show help\n
"

while getopts "m:l:p:i:" arg
do
  case $arg in
       m)
          method=$OPTARG
          ;;
       l)
          passlen=$OPTARG
          ;;
       p)
          ssport=$OPTARG
          ;;
       i)
          mgrip=$OPTARG
          ;;
       h)
          echo -e $usages
          exit 1
          ;;
       ?)
          echo -e $usages
          exit 1
          ;;
  esac
done

# generate random password
function randomPwd(){
    j=0;
    for i in {a..z};do array[$j]=$i;j=$(($j+1));done
    for i in {A..Z};do array[$j]=$i;j=$(($j+1));done
    for ((i=0;i<$1;i++));do strs="$strs${array[$(($RANDOM%$j))]}"; done;
    echo $strs
}

# setup environment
apt-get update
apt-get install python-pip
pip install shadowsocks

# create shadowsocks config file in the specified path
mkdir -p $ssconfdir
touch $ssconfpath
echo "{
    \"server\": \"$ssaddr\",
    \"port_password\": {
        \"8481\": \"$(randomPwd $passlen)\"
    },
    \"timeout\": 300,
    \"method\": \"$method\"
}" > $ssconfpath

# start ssserver
ssserver --manager-address ${ssaddr}":"${ssport} -c ${ssconfpath} -d start

# setup the firewall for access premission
# only the specified ip(like mgrip) can access the specified port
iptables -I INPUT -p udp --dport $ssport -j DROP
iptables -I INPUT -s $mgrip -p udp --dport $ssport -j ACCEPT
