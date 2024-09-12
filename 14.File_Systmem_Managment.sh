debian@debian12:~/Downloads/linux_developer$ su -
Password: 
root@debian12:~#  lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    0   40G  0 disk 
├─sda1   8:1    0   39G  0 part /
├─sda2   8:2    0    1K  0 part 
└─sda5   8:5    0  975M  0 part [SWAP]
sr0     11:0    1   51M  0 rom  
root@debian12:~# sudo mkfs.ext4 /dev/sda5
mke2fs 1.47.0 (5-Feb-2023)
/dev/sda5 is mounted; will not make a filesystem here!
root@debian12:~# sudo umount /dev/sda5
umount: /dev/sda5: not mounted.
root@debian12:~# mount | grep sda5
root@debian12:~# sudo mkfs.ext4 /dev/sda5
mke2fs 1.47.0 (5-Feb-2023)
/dev/sda5 is mounted; will not make a filesystem here!
root@debian12:~#  sudo swapoff /dev/sda5


Killed
root@debian12:~# sudo mkfs.ext4 /dev/sda5
mke2fs 1.47.0 (5-Feb-2023)
/dev/sda5 is mounted; will not make a filesystem here!
root@debian12:~# sudo mount /dev/sda5 /mnt
mount: /mnt: unknown filesystem type 'swap'.
       dmesg(1) may have more information after failed mount system call.
root@debian12:~# sudo mount -t ext4 /dev/sda5 /mnt
mount: /mnt: /dev/sda5 already mounted or mount point busy.
       dmesg(1) may have more information after failed mount system call.
root@debian12:~# sudo mkfs.ext4 /dev/sda5
mke2fs 1.47.0 (5-Feb-2023)
/dev/sda5 is mounted; will not make a filesystem here!
root@debian12:~# udo mount /dev/sda5 /mnt
-bash: udo: command not found
root@debian12:~# audo mount /dev/sda5 /mnt
-bash: audo: command not found
root@debian12:~# sudo mount /dev/sda5 /mnt
mount: /mnt: unknown filesystem type 'swap'.
       dmesg(1) may have more information after failed mount system call.
root@debian12:~#  sudo umount /mnt
umount: /mnt: not mounted.
root@debian12:~# 

