# ISEA
For Bridging ISEA Module

Student: Lam Thanh Chieu
Kaplan ID: CT0382466
Murdoch ID: 35614306

## Lab 1a - Setting Up Linux
- Installed Ubuntu 24.04.4 LTS on UTM (Apple Silicon Mac)
- Successfully booted and logged in via terminal

## Lab 1a - Basic Linux Commands
Commands practised:
- `pwd` - shows current directory (/home/ltc/ISEA)
- `ls` - lists files in current directory
- `cd /etc` - navigate to /etc (system config files)
- `cd /var` - navigate to /var (logs and variable data)
- `cd /home` - navigate to /home (user directories)
- `mkdir mylab` - created a new directory
- `touch mylab/text.txt` - created an empty file
- `man ls` - viewed manual page for ls command

## Lab 1b - Linux Services
- Discovered SSH was not installed, installed it with `sudo apt install openssh-server -y`
- Started, stopped and checked status using `sudo systemctl start|stop|status ssh`

## Lab 1b - Linux Permissions
- Viewed permissions with `ls -l`
- Changed permissions with `chmod 755 mylab/text.txt` (changed from rw-rw-r-- to rwxr-xr-x)
- Changed ownership with `chown ltc:ltc mylab/text.txt`

## Lab 1b - Searching Filesystems
- Used `find /home -name "text.txt"` to locate files by name
- Used `grep -r "ISEA" /home/ltc/` to search file contents recursively
