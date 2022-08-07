#!/usr/bin/env zsh


## global variables
export unix_shell_requirements=' make gawk curl git  ruby puthon3 '
## export unix_shell_contraction="a"
export unix_shell_name=" fish zsh bash "
export unix_distribution_name=`uname`


function main() {
	## same as main() function in C language


	## save user's current working directory
	export last_working_directory="$PWD"
	## go to user home directory for default setup.
	cd "$HOME"


	## choose unix shells to setup
	echo " \n Hello.  \n Which Unix shell do you use? \n Press the first letter on keyboard.  \n A. all of three shells \n B. bash \n F. fish \n Z. zsh \n \n Q. cancel setup and quit. \n "
	## echo -e
	## bash grammar  ## read -n 1 r unix_shell_contraction
	while true; do 
	read -k1 REPLY
	 ## echo "$REPLY"
	## if [["$unix_shell_contraction"=~^[Aa]$]]
	if [[ "$REPLY"=~^[Aa]$ ]]
	then
	unix_shell_name="bash fish zsh"
	break
	elif [[ "$REPLY"=~^[Bb]$ ]]
	then
	unix_shell_name="bash"
	break
	

	## if [[ "$REPLY"=~^[Ff]$ ]]
	elif [[ "$REPLY"==f || "$REPLY"==F ]] 
	then
	unix_shell_name="fish"
	break
	elif [[ "$REPLY"=~^[Zz]$ ]]
	then
	unix_shell_name="zsh"
	break
	

	## if [[ "$REPLY"=~^[Qq]$ ]]
	elif  [[ "$REPLY"==q || "$REPLY"==Q ]]  
	then
	echo "will call exit_canceled_cleanup() "
	exit_canceled_cleanup
	## cd "$last_working_directory"
	## echo "Nothing changed. If you like this script, please give it a star. "
	## exit
	else
	echo " \n Press the first letter on keyboard. \n "
	continue
	fi
done
	distribution_detecting_shells_setup

	## exiting
	## cd "$last_working_directory"
	## echo "Setup completed. If you like this script, please give it a star. "
	exit_succeeded_cleanup
}


function bash_setup() {
	git clone --recursive --depth=1 https://github.com/akinomyoga/ble.sh.git
	make -C ble.sh install PREFIX=~/.local
	curl -OL https://github.com/MoonLightElf/unix_shell_plugins_setup/raw/main/bash_plugins/ble.sh_bashrc_default
	cat ble.sh_bashrc_default >> ~/.bashrc
	rm ./ble.sh_bashrc_default
	curl -OL https://bashhub.com/setup && bash setup
	rm ./setup
	## oh my bash official installer
	
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
	rm ./install.sh
}

function fish_setup() {
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	rm ./install

}

function zsh_setup() {
	curl -OL https://github.com/MoonLightElf/unix_shell_plugins_setup/raw/main/zsh_plugins/zsh_plugins_setup.sh
	 zsh zsh_plugins_setup.sh 
	## chmod +x  zsh_plugins_setup.sh
	## /bin/zsh  zsh_plugins_setup.sh
	rm ./zsh_plugins_setup.sh
}


function shells_setup() {
	if [[ "$unix_shell_name"=~*"bash"* ]]
	then
	echo " \n Setting up bash plugins. \n "
	bash_setup
	fi

	if [[ "$unix_shell_name"=~*"fish"* ]]
	then
	echo " \n Setting up fish plugins. \n "
	fish_setup
	fi

	if [[ "$unix_shell_name"=~*"zsh"* ]]
	then
	echo " \n Setting up zsh plugins. \n "
	zsh_setup
	fi
}


function distribution_detecting_shells_setup() {
	if [[ "Darwin"=="$unix_distribution_name"  || "darwin"=="$unix_distribution_name"  ]] 
	then
	# brew.sh officaial installer script
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# curl -OL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
	# chmod +x ./install.sh
	# /bin/bash -c install.sh
	brew install make gawk curl git "$unix_shell_name"
	rm ./install.sh
	shells_setup
	elif [[ "alpine"=="$unix_distribution_name"  || "Alpine"=="$unix_distribution_name"  || "$unix_distribution_name"=~*"alpine"* || "$unix_distribution_name"=~*"Alpine"* ]]
	then
	apk add make gawk curl git "$unix_shell_name"
	shells_setup
	elif [[ "debian"=="$unix_distribution_name"  || "ubuntu"=="$unix_distribution_name"  || "Debian"=="$unix_distribution_name"  || "Ubuntu"=="$unix_distribution_name"  || "$unix_distribution_name"=~*"Debian"* || "$unix_distribution_name"=~*"Ubuntu"* || "$unix_distribution_name"=~*"debian"* || "$unix_distribution_name"=~*"ubuntu"* || "$unix_distribution_name"=~*"Termux"* || "$unix_distribution_name"=~*"termux"* ]]
	then
	apt install make gawk curl git "$unix_shell_name"
	shells_setup
	elif [[ "Fedora"=="$unix_distribution_name"  || "fedora"=="$unix_distribution_name"  || "$unix_distribution_name"=~*"Fedora"* || "$unix_distribution_name"=~*"fedora"* || "$unix_distribution_name"=~*[cC][eE][nN][tT]* || "$unix_distribution_name"=~*"cent"* || "$unix_distribution_name"=~*"Cent"* || "$unix_distribution_name"=~*"RHEL"* ]]
	then
	dnf install make gawk curl git "$unix_shell_name"
	shells_setup
	elif [[ *"suse"*=="$unix_distribution_name"  || "$unix_distribution_name"=~*"SUSE"* || "$unix_distribution_name"=~*"SLE"* || "OpenSUSE"=="$unix_distribution_name"  || "opensuse"=="$unix_distribution_name"  ]]
	then
	zypper install make gawk curl git "$unix_shell_name"
	shells_setup
	elif [[ "Arch"=="$unix_distribution_name"  || "manjaro"=="$unix_distribution_name"  || "$unix_distribution_name"=~*"arch"* || "$unix_distribution_name"=~*"manjaro"* || "$unix_distribution_name"=~*"arco"* || "$unix_distribution_name"=~*"artix"* ]]
	then
	pacman -S make gawk curl git "$unix_shell_name"
	shells_setup
	else
		echo " \n We could not determine what distribution you are running. Continue installation anyway? \n  "
	## echo -e
	read -k1 REPLY
	echo 
	if [[ "$REPLY"=~^[Yy]$ ]];
	then
	shells_setup
	else
		## cd "$last_working_directory"
	## echo "Nothing changed. If you like this script, please give it a star. "
	exit_canceled_cleanup
	fi
	fi
}


function exit_succeeded_cleanup() {
	echo "Setup completed. \n If you like this script, please give it a star. \n "
	rm ./unix_shell_plugins_setup.sh
	cd "$last_working_directory"
	exit 0
}


function exit_canceled_cleanup() {
	echo " \n Setup canceled. Your system was not modified.  \n If you like this script, please give it a star. \n "
	rm ./unix_shell_plugins_setup.sh
	cd "$last_working_directory"
	exit
}


main