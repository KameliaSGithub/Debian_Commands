debian@debian12:~/Downloads/linux_developer$ ip address show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:92:f1:64 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
       valid_lft 81489sec preferred_lft 81489sec
    inet6 fe80::a00:27ff:fe92:f164/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
debian@debian12:~/Downloads/linux_developer$ sudo ip addr add 192.168.1.100/24 brd 192.168.1.255 dev enp0s3 &&
sudo ip link set enp0s3 up
[sudo] password for debian: 
debian is not in the sudoers file.
debian@debian12:~/Downloads/linux_developer$ su -
Password: 
root@debian12:~# sudo ip addr add 192.168.1.100/24 brd 192.168.1.255 dev enp0s3
sudo ip link set enp0s3 up
root@debian12:~# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:92:f1:64 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
       valid_lft 81309sec preferred_lft 81309sec
    inet 192.168.1.100/24 brd 192.168.1.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe92:f164/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
root@debian12:~# 
