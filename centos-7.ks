install
url --url http://mirror.hmc.edu/centos/7.0.1406/os/x86_64/

lang en_US.UTF-8
keyboard us
timezone Asia/Tokyo

network --device=eth0 --bootproto=dhcp --ipv6=auto
firewall --enable --ssh

authconfig --enableshadow --passalgo=sha512
selinux --disabled
rootpw vagrant

text
skipx

clearpart --all --initlabel
zerombr
autopart
bootloader --location=mbr

firstboot --disabled
reboot

%packages
@Core
@^GNOME Desktop
@C Development Tools and Libraries
bzip2
gcc
kernel-devel
kernel-headers
sudo
-avahi
-bluez-utils
-dogtail
-kudzu
-ipw2100-firmware
-ipw2200-firmware
-iwl*-firmware
-ivtv-firmware
%end

%post
yum update -y

# disable unnecessary services
chkconfig acpid off
chkconfig auditd off
chkconfig blk-availability off
chkconfig bluetooth off
chkconfig certmonger off
chkconfig cpuspeed off
chkconfig cups off
chkconfig haldaemon off
chkconfig ip6tables off
chkconfig lvm2-monitor off
chkconfig mdmonitor off
chkconfig rpcbind off
chkconfig rpcgssd off
chkconfig rpcidmapd off
chkconfig yum-updateonboot off

# vagrant
#groupadd vagrant -g 1001
#useradd vagrant -g vagrant -G wheel -u 1001
#echo "vagrant" | passwd --stdin vagrant

#echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
#sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

yum clean all
%end
