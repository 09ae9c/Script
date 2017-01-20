# SSSetup

automatic setup Shadowsocks on Server

## Usages

it can automatic setup Shadowsocks server and open specified port(by `-p <open_port>`) for the specified server, that means only the specified server(by `-i <manage_server_ip>`) can send message to this Shadowsocks server
``` shell
# firsty cd to file dir
sudo ./sssetup.sh -m <encryption_method> -p <open_port> -i <manage_server_ip>
```

## Options

  - -m:  	encryption method, default: aes-256-cfb
  - -l:     password length, default: 8
  - -p:    	ssserver run at this port,default: 9001
  - -i:  	manager server ip

## TODO

Currently it can only work at Ubuntu 14.04...