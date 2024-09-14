debian@debian12:~/Downloads/linux_developer$ su -
Password: 
root@debian12:~# sudo nano /etc/bind/db.yaho.com
 

$TTL 1h
@       IN      SOA     ns1.yaho.com. root.yaho.com. (
        3600     ; refresh
        3600     ; retry
        604800   ; expire
        3600     ; minimum
)
@       IN      NS      ns1.yaho.com.
@       IN      A       192.168.1.100


root@debian12:~# sudo service bind9 restart
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.
root@debian12:~# sudo systemctl status named.ser
vice
× named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.>
     Active: failed (Result: exit-code) since F>
   Duration: 8min 11.637s
       Docs: man:named(8)
    Process: 14923 ExecStart=/usr/sbin/named -f>
   Main PID: 14923 (code=exited, status=1/FAILU>
        CPU: 67ms

Sep 13 16:40:16 debian12 systemd[1]: named.serv>
Sep 13 16:40:16 debian12 systemd[1]: Stopped na>
Sep 13 16:40:16 debian12 systemd[1]: named.serv>
Sep 13 16:40:16 debian12 systemd[1]: named.serv>
Sep 13 16:40:16 debian12 systemd[1]: Failed to >
root@debian12:~# sudo journalctl -xeu named.service && sudo journalctl -u named.service
Sep 13 16:40:16 debian12 systemd[1]: named.serv>
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ The unit named.service has entered the 'fail>
Sep 13 16:40:16 debian12 systemd[1]: Failed to >
░░ Subject: A start job for unit named.service >
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ A start job for unit named.service has finis>
░░ 
░░ The job identifier is 4999 and the job resul>
Sep 13 15:37:16 debian12 systemd[1]: Starting n>
Sep 13 15:37:16 debian12 named[11538]: starting>
Sep 13 15:37:16 debian12 named[11538]: running >
Sep 13 15:37:16 debian12 named[11538]: built wi>
Sep 13 15:37:16 debian12 named[11538]: running >
Sep 13 15:37:16 debian12 named[11538]: compiled>
Sep 13 15:37:16 debian12 named[11538]: compiled>
Sep 13 15:37:16 debian12 named[11538]: linked t>
Sep 13 15:37:16 debian12 named[11538]: compiled>
Sep 13 15:37:16 debian12 named[11538]: linked t>
Sep 13 15:37:16 debian12 named[11538]: compiled>
Sep 13 15:37:16 debian12 named[11538]: linked t>
Sep 13 15:37:16 debian12 named[11538]: compiled>
Sep 13 15:37:16 debian12 named[11538]: linked t>
root@debian12:~# sudo nano /etc/bind/named.conf
root@debian12:~# sudo nano /etc/bind/named.conf.options
root@debian12:~# sudo nano /etc/bind/named.conf.local
root@debian12:~# sudo service named restart
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.
root@debian12:~# sudo systemctl status named.service
sudo journalctl -xeu named.service
× named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.>
     Active: failed (Result: exit-code) since F>
   Duration: 8min 11.637s
       Docs: man:named(8)
    Process: 15852 ExecStart=/usr/sbin/named -f>
   Main PID: 15852 (code=exited, status=1/FAILU>
        CPU: 40ms

Sep 13 16:49:38 debian12 systemd[1]: named.serv>
Sep 13 16:49:38 debian12 systemd[1]: Stopped na>
Sep 13 16:49:38 debian12 systemd[1]: named.serv>
Sep 13 16:49:38 debian12 systemd[1]: named.serv>
Sep 13 16:49:38 debian12 systemd[1]: Failed to >
Sep 13 16:49:38 debian12 systemd[1]: named.serv>
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ The unit named.service has entered the 'fail>
Sep 13 16:49:38 debian12 systemd[1]: Failed to >
░░ Subject: A start job for unit named.service >
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ A start job for unit named.service has finis>
░░ 
░░ The job identifier is 5479 and the job resul>
root@debian12:~# sudo systemd status named.servi
ce &&  sudo journalctl -xeu named.service
root@debian12:~# sudo journalctl -xeu named.service
Sep 13 16:49:38 debian12 systemd[1]: named.serv>
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ The unit named.service has entered the 'fail>
Sep 13 16:49:38 debian12 systemd[1]: Failed to >
░░ Subject: A start job for unit named.service >
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ A start job for unit named.service has finis>
░░ 
░░ The job identifier is 5479 and the job resul>
root@debian12:~# sudo named-checkconf /etc/bind/named.conf
/etc/bind/named.conf.options:26: unknown option 'dnssec-validation'
/etc/bind/named.conf.options:28: unknown option 'listen-on-v6'
root@debian12:~# sudo nano /etc/bind/named.conf
root@debian12:~# sudo named-checkconf /etc/bind/named.conf

# options {
#     dnssec-validation yes;
# }

root@debian12:~# sudo named-checkconf /etc/bind/named.conf
/etc/bind/named.conf.options:2: 'options' redefined near 'options'
root@debian12:~# 
