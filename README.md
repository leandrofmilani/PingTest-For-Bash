# PingTest-For-Bash
A simple bash script for ping test that give you an alert when it's up or down

First you need to create a log file and give it permission for writing.
```
sudo touch /var/log/ping.log && sudo chown `echo $USER` /var/log/pingtest.log
```
If you want to use the script as a default bash program, on Debian you need to place this script in /bin/ or create a symbolic link to this directory.

Then you need to give the permission to execute the script using the followed command: 
```
chmod +x pingtest.sh
```
Usage:
For alert you when the host is up:
```
:~$ pintest up 192.168.1.1
```
For alert you when the host goes down
```
:~$ pingtest down 8.8.8.8
```
