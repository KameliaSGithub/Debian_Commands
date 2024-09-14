debian@debian12:~/Downloads/linux_developer$ su -
Password: 
root@debian12:~# sudo apt-get install bind9
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
bind9 is already the newest version (1:9.18.28-1~deb12u2).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
root@debian12:~# sudo nano /etc/bind/named.conf.options
root@debian12:~# sudo nano /etc/bind/db.google.com
root@debian12:~# sudo nano /etc/bind/named.conf.local
root@debian12:~# sudo service bind9 restart
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.
root@debian12:~# journalctl -xeu named.service. 
~
~
~
~
~
~
~
~
~
~
~
~
-- No entries --
root@debian12:~# systemctl status named.service
× named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named>
     Active: failed (Result: exit-code) since >
   Duration: 8min 11.637s
       Docs: man:named(8)
    Process: 12919 ExecStart=/usr/sbin/named ->
   Main PID: 12919 (code=exited, status=1/FAIL>
        CPU: 46ms

Sep 13 15:45:29 debian12 systemd[1]: named.ser>
Sep 13 15:45:29 debian12 systemd[1]: Stopped n>
Sep 13 15:45:29 debian12 systemd[1]: named.ser>
Sep 13 15:45:29 debian12 systemd[1]: named.ser>
Sep 13 15:45:29 debian12 systemd[1]: Failed to>
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ The unit named.service has entered the 'failed' state with resul>
Sep 13 15:45:29 debian12 systemd[1]: Failed to start named.service >
░░ Subject: A start job for unit named.service has failed
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ A start job for unit named.service has finished with a failure.
░░ 
░░ The job identifier is 4440 and the job result is failed.
~
