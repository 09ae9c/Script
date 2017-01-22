# PortCheck

check if the specified port of remote server is open

## Useage

```shell
# firstly cd to file dir
sudo chmod +x portcheck.sh
./portcheck.sh -i <remote_server_ip> -p <port>
```

if specified port is open, return false.


## Options

- -i:		remote server ip
- -p:		port