#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

neofetch --ascii ~/.config/neofetch/ahegao_ascii
#neofetch --crop_mode fit --w3m ~/Wallpapers/wallpaper4.jpg
