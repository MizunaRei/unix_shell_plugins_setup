# Unix_shell_plugins_setup

 bash, zsh, fish shell plugins installer. It requires Zsh 5.7.1, Bash 5.1, fish shell 3.2, Git 2.8, cURL 7.76, or newer. This script includes the following plugins.

    https://github.com/marlonrichert/zsh-snap
    https://github.com/marlonrichert/zsh-autocomplete
    https://github.com/ohmyzsh/ohmyzsh
    https://github.com/romkatv/powerlevel10k
    https://github.com/ohmybash/oh-my-bash
    https://github.com/akinomyoga/ble.sh
    https://github.com/oh-my-fish/oh-my-fish
    https://github.com/jorgebucaran/fisher
    https://github.com/jorgebucaran/autopair.fish
    https://github.com/ajeetdsouza/zoxide
    https://github.com/ogham/exa
    https://github.com/nvbn/thefuck
    https://github.com/ellie/atuin
    https://github.com/junegunn/fzf
    https://github.com/BurntSushi/ripgrep
    https://github.com/sharkdp/bat
    https://gist.github.com/gnanderson/d74079d16714bb8b2822a7a07cc883d4?permalink_comment_id=3950336#gistcomment-3950336

### Installation

```
curl -sSLO https://github.com/MilkyMAISHIRANUI/unix_shell_plugins_setup/raw/main/unix_shell_plugins_setup.sh  &&  zsh unix_shell_plugins_setup.sh
```

### Usage

call `fif` command to search in plain text files and preview them.

`fif text_to_search`

### Key Bindings

| Key(s)                                  | Action                                                                         | <sub>Widget</sub>       |
| --------------------------------------- | ------------------------------------------------------------------------------ | -------------------------------------- |
| <kbd>`Tab`</kbd>                  | Insert top completion                                                          | <sub>`complete-word`</sub>       |
| <kbd>`↓`</kbd>                   | Cursor down (if able) or completion menu                                       | <sub>`down-line-or-select`</sub> |
| <kbd>`↑`</kbd>                   | Cursor up (if able) or history menu                               | <sub>`up-line-or-search`</sub>   |
| <kbd>`Ctrl`</kbd><kbd>`R`</kbd> | history search by fzf                                                          | <sub>` `</sub>                   |
| <kbd>`Ctrl`</kbd><kbd>`T`</kbd> | fuzzy finder by fzf                                                            | <sub>` `</sub>                   |
| <kbd>`Ctrl`</kbd><kbd>`O`</kbd> | launch vscode to open the selected file in search result by fif (if available) | <sub>` `</sub>                   |

### Advantages of these unix shell plugins

Zsh is mainly compatible with bash. One of the compatibility issues we know is that bash supports wild char in commands. For example, "apt install compiz*". Zsh does not.

The autosuggestion feature of fish is "friendly interactive". zsh-autocomplete provides more detailed information than fish does.

Powerlevel10k is faster and more powerful than starship.
