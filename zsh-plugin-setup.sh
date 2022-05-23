#/bin/zsh


local last_working_directory=$PWD
## go to user home directory for default setup.
cd ~


## install marlonrichert/zsh-snap . start
echo "Please keep the default installation directory unless you know what you are doing. "
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
source zsh-snap/install.zsh
## install marlonrichert/zsh-snap . EOF


## install ohmyzsh via zsh-snap. start
##  install ohmyzsh outside zsh-snap may cause compatibility issues between ohmyzsh and zsh-snap. 
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
znap prompt ohmyzsh/ohmyzsh ramdon
## echo 'znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}' >>~/.zshrc
## Path to your oh-my-zsh installation.
echo 'export ZSH="$HOME/zsh-snap/ohmyzsh" ' >>~/.zshrc
## install ohmyzsh via zsh-snap. EOF


## install powerlever10k via zsh-snap. start
## Install powerlever10k via zsh-snap so this theme can be used as ramdon theme.
znap source romkatv/powerlevel10k
echo "Use this command to use powerlever10k theme. \n Or write this command into .zshrc file."
echo "        znap prompt ohmyzsh/ohmyzsh powerlever10k"
echo "Use this command to use ramdon theme. \n Or write this command into .zshrc file."
echo "        znap prompt ohmyzsh/ohmyzsh ramdon"
## install powerlever10k . EOF


## install marlonrichert/zsh-autocomplete for fish like autosuggestion
znap source marlonrichert/zsh-autocomplete


echo "Setup completed. If zsh went wrong, please rename or delete .zshrc file and the folder of plugins (default path is ~/zsh-snap ), and then execute this script again."