#!/usr/bin/env fish


curl -sOL https://git.io/fisher
source fisher
fisher install jorgebucaran/fisher
rm ./fisher
rm ./fisher_installation.fish
exit
