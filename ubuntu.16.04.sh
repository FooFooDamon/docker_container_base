#!/bin/bash

[[ -z "$USER" || "$USER" = "root" ]] && SUDO="" || SUDO=sudo

echo -e "\e[0;33mNOTE: Add the option of '-v /etc/localtime:/etc/localtime:ro' while running 'docker run' to set the time zone correctly!!!\e[0m" >&2
#[ $(ls -l /etc/localtime | grep -i shanghai -c) -gt 0 ] || ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

$SUDO sed -i "/archive\.ubuntu/s//cn.archive.ubuntu/g" /etc/apt/sources.list
$SUDO apt update

# Avoid interactive package installers such as tzdata.
export DEBIAN_FRONTEND=noninteractive

$SUDO apt install -y apt-transport-https build-essential ca-certificates

# ifconfig in net-tools
$SUDO apt install -y net-tools curl wget

$SUDO apt install -y language-pack-zh-hans language-pack-zh-hant
[ `grep "LANG=zh_CN\.UTF\-8" $HOME/.bashrc -c` -eq 0 ] && echo "export LANG=zh_CN.UTF-8" >> $HOME/.bashrc

$SUDO apt install -y perl expect xterm

$SUDO apt install -y gcc g++ make cmake
$SUDO apt install -y automake autoconf libtool pkg-config flex bison
$SUDO apt install -y gdb
#$SUDO apt install -y apport
[ `grep "ulimit -c unlimited" $HOME/.bashrc -c` -eq 0 ] && echo "ulimit -c unlimited" >> $HOME/.bashrc

$SUDO apt install -y vim
#$SUDO apt install -y ctags

$SUDO apt install -y git

$SUDO apt install -y parallel jq dos2unix zip unzip

#$SUDO apt install -y openssh-server
#$SUDO sed -i "/^[#]\{0,1\}[ ]\{0,\}\(PermitRootLogin \).*/s//\1yes/g" /etc/ssh/sshd_config
#$SUDO sed -i "/^[#]\{0,1\}[ ]\{0,\}\(UsePAM \).*/s//\1no/g" /etc/ssh/sshd_config
#$SUDO service ssh start
#[ $(grep "service ssh start" ~/.bashrc -c) -gt 0 ] || echo '[ $(ps -ef | grep [s]shd -c) -gt 0 ] || service ssh start' >> $HOME/.bashrc
#echo "** Remember to set the password first for the current user if you want to login via SSH !!!" >&2

mkdir -p $HOME/bin $HOME/etc $HOME/include $HOME/lib $HOME/src

