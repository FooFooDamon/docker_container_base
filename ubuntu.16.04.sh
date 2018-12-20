#!/bin/bash

[ -z "$USER" ] && SUDO="" || SUDO=sudo

$SUDO apt update
$SUDO apt install -y language-pack-zh-hans language-pack-zh-hant
echo "export LANG=zh_CN.UTF-8" >> $HOME/.bashrc
$SUDO apt install -y perl expect
$SUDO apt install -y gcc g++ make cmake
$SUDO apt install -y automake autoconf libtool pkg-config flex bison
$SUDO apt install -y vim ctags
$SUDO apt install -y git
mkdir -p $HOME/bin $HOME/etc $HOME/include $HOME/lib $HOME/src

