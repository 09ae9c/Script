#!/bin/bash
# scan the specified remote server's ports and find a free port between 10000 to 65535
# if there is no free port at remote server, return -1
#
# author classTC<classtc15@gmail.com>

ip="0.0.0.0"

usage="
Run options:\n
  -i IP           \t remote server ip address
  -h HELP         \t show help\n
"
while getopts "i:p:h" arg
do
  case ${arg} in
       i)
          ip=$OPTARG
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

MIN_PORT=10000
MAX_PORT=65535

cPort=$MIN_PORT

while true
do
    # return 1 if the port is in use, 0 mean it is free
    result=`echo ""|telnet $ip $cPort 2>/dev/null|grep "\^]"|wc -l`

    if [ $result -eq "0" ]; then # if current port is free, return it
        break;
    fi

    if [ $cPort -ge $MAX_PORT ]; then # if there is no free ports, return -1
        cPort=-1;
        break;
    fi
    cPort=$[$cPort+1]
done
echo $cPort




