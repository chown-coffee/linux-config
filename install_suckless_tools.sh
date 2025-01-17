#!/bin/sh

github="https://github.com/chown-coffee"

echo "-------- ------"
echo "Updating system"
echo "-------- ------"
echo

cd ~

sudo pacman -Syyu

git --help >/dev/null 2>/dev/null

if [ $? -ne 0 ] ; then
	echo "---------- ---"
	echo "Installing git"
	echo "---------- ---"
	echo
	sudo pacman -S git --noconfirm
fi

make --help >/dev/null 2>/dev/null

if [ $? -ne 0 ] ; then
	echo "---------- ----"
	echo "Installing Make"
	echo "---------- ----"
	echo

	sudo pacman -S make
fi

mkdir -p git/github/Suckless
cd git/github/Suckless

echo "---------- ------ ---"
echo "Installing coffee dwm"
echo "---------- ------ ---"
echo

git clone $github/coffee-dwm
cd coffee-dwm
cp -R .dwm ~
chmod -R 755 ~/.dwm/*.sh
# sudo ln -s ~/.dwm/layoutmenu.sh /usr/bin/layoutmenu.sh # might need sudo
mkdir -p ~/.local/share/fonts
cp fonts/* ~/.local/share/fonts
cd inteface
sudo make clean install # might need sudo
cd ../..

echo "---------- --"
echo "Installing st"
echo "---------- --"
echo

git clone $github/st
cd st
sudo make clean install
cd ..

echo "---------- -----"
echo "Installing dmenu"
echo "---------- -----"
echo

git clone $github/dmenu
cd dmenu
sudo make clean install
cd ..

echo "---------- -----"
echo "Installing slock"
echo "---------- -----"
echo

git clone $github/slock
cd slock
sudo make clean install
cd ..
