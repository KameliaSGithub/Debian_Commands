debian@debian12:~/Downloads/linux_developer$ su -
Password: 
root@debian12:~# sudo nano /etc/bind/roundrobin.zone


       /etc/bind/roundrobin.zone *              
@       IN      NS      ns1.roundrobin.example.>

; A records (Round Robin)
@       IN      A       192.168.1.100
@       IN      A       192.168.1.101
@       IN      A       192.168.1.102


root@debian12:~# sudo nano /etc/bind/named.conf.local

       /etc/bind/named.conf.local               
//
// Do any local configuration here
//

zone "google.com" {
    type master;
    file "/etc/bind/db.google.com";
};


root@debian12:~# sudo service named restart
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.
root@debian12:~# sudo nano /etc/bind/roundrobin.zone

       /etc/bind/roundrobin.zone *              
        3600     ; refresh
        3600     ; retry
        604800   ; expire
        3600     ; minimum
)
@       IN      NS      ns1.roundrobin.example.>
@       IN      NS      ns2.roundrobin.example.>
@       IN      A       192.168.1.100
@       IN      A       192.168.1.101
@       IN      A       192.168.1.102; Round Ro>
; Zone file for roundrobin.example.com

; SOA record
@       IN      SOA     ns1.roundrobin.example.>
        3600     ; refresh
        3600     ; retry
        604800   ; expire
        3600     ; minimum
)

; NS records
@       IN      NS      ns1.roundrobin.example.>




      /etc/bind/named.conf.local *             
zone "roundrobin.example.com" {
    type master;
    file "/etc/bind/roundrobin.zone";
};
//
// Do any local configuration here
//

zone "google.com" {
    type master;
    file "/etc/bind/db.google.com";
};

root@debian12:~# sudo nano /etc/bind/named.conf.local


// Consider adding the 1918 zones here, if they>
// organization
//include "/etc/bind/zones.rfc1918";

root@debian12:~# journalctl -xeu named.service
░░ Support: https://www.debian.org/support
░░ 
░░ The unit named.service has entered the 'fail>
Sep 13 19:16:52 debian12 systemd[1]: Failed to >
░░ Subject: A start job for unit named.service >
░░ Defined-By: systemd
░░ Support: https://www.debian.org/support
░░ 
░░ A start job for unit named.service has finis>
░░ 
░░ The job identifier is 6998 and the job resul>
root@debian12:~# sudo systemctl restart named.service 
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.
root@debian12:~#  sudo journalctl -xeu debian12
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
root@debian12:~# ls -l
total 24
drwxr-xr-x 3 root root 4096 Sep 12 17:23 Debian_Commands
-r-xr-xr-x 1 root root 7244 Sep 12 13:27 vboxpostinstall.sh
-rw-r--r-- 1 root root  362 Sep 12 13:39 wget-log
-rw-r--r-- 1 root root  362 Sep 12 13:40 wget-log.1
-rw-r--r-- 1 root root  249 Sep 13 16:39 yaho.com
root@debian12:~# ls /etc/bind
bind.keys      named.conf
db.0           named.conf.default-zones
db.127         named.conf.local
db.255         named.conf.options
db.empty       rndc.key
db.google.com  roundrobin.zone
db.local       zones.rfc1918
root@debian12:~# sudo cat /etc/bind/named.conf.local
zone "roundrobin.example.com" {
    type master;
    file "/etc/bind/roundrobin.zone";
};
//
// Do any local configuration here
//

zone "google.com" {
    type master;
    file "/etc/bind/db.google.com";
};




// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

root@debian12:~# sudo cat /etc/bind/db.*
;
; BIND reverse data file for "this host on this network" zone
;
$TTL    604800
@       IN      SOA     localhost. root.localhost. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
;
; BIND reverse data file for local loopback interface
;
$TTL    604800
@       IN      SOA     localhost. root.localhost. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
1.0.0   IN      PTR     localhost.
;
; BIND reverse data file for broadcast zone
;
$TTL    604800
@       IN      SOA     localhost. root.localhost. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL    86400
@       IN      SOA     localhost. root.localhost. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
; Zone file for google.com
;
$TTL 604800
@   IN  SOA  google.com. root.google.com. (
                1 ; refresh
                3600 ; retry
                604800 ; expire
                3600) ; minimum

@   IN  NS  google.com.
@   IN  A   216.58.194.174
@   IN  A   216.58.194.135
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     localhost. root.localhost. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
@       IN      A       127.0.0.1
@       IN      AAAA    ::1
root@debian12:~#  sudo systemctl restart named.service 
Job for named.service failed because the control process exited with error code.
See "systemctl status named.service" and "journalctl -xeu named.service" for details.

