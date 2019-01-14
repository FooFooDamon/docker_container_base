#!/bin/bash

[ -z "$USER" ] && SUDO="" || SUDO=sudo

$SUDO apt update

$SUDO apt install -y language-pack-zh-hans language-pack-zh-hant
[ `grep "LANG=zh_CN\.UTF\-8" $HOME/.bashrc -c` -eq 0 ] && echo "export LANG=zh_CN.UTF-8" >> $HOME/.bashrc

$SUDO apt install -y perl expect

$SUDO apt install -y gcc g++ make cmake
$SUDO apt install -y automake autoconf libtool pkg-config flex bison

$SUDO apt install -y vim ctags

$SUDO apt install -y git

$SUDO apt install net-tools # for ifconfig command

$SUDO apt install -y openssh-server
$SUDO sed -i "/^[#]\{0,1\}[ ]\{0,\}\(PermitRootLogin \).*/s//\1yes/g" /etc/ssh/sshd_config
$SUDO sed -i "/^[#]\{0,1\}[ ]\{0,\}\(UsePAM \).*/s//\1no/g" /etc/ssh/sshd_config
$SUDO service ssh start
[ $(grep "service ssh start" ~/.bashrc -c) -gt 0 ] || echo '[ $(ps -ef | grep [s]shd -c) -gt 0 ] || service ssh start' >> $HOME/.bashrc
echo "** Remember to set the password first for the current user if you want to login via SSH !!!" >&2

mkdir -p $HOME/bin $HOME/etc $HOME/include $HOME/lib $HOME/src

