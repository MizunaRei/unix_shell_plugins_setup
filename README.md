# zsh-plugin-setup
 Z shell plugins installer. It requires Zsh 5.7.1, Bash 5.1, fish shell 3.2, Git 2.8, cURL 7.76, or newer. This script includes the following plugins.

    https://github.com/marlonrichert/zsh-snap
    https://github.com/marlonrichert/zsh-autocomplete
    https://github.com/ohmyzsh/ohmyzsh
    https://github.com/romkatv/powerlevel10k
    https://github.com/ohmybash/oh-my-bash
    https://github.com/akinomyoga/ble.sh
    https://github.com/oh-my-fish/oh-my-fish
    https://github.com/rcaloras/bashhub-client


### Installation
`curl https://github.com/MoonLightElf/zsh-plugin-setup/raw/main/zsh-plugin-setup.sh | zsh`

### Why do we use these zsh plugins?
Zsh is mainly compatible with bash. One of the compatibility issues we know is that bash supports wild char in commands. For example, "apt install compiz*". Zsh does not. 

The autosuggestion feature of fish is "friendly interactive". Marlonrichert and contributors implement the autocomplete feature for zsh, and it provides more detailed information than fish does. Fizsh is not so sophisticated. Cantino/mcfly only searches in history.

Powerlevel10k provides more features than starship does.
