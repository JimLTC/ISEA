# ISEA
For Bridging ISEA Module

Student: Lam Thanh Chieu
Kaplan ID: CT0382466
Murdoch ID: 35614306

---

## Lab 1a - Setting Up Linux
- Installed Ubuntu 24.04.4 LTS on UTM (Apple Silicon Mac)
- Used ARM64 ISO for Apple Silicon compatibility
- Configured VM with 4 CPUs, 8GB RAM, 60GB storage
- Resolved ISO boot loop by detaching ISO and selecting "Boot from next volume"
- Successfully booted and logged into Ubuntu Server
![Screenshot 1](001.png)

## Lab 1a - Basic Linux Commands
- `pwd` - shows current directory
- `ls`, `ls -la`, `ls -lah`, `ls -alt` - list files with various detail levels
- `cd /etc`, `cd /var`, `cd /home`, `cd ~` - directory navigation
- `mkdir mylab` - created new directory
- `touch mylab/text.txt` - created empty file
- `cp README.md README_backup.md` - copy a file
- `mv README_backup.md README_copy.md` - rename/move a file
- `cat README.md` - view file contents
- `man ls` - view manual pages
- `uname -a` - system/kernel information
- `lsb_release -a` - Ubuntu version details
- `hostnamectl` - hostname information
- `ps -e` - list all running processes
- `top` - live process monitor (press 1 for CPU cores, q to exit)
- `ip a` - network interface and IP address
- `whoami` / `sudo whoami` - current user vs root privileges
![Screenshot 2](1.png)
![Screenshot 3](2.png)
![Screenshot 4](3.png)
![Screenshot 5](4.png)
![Screenshot 6](5.png)

## Lab 1b - Linux Services
- Installed Apache2 web server: `sudo apt install apache2 -y`
- Installed nmap: `sudo apt install nmap -y`
- Verified Apache running: `sudo systemctl status apache2`
- Tested web server locally: `curl http://127.0.0.1`
- Installed and managed SSH: `sudo apt install openssh-server -y`
- Started, stopped and checked SSH: `sudo systemctl start|stop|status ssh`
- Configured UFW firewall: enabled firewall, allowed ports 80 and 22
- Scanned open ports with nmap: `nmap 127.0.0.1`
- Downloaded 3 Gutenberg books using `wget`
- Created tar archive: `tar cf books.tar books`
- Compressed with bzip2: `bzip2 books.tar` → produced `books.tar.bz2`
![Screenshot 6](5.png)
![Screenshot 7](6.png)
![Screenshot 8](7.png)
![Screenshot 9](8.png)
![Screenshot 10](9.png)
![Screenshot 17](16.png)
![Screenshot 18](17.png)
![Screenshot 19](18.png)
![Screenshot 20](19.png)
![Screenshot 21](20.png)
![Screenshot 22](21.png)
![Screenshot 23](22.png)
![Screenshot 24](23.png)
![Screenshot 25](24.png)
![Screenshot 26](25.png)
![Screenshot 27](26.png)
![Screenshot 28](27.png)
![Screenshot 29](28.png)
![Screenshot 30](29.png)
![Screenshot 31](30.png)
![Screenshot 32](31.png)
![Screenshot 33](32.png)
![Screenshot 34](33.png)
![Screenshot 35](34.png)
![Screenshot 36](35.png)
![Screenshot 37](36.png)
![Screenshot 40](39.png)
![Screenshot 41](40.png)

## Lab 1b - Linux Permissions
- Created users: alice, bob, mallory using `sudo adduser`
- Created group: `sudo groupadd labgroup`
- Added alice and bob to labgroup; mallory excluded
- Created shared directory: `sudo mkdir /home/shared`
- Created 10 files inside shared directory
- Set ownership: `sudo chown -R alice:labgroup /home/shared`
- Set permissions: `sudo chmod -R 750 /home/shared`
  - alice (owner): read, write, execute
  - bob (labgroup): read and execute only
  - mallory (no group): permission denied
- Verified by switching users with `su [user] -s /bin/bash`
![Screenshot 38](37.png)
![Screenshot 39](38.png)
![Screenshot 40](39.png)

## Lab 1b - Searching Filesystems
- Used `find . -name "*.txt"` to locate files by extension
- Used `find . -type f -size +100k` to find files over 100KB
- Used `find . -type f -printf '%T+ %p\n' | sort -r | head` for recently modified files
- Used `grep -r "the" . | wc -l` to count matches recursively
- Used `grep -r "ISEA" /home/ltc/` to search file contents
![Screenshot 11](10.png)
![Screenshot 12](11.png)
![Screenshot 13](12.png)
![Screenshot 14](13.png)
![Screenshot 15](14.png)
![Screenshot 16](15.png)

## Lab 2a - Total Cost of Ownership (TCO)
- Compared TCO of two printers over 5 years:
  - Printer A: HP DeskJet 2755e (Budget Inkjet)
  - Printer B: Brother HL-L2350DW (Entry Laser)
- Assumptions used: 750 pages/week, 40 hrs power/week, 5-year period, SGD $0.30/kWh
- Calculated fixed costs (printer purchase) and variable costs (ink/toner, paper, electricity, maintenance)
- Laser printer proved more cost-effective at high volume despite higher upfront cost
- Created 3-year cumulative cost projection
- Analysed break-even point and cost per page
- Tool used: Microsoft Excel
![TCO1](TCO1.png)
![TCO2](TCO2.png)
![TCO3](TCO3.png)
![TCO4](TCO4.png)

## Lab 2b - Cloud Computing (Microsoft Azure)
- Attempted AWS EC2 but encountered account restrictions on new account
- Successfully deployed Ubuntu VM on Microsoft Azure for Students
  - VM Name: ISEA-VM
  - Region: Central India
  - Size: Standard_B2ats_v2 (2 vCPUs, 1GB RAM) - US$8.69/month
  - OS: Ubuntu Server 24.04 LTS
- Connected via SSH from Mac terminal: `ssh isealab@20.244.8.195`
- Updated OS packages: `sudo apt update && sudo apt upgrade -y`
![Screenshot 42](41.png)
![Screenshot 43](42.png)

## Lab 2b - Bash Scripting
- Created `myscript.sh` with echo, date, whoami, uptime commands
- Created `loops.sh` with if statement and for loop
- Made scripts executable with `chmod +x`
- Ran scripts with `bash scriptname.sh`
![Screenshot 44](43.png)
![Screenshot 45](44.png)

## Lab 3a - DNS Configuration
- Registered free subdomain: `isealab.mooo.com` via FreeDNS (freedns.afraid.org)
- Created A record pointing `isealab.mooo.com` → `20.244.8.195`
- Opened port 443 (HTTPS) on Azure VM firewall
- Verified DNS propagation using `nslookup isealab.mooo.com` → confirmed IP 20.244.8.195
- Installed Apache2 web server on Azure VM
- Confirmed Apache welcome page loading at `http://isealab.mooo.com`

## Lab 3a - SSL Certificate (Let's Encrypt)
- Installed Certbot via snap on Azure VM
- Ran `sudo certbot --apache` for domain `isealab.mooo.com`
- Certificate successfully issued by Let's Encrypt
- HTTPS enabled at `https://isealab.mooo.com`
- Verified lock icon in browser showing Let's Encrypt as issuer
- Certificate valid from 29 March 2026 to 27 June 2026
- Tested auto-renewal with `sudo certbot renew --dry-run` - all renewals succeeded

## Lab 3b - Server Automation (Bash + Cron)
- Created test directory structure in ~/Documents with 10 files across 2 folders
- Wrote backup script `testscript` that:
  - Copies ~/Documents to ~/backup/
  - Creates timestamped zip file (e.g. 29_03_26.zip)
  - Logs completion to ~/backup.log
- Made script executable with `chmod +x`
- Moved script to /usr/bin/testscript for system-wide access
- Scheduled with cron: `0 * * * * isealab /usr/bin/testscript` (runs every hour)
- Challenge 1: Added `@reboot /usr/bin/testscript` to run at boot
- Challenge 2: Installed figlet and neofetch for system info display

## Lab 4a - Additional Server Service (MySQL)
- Chose MySQL as the additional server service
- Installed MySQL: `sudo apt install mysql-server -y`
- Verified MySQL running: `sudo systemctl status mysql` - Server is operational
- Ran `sudo mysql_secure_installation` to secure the installation
- Logged into MySQL: `sudo mysql`
- Created database: `CREATE DATABASE isealab;`
- Created table: `CREATE TABLE students (id, name, course)`
- Inserted record: `INSERT INTO students VALUES ('Lam', 'BRG-ISEA')`
- Queried data: `SELECT * FROM students` - returned 1 row successfully
- MySQL version: 8.0.45
