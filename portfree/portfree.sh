#!/bin/bash

ip="0.0.0.0"
port=80

usage="
Run options:\n
  -i IP           \t remote ip address
  -p PORT         \t port
  -h HELP         \t show help\n
"
while getopts "i:p:h" arg
do
  case ${arg} in
       i)
          ip=$OPTARG
          ;;
       p)
          port=$OPTARG
          ;;
       h)
          echo -e ${usage}
          exit 1
          ;;
       ?)
          echo -e ${usage}
          exit 1
          ;;
  esac
done

nport=`echo ""|telnet $ip $port 2>/dev/null|grep "\^]"|wc -l`
if [ "$nport" -eq "0" ];then
  echo "true"
else
  echo "false"
fi
