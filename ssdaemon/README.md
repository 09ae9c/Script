# SSDaemon

daemon for ssserver progress to keep it alive

## Usages

1. configuration your ssserver, then you got a start command like `sudo ssserver -c /home/config.json -d start`.
2. create a cron job use `crontab -e`.
3. write you logic for ssdaemon.sh like `*/5 * * * * sh /home/ssdaemon.sh > /home/output.log` which means run ssdaemon.sh every 5 minutes.

it's all done!

this job will check whether ssserver is running or not every 5 minutes, and if not running, restart it.
