#!/bin/bash
#ino install script

sudo apt-get update
sudo apt-get install arduino-core gcc-avr avr-libc avrdude
#dependencies, raspberry pi specific?


sudo apt-get install python-configobj python-jinja2 python-pip
sudo pip install glob2
git clone git://github.com/amperka/ino.git ~/ino
#where does the octopi setup script put the git files it gets?

#

pushd ~/ino

sudo make install
#how to make this execuit in a particular directory without cd'ing to it? answer: pushd, popd

popd


git clone https://github.com/Hedrontech/Marlin.git ~/Marlin
#where does the octopi setup script put the git files it gets?

#this was for Melzi
#sudo ln -Ts /home/pi/Marlin/sanguino /usr/share/arduino/hardware/sanguino
#symbolic link from arduino 'support folder' (?) to git repo

#git clone repo

#move into source file, ino looks for src

#mkdir src
#mv !(src) src


pushd ~/Marlin

#builds
ino build -m mega2570

#upoads
ino upload -m mega2570 -p /dev/ttyUSB0

popd