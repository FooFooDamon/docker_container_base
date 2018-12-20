#!/bin/bash

[ -z "$USER" ] && SUDO="" || SUDO=sudo

$SUDO apt update
$SUDO apt install language-pack-zh-hans language-pack-zh-hant
echo "export LANG=zh_CN.UTF-8" >> $HOME/.bashrc
$SUDO apt install perl expect
$SUDO apt install gcc g++ make cmake
$SUDO apt install automake autoconf libtool pkg-config flex bison
$SUDO apt install vim ctags
$SUDO apt install git
mkdir -p $HOME/bin $HOME/etc $HOME/include $HOME/lib $HOME/src

