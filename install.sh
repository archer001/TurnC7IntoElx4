#!/bin/bash
mv /etc/pki/rpm-gpg /etc/pki/rpm-gpg_source
mv TurnC7IntoElx4/rpm-gpg /etc/pki/
mv /etc/yum.repos.d /etc/yum.repos.d_source
mv TurnC7IntoElx4/yum.repos.d /etc/
sed -i -e "s/rhgb quiet /rhgb quiet net.ifnames=0/" /boot/grub2/grub.cfg
yum -y remove biosdevname
yum -y install $(cat TurnC7IntoElx4/package_elastix-4)
sed -i -e "s/SELINUX=enforcing/SELINUX=permissive/" /etc/sysconfig/selinux
systemctl stop firewalld
systemctl disable firewalld.service
reboot
