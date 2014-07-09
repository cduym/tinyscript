#!/bin/bash

function installZsh(){
	sudo yum -y install zsh git
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh
}

function editProfile(){
	zshpath=`which zsh`
	echo "[ -f $zshpath ] && exec $zshpath -l" >> ~/.bash_profile
}

function addAlias(){
	cp ~/.zshrc ~/.zshrc_bak
	
	echo "alias restart_tomcat=\"sudo /home/q/tools/bin/restart_tomcat.sh \$@\"" >> ~/.zshrc
	echo "alias jps=\"sudo -utomcat /home/q/java/default/bin/jps \$@\"" >> ~/.zshrc
	echo "alias jstack=\"sudo -utomcat /home/q/java/default/bin/jstack \$@\"" >> ~/.zshrc
	echo "alias jstat=\"sudo -utomcat /home/q/java/default/bin/jstat \$@\"" >> ~/.zshrc
	echo "alias jmap=\"sudo -utomcat /home/q/java/default/bin/jmap \$@\"" >> ~/.zshrc
	
	sed -i 's/robbyrussell/juanghurtado/g' ~/.zshrc
        source ~/.zshrc
}

echo "please select your choose"
echo "which do you want to?input the number."
echo "1. install zsh,git,oh-my-zsh"
echo "2. install zsh,git,oh-my-zsh and setup default zsh"
echo "3. install zsh,git,oh-my-zsh,setup default zsh and add alias"
read input

case "$input" in
[1])
	installZsh
;;
[2]) 
	installZsh
	editProfile
;;
[3]) 
	installZsh
	editProfile
	addAlias
;;
*) echo "nothing,exit";;
esac
