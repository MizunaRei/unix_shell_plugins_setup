#!/usr/bin/env zsh


## global variables
	## save user's current working directory
	export last_working_directory="$PWD"


function main() {
	## same as main() function in C language

## go to user home directory for default setup.
cd "$HOME"
		
	
	if [  -e "$(which git)" ]; then
		## greetings
	 printf " \n Welcome. This script could help you with setting up some awesome plugins for bash, zsh, and fish shell. \n  For more information please visit homepage. \n \n https://github.com/MilkyMAISHIRANUI/unix_shell_plugins_setup \n \n "

	else
	printf " \n We could not find git binary file.  \n Please install git by package manager i.e. Homebrew. \n " 
exit 1
	fi
	

	## zsh-plugins setup. start.
	printf " \n Would you like to install zsh plugins ? [y/n] \n They make shell look pretty and help you work easier. \n "
	read answer
 
 if [ "$answer" != "${answer#[Yy]}" ] ;then 
    #echo Yes
    zsh-plugins-setup
else
    #echo No
    printf " \n Skipped zsh plugins installation. \n "
fi
## zsh-plugins setup. End.


	
	
	# oh-my-bash setup . Start.
	printf " \n Would you like to install ohmybash/oh-my-bash ? [y/n]  \n It is a delightful community-driven framework for managing your bash configuration. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    oh-my-bash-setup
else
    #echo No
    printf " \n Skipped ohmybash/oh-my-bash installation. \n "
fi
	## oh-my-bash setup. End.


	## ble.sh setup. start.
	printf " \n Would you like to install akinomyoga/ble.sh ? [y/n]  \n It is a full-featured line editor.  \n Syntax highlighting, auto suggestions, vim modes, etc.  \n are available in Bash interactive sessions. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    ble-sh-setup
else
    #echo No
    printf " \n Skipped akinomyoga/ble.sh installation. \n "
fi
	## ble.sh setup. End.
	 

	## oh-my-fish setup. start.
	printf " \n Would you like to install oh-my-fish/oh-my-fish ? [y/n]  \n It provides core infrastructure to allow you to install packages \n which extend or modify the look of your shell. \n  It's fast, extensible and easy to use. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    oh-my-fish-setup
else
    #echo No
    printf " \n Skipped oh-my-fish/oh-my-fish installation. \n "
fi
	# oh-my-fish setup. End.


## bashhub.com setup. start.
	printf " \n Would you like to install rcaloras/bashhub-client ? [y/n]  \n It is Bash history in the cloud. Indexed and searchable. \n If you prefer open source self-hosted private server, here we go. \n \n https://github.com/nicksherron/bashhub-server \n  \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    bashhub-client-setup
else
    #echo No
    printf " \n Skipped rcaloras/bashhub-client installation. \n "
fi
## bashhub.com setup. End.


		## fzf setup. start.
	printf " \n Would you like to install junegunn/fzf ? [y/n]  \n It's an interactive Unix filter for command-line that can be used with \n any list; files, command history, processes, hostnames, bookmarks, git commits, etc. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    fzf-setup
else
    #echo No
    printf " \n Skipped junegunn/fzf installation. \n "
fi
	# fzf setup. End.
	

	## clean up before exiting this script.
	exiting_cleanup
}


function thefuck-setup(){
	if [  -e "$(which pip3)" ]; then
	printf " \n Setting up nvbn/thefuck . \n "
	pip3 install thefuck
	printf " \n nvbn/thefuck was installed. \n "
	else
	printf " \n We could not find pip3 binary file.  \n Please install pip3 by package manager i.e. Homebrew. \n " 
	fi
}


bashhub-client-setup(){
	if [  -e "$(which python3)" ]; then
	printf " \n Setting up rcaloras/bashhub-client . \n "
	curl -OL https://bashhub.com/setup && zsh setup 
	printf " \n rcaloras/bashhub-client was installed. \n "
	else
	printf " \n We could not find python3 binary file.  \n Please install python3 by package manager i.e. Homebrew. \n " 
	fi
}


fzf-ripgrep-bat-vscode-integration-setup(){
if [  -e "$(which ripgrep)" ]; then
	if [  -e "$(which gawk)" ]; then
		if [  -e "$(which bat)" ]; then
		printf " \n NOTE: Press Control+O to open file in VSCode on previewing screen. \n "
		curl -o  fif.sh  -sL  https://github.com/MilkyMAISHIRANUI/unix_shell_plugins_setup/raw/main/plugins/fif.sh
		printf " \n \n " >> ~/.zshrc
		cat fif.sh >> ~/.zshrc
		printf " \n \n " >> ~/.zshrc
		printf " \n \n " >> ~/.bashrc
		cat fif.sh >> ~/.bashrc
		printf " \n \n " >> ~/.bashrc		
		rm ./fif.sh
		printf " \n fzf-ripgrep-bat-vscode-integration was installed. \n "
		else
		printf " \n We could not find bat ( sharkdp/bat ) binary file.  \n Please install bat by package manager i.e. Homebrew. \n " 
		fi
	else 
	printf " \n We could not find gawk ( GNU awk ) binary file.  \n Please install gawk by package manager i.e. Homebrew. \n "
	fi
else 
printf " \n We could not find ripgrep ( BurntSushi/ripgrep ) binary file.  \n Please install ripgrep by package manager i.e. Homebrew. \n "
fi
}


function fzf-setup(){
	printf "\n Setting up junegunn/fzf . \n "
	## fzf official installer
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

printf " \n Would you like to install fzf-ripgrep-bat-vscode-integration ? [y/n]  \n You could preview colored search result and open that file in Visual Studio Code . \n "
	read answer
 
 if [ "$answer" != "${answer#[Yy]}" ] ;then 
    #echo Yes
    fzf-ripgrep-bat-vscode-integration-setup
else
printf " \n Skipped fzf-ripgrep-bat-vscode-integration installation. \n "

fi

	printf " \n junegunn/fzf was installed. \n "
}


function exiting_cleanup() {
	printf " \n Setup completed. \n  Open a new terminal window to enjoy it.  \n If unix shell went wrong, please follow this guide. \n  \n https://github.com/marlonrichert/zsh-autocomplete#manual-installation   \n \n You may try to rename or delete dotfiles such as ~/.zshrc , ~/.zprofile , ~/.p10k.zsh , and the folder of plugins ( usually at ~/ ) . \n Then execute this script again.  \n \n  If you like this script, please give it a star on its home page. \n \n "
	rm ./unix_shell_plugins_setup.sh
	cd "$last_working_directory"
	exit 0
}


function oh-my-fish-setup(){
printf "\n Setting up oh-my-fish/oh-my-fish . \n "
	## if [ "$(which fish)"=1 ]
	## above if statement failed.
	if [  -e "$(which fish)" ]; then
	
		
				
	## oh-my-fish official installer
		printf " \n Please press Y to install over existing installation. \n "
		curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
		rm ./install
		printf " \n oh-my-fish/oh-my-fish was installed. \n "
	else
	printf " \n We could not find fish shell binary file.  \n Please install fish shell by package manager i.e. Homebrew. \n "
	fi
	
}


function ble-sh-setup() {
	printf " \n Setting up akinomyoga/ble.sh . \n "
	## detect gawk make
	if [  -e "$(which gawk)" ]; then
		if [  -e "$(which make)" ]; then
			printf " \n NOTE: Please visit software project homepage for installation guide.  \n https://github.com/akinomyoga/ble.sh \n "
			## ble.sh official installer
		git clone --recursive --depth=1 https://github.com/akinomyoga/ble.sh.git
	make -C ble.sh install PREFIX=~/.local
	echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
	## ble.sh official installer uses echo command. printf is better.
	## curl -OL https://github.com/MilkyMAISHIRANUI/unix_shell_plugins_setup/raw/main/bash_plugins/ble.sh_bashrc_default
	## printf " \n \n " >> ~/.bashrc
	## cat ble.sh_bashrc_default >> ~/.bashrc
	## printf " \n \n " >> ~/.bashrc
	## rm ./ble.sh_bashrc_default
	printf " \n akinomyoga/ble.sh was installed. \n "
		else
			printf " \n We could not find make ( GNU make ) binary file.  \n Please install make by package manager i.e. Homebrew. \n " 
		fi
	else 
		printf " \n We could not find gawk ( GNU awk ) binary file.  \n Please install gawk by package manager i.e. Homebrew. \n "
	fi	
}


function oh-my-bash-setup(){
printf " \n Setting up ohmybash/oh-my-bash . \n "
## oh-my-bash official installer
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm ./install.sh
printf " \n ohmybash/oh-my-bash was installed. \n "
printf " \n Would you like to enable random theme for oh-my-bash ? \n "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
	if [  -e "$(which sed)" ]; then
	sed -i '' 's/OSH_THEME=\"font\"/OSH_THEME=\"random\"/g'  ~/.bashrc	
	else
	printf " \n We could not find sed (GNU stream editor) binary file.  \n Please install sed by package manager i.e. Homebrew. \n " 
	fi
else
printf " \n The default theme of oh-my-bash is enabled. \n "
fi
}


function powerlevel10k-setup(){
printf " \n Setting up romkatv/powerlevel10k . \n "
	## install powerlevel10k into ohmyzsh. start
## Install powerlevel10k into ohmyzsh so it can be used as a random theme.
znap source romkatv/powerlevel10k
## execute znap source romkatv/powerlevel10k command on zsh startup will make powerlevel10k be the only available theme.
## echo 'znap source romkatv/powerlevel10k' >>~/.zshrc
cd ~/zsh-snap
mv powerlevel10k ohmyzsh/custom/themes/
cd ~/zsh-snap
ln -s ohmyzsh/custom/themes/powerlevel10k/
cd ~
printf " \n \n Use this command to use powerlevel10k theme. \n Or write this command into ~/.zshrc file. \n \n"
printf "        znap prompt ohmyzsh/ohmyzsh powerlevel10k"
printf " \n \n Use this command to use a random theme. \n Or write this command into ~/.zshrc file. \n \n"
printf "        znap prompt ohmyzsh/ohmyzsh random"
printf " \n romkatv/powerlevel10k was installed. \n "
## install powerlevel10k into ohmyzsh. End
}


function ohmyzsh_setup() {
printf " \n Setting up ohmyzsh/ohmyzsh. \n "
	## install ohmyzsh via zsh-snap. start
## Install ohmyzsh outside zsh-snap may cause compatibility issues between ohmyzsh and zsh-snap. 
## Use this command to execute desired plugins of ohmyzsh.
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
printf 'znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}' >> ~/.zshrc
## Path to your oh-my-zsh installation.
printf 'export ZSH="$HOME/zsh-snap/ohmyzsh" ' >> ~/.zshrc
printf " \n ohmyzsh/ohmyzsh was installed. \n "
## install ohmyzsh via zsh-snap. End


# powerlevel10k setup. start.
	printf " \n Would you like to install romkatv/powerlevel10k as ohmyzsh plugin ? [y/n]  \n It is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    #echo Yes
    powerlevel10k-setup
else
    #echo No
    printf " \n Skipped romkatv/powerlevel10k installation. \n "
fi
	# powerlevel10k setup. End.
## install powerlevel10k. end.
}


function zsh-plugins-setup() {
## install marlonrichert/zsh-snap . start
printf " \n Setting up marlonrichert/zsh-snap . \n "
## copy zsh plugins  default settings to ~/.zshrc 
	curl -o zshrc_default  -sL  https://github.com/MilkyMAISHIRANUI/unix_shell_plugins_setup/raw/main/zsh_plugins/zshrc_default
printf " \n \n " >> ~/.zshrc
cat zshrc_default >> ~/.zshrc
printf " \n \n " >> ~/.zshrc
rm ./zshrc_default

## zsh-snap official installer
printf " \n \n Please keep the default installation directory unless you know what you are doing. \n \n"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/zsh-snap/zsh-snap
chmod +x ~/zsh-snap/zsh-snap/znap.zsh
source ~/zsh-snap/zsh-snap/znap.zsh
## use zshrc-default instead of echo >> zshrc . echo does not support text format well.
## echo 'source ~/zsh-snap/zsh-snap/znap.zsh' >> ~/.zshrc
## zshrc-default should not includes zsh-autocomplete.
printf " \n marlonrichert/zsh-snap was installed. \n "
## install marlonrichert/zsh-snap . End


## marlonrichert/zsh-autocomplete setup . start.
printf " \n Would you like to install marlonrichert/zsh-autocomplete ? [y/n]  \n It adds real-time type-ahead autocompletion to Zsh.  \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then 
    #echo Yes
    zsh-autocomplete-setup
else
    #echo No
    printf " \n Skipped marlonrichert/zsh-autocomplete installation. \n "
fi
## marlonrichert/zsh-autocomplete setup . end .


## install oh-my-zsh . start
# ohmyzsh setup. start.
	printf " \n Would you like to install ohmyzsh/ohmyzsh ? [y/n]  \n It is a delightful community-driven framework for managing your zsh configuration.  \n Includes 300+ optional plugins,140+ themes. \n "
	read answer
 # if echo "$answer" | grep -iq "^y" ;then
 if [ "$answer" != "${answer#[Yy]}" ] ;then 
    #echo Yes
    ohmyzsh_setup
else
    #echo No
    printf " \n Skipped ohmyzsh/ohmyzsh installation. \n "
fi
	# ohmyzsh setup. ENd.
}
	
	


function zsh-autocomplete-setup() {
	printf " \n \n \n  # enable zsh-autocomplete by zsh-snap " >> ~/.zshrc
printf " znap source marlonrichert/zsh-autocomplete "  >> ~/.zshrc
printf " \n \n " >> ~/.zshrc
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
	exit 1
}


main
