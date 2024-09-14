debian@debian12:~/Downloads/linux_developer$ nslookup www.example.com
Server:         1.1.1.1
Address:        1.1.1.1#53

Non-authoritative answer:
Name:   www.example.com
Address: 93.184.215.14
Name:   www.example.com
Address: 2606:2800:21f:cb07:6820:80da:af6b:8b2c

debian@debian12:~/Downloads/linux_developer$ dig www.example.com

; <<>> DiG 9.18.28-1~deb12u2-Debian <<>> www.example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 17554
;; flags: qr rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;www.example.com.               IN      A

;; ANSWER SECTION:
www.example.com.        1250    IN      A       93.184.215.14

;; Query time: 60 msec
;; SERVER: 1.1.1.1#53(1.1.1.1) (UDP)
;; WHEN: Fri Sep 13 15:15:09 EEST 2024
;; MSG SIZE  rcvd: 60

debian@debian12:~/Downloads/linux_developer$ host www.example.com
www.example.com has address 93.184.215.14
;; communications error to 1.1.1.1#53: timed out
;; communications error to 1.1.1.1#53: timed out
www.example.com has IPv6 address 2606:2800:21f:cb07:6820:80da:af6b:8b2c
debian@debian12:~/Downloads/linux_developer$ 
