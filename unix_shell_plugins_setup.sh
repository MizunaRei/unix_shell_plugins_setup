#!/usr/bin/env bash


shell_requirements=="make gawk curl git"
unix_shell_contraction=="a"
unix_shell_name="bash fish zsh"


function main(){

## save user's current working directory
last_working_directory=$PWD
## go to user home directory for default setup.
cd ~

	read -p " \n Which Unix shell do you use? \n A. all of three shells \n B. bash \n F. fish \n Z. zsh \n \n Q. cancel setup and quit.  \n " unix_shell_contraction
if
	unix_shell_contraction==[aA]
	then
	 unix_shell_name="bash fish zsh"
fi

if
	unix_shell_contraction==[bB]
	then
	 unix_shell_name="bash"
fi

if
	unix_shell_contraction==[fF]
	then 
	unix_shell_name="fish"
fi

if
	unix_shell_contraction==[zZ]
	then 
	unix_shell_name="zsh"
fi

if
	unix_shell_contraction==[qQ]
	then 
	cd "$last_working_directory"
	echo "Nothing changed. If you like this script, please give it a star. "
	exit
fi

cd "$last_working_directory"
echo "Setup completed. If you like this script, please give it a star. "
}


function bash_setup(){
git clone --recursive --depth=1 https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
curl -OL https://github.com/MoonLightElf/unix_shell_plugins_setup/raw/main/bash_plugins/ble.sh_bashrc_default
cat ble.sh_bashrc_default  >> ~/.bashrc
rm ./ble.sh_bashrc_default
curl -OL https://bashhub.com/setup && bash setup
rm ./setup
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm ./install.sh
}

function fish_setup(){
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

}

function zsh_setup(){
	curl -OL  https://github.com/MoonLightElf/unix_shell_plugins_setup/raw/main/zsh_plugins/zsh_plugins_setup.sh | zsh
	## chmod +x  zsh_plugins_setup.sh
	## /bin/zsh  zsh_plugins_setup.sh
	rm ./zsh_plugins_setup.sh
}


function shells_setup(){
if [[ "$unix_shell_name"== *"bash"* ]]; then
  echo " \n Setting up bash plugins. \n "
  bash_setup
fi

if [[ "$unix_shell_name"== *"fish"* ]]; then
  echo " \n Setting up fish plugins. \n "
  fish_setup
fi

if [[ "$unix_shell_name"== *"zsh"* ]]; then
  echo " \n Setting up zsh plugins. \n "
  zsh_setup
fi
}


function darwin_setup(){
if
	"Darwin"==`uname` || "darwin"==`uname`
then 
	# brew.sh officaial installer script
	 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# curl -OL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
	# chmod +x ./install.sh
	# /bin/bash -c install.sh 
	brew install make gawk curl git "$unix_shell_name"
	rm ./install.sh
	shells_setup
fi
}


function alphin_setup(){
	if 
	[[ "alpine"==`uname` || "Alpine"==`uname`  || `uname`== *"alpine"* || `uname`== *"Alpine"*   ]]
	then
	apk add make gawk curl git "$unix_shell_name"
	shells_setup
	fi
}


function deb_setup(){
	if
	[[ "debian"==`uname` || "ubuntu"==`uname` || "Debian"==`uname` || "Ubuntu"==`uname`  || `uname`== *"Debian"* || `uname`== *"Ubuntu"*  || `uname`== *"debian"*  ||  `uname`== *"ubuntu"*  || `uname`== *"Termux"* || `uname`== *"termux"*  ]]
	then
	apt install make gawk curl git "$unix_shell_name"
	shells_setup
	fi
}


function dnf_setup(){
	if
	[[ "Fedora"==`uname` || "fedora"==`uname` || `uname`== *"Fedora"*  ||  `uname`== *"fedora"*  || `uname`== *[cC][eE][nN][tT]*  || `uname`== *"cent"* ||  `uname`== *"Cent"*  || `uname`== *"RHEL"*  ]]
	then
	dnf install make gawk curl git "$unix_shell_name"
	shells_setup
	fi
}

function zypper_setup(){
	if [[ `uname`== *"suse"*  || `uname`== *"SUSE"* || `uname`== *"SLE"*  || "OpenSUSE"==`uname` || "opensuse"==`uname`  ]]  
	then
	zypper install make gawk curl git "$unix_shell_name"
	shells_setup
	fi
}


function arch_setup(){
	if 
	[[ "Arch"==`uname` || "manjaro"==`uname`  || `uname`== *"arch"* || `uname`== *"manjaro"*   ]]
	then
	pacman -S make gawk curl git "$unix_shell_name"
	shells_setup
	fi
}


main