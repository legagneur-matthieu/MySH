#! /bin/sh

# Copyright 2018 LEGAGNEUR Matthieu
# GNU GPL V3 https://www.gnu.org/licenses/gpl.txt

mysh_read=0
mysh_var_exit=0
mysh_var_uptodate=0
mysh_var_env_base=0
mysh_var_env_phpdev=0

mysh_main(){
	clear
	if test "$USER" != "root"
	then
		echo "MySH require sudo / root !"
		mysh_var_exit=1
	fi
	while test $mysh_var_exit -eq 0
	do 
		clear
		mysh_menu 
	done
}

mysh_menu(){
	echo "Welcome in MySH by LEGAGNEUR Matthieu\n"
	echo "1) Update Ubuntu"
	echo "2) Install env base"
	echo "3) Install env gamer"
	echo "4) Install env phpdev"
	echo "5) Install env DWF"
	echo "6) Fix audio"
	echo "7) Install pkg OpenOffice"
	echo "8) Install pkg compiz"
	echo "0) Exit"
	echo -n "Enter a number : "
	read mysh_read
	case $mysh_read in
		1) mysh_update;;
		2) mysh_install_env_base;;
		3) mysh_install_env_gamer;;
		4) mysh_install_env_phpdev;;
		5) mysh_install_env_dwf;;
		6) mysh_fix_audio;;
		7) mysh_pkg_OpenOffice;;
		8) mysh_pkg_compiz;;
		0) mysh_exit;;
	esac
}

mysh_press_enter(){
	if test $mysh_read -eq $1
	then
		echo "\nPress ENTER for back to menu"
		read mysh_useless
	fi
}

mysh_is_uptodate(){
	if test $mysh_var_uptodate -eq 0
	then
		mysh_update
	fi
}

mysh_base_instaled(){
	if test $mysh_var_env_base -eq 0
	then
		mysh_install_env_base
	fi
}

mysh_phpdev_instaled(){
	if test $mysh_var_env_phpdev -eq 0
	then
		mysh_install_env_phpdev
	fi
}

mysh_update(){
	apt-get update
	apt-get -y upgrade
	apt-get -y dist-upgrade
	apt-get -y autoremove
	do-release-upgrade
	mysh_var_uptodate=1
	mysh_press_enter 1
}

mysh_install_env_base(){
	mysh_is_uptodate
	apt-get -y install clamav clamav-daemon clamav-freshclam clamtk default-jre default-jdk firefox-locale-fr thunderbird-locale-fr
	mysh_var_env_base=1
	mysh_press_enter 2
}

mysh_install_env_gamer(){
	mysh_base_instaled
	apt-get -y install playonlinux steam
	mysh_press_enter 3
}

mysh_install_env_phpdev(){
	mysh_base_instaled
	apt-get -y install tasksel netbeans fail2ban git
	tasksel
	apt-get -y install phpmyadmin
	echo -n "git user.name : "
	read git_user_name
	echo -n "git user.email : "
	read git_user_email
	git config --global user.name "$git_user_name"
	git config --global user.email "$git_user_email"
	mysh_var_env_phpdev=1
	mysh_press_enter 4
}

mysh_install_env_dwf(){
	mysh_phpdev_instaled
	cd /var/www
	git init
	git pull https://github.com/legagneur-matthieu/DevWebFramework.git
	rm html/index.html
	mysh_press_enter 5
}

mysh_fix_audio(){
	mysh_is_uptodate
	apt-get -y install alsa alsa-* pulseaudio 
	mysh_press_enter 6
}

mysh_pkg_OpenOffice(){
	mkdir AOO/
	cd AOO/
	wget https://netix.dl.sourceforge.net/project/openofficeorg.mirror/4.1.5/binaries/fr/Apache_OpenOffice_4.1.5_Linux_x86-64_install-deb_fr.tar.gz -O AOO.tar.gz
	tar xvf AOO.tar.gz
	dpkg -i fr/DEBS/*.deb
	dpkg -i fr/DEBS/desktop-integration/*.deb
	cd ../
	rm -fr AOO/
	mysh_press_enter 7
}

mysh_pkg_compiz(){
	mysh_base_instaled
	apt-get -y install compiz compizconfig-settings-manager compiz-plugins compiz-plugins-extra compiz-plugins-main
	mysh_press_enter 8
}

mysh_exit(){
	clear
	echo "MySH : Good Bye !"
	mysh_var_exit=1
}

mysh_main