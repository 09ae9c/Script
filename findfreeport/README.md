# FindFreePort

scan the specified remote server`s ports and find a free port between 10000 to 65535

## Usage

```shell
# firstly cd to file dir
sudo chmod +x ffp.sh
./ffp.sh -i <remote_server_ip>
```

it will return a free port of the remote server, if there has no more free ports, return -1

## Options

- -i:		remote server ip