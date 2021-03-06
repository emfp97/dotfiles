
# Brass Bell rdesktop commands
alias helm="rdesktop -g 2880x1680 192.168.16.36"
alias port="rdesktop -g 2880x1680 192.168.16.43"
alias drawer4="rdesktop -g 2880x1680 192.168.16.38"
alias starboard="rdesktop -g 2880x1680 192.168.16.35"
alias lessonsdell="rdesktop -g 2880x1680 192.168.16.29"
alias receiving="rdesktop -g 2880x1680 192.168.16.40"
alias shop="rdesktop -g 2880x1680 192.168.16.39"
alias hyperv01="rdesktop -g 2880x1680 192.168.16.3"
alias hyperv02="rdesktop -g 2880x1680 192.168.16.4"
alias server2012="rdesktop -g 2880x1680 192.168.16.5"
alias retailsupport="rdesktop -g 2880x1680 192.168.16.34"
alias brassbell03="rdesktop -g 2880x1680 192.168.16.31"
alias mainwest="rdesktop -g 2880x1680 192.168.16.33"
alias officenorth="rdesktop -g 2880x1680 192.168.16.50"
alias tristannoffice="rdesktop -g 2880x1680 192.168.16.34"

# Daily Aliases
alias pacman="pacaur"
alias update="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove"
alias brow-tor="torbrowser-launcher"
alias bookmarks="cat ~/bookmarks"
alias msfconsole="cd ~/Documents/workspace && msfconsole"
alias ecommerce="ftp 50.31.117.165"
alias aspdotnet="ftp 67.148.13.72"
alias iptables="sudo iptables"
alias irssi="torsocks irssi"
alias apache-start="sudo systemctl start httpd.service"
alias apache-restart="sudo systemctl restart httpd.service"
alias apache-stop="sudo systemctl stop httpd.service"
alias apache-status="sudo systemctl status httpd.service"
alias gdb="gdb -q"
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias lsblk="lsblk -o name,uuid,label,mountpoint"
alias emacs="emacs -nw"
alias i3edit="$EDITOR ~/.config/i3/config && i3-msg restart"
alias termedit="$EDITOR ~/.Xdefaults && xrdb ~/.Xdefaults"
alias bashedit="$EDITOR ~/.bashrc && . ~/.bashrc"
alias aliasedit="$EDITOR ~/.bash_aliases && . ~/.bashrc"
alias emacsedit="$EDITOR ~/.emacs"
alias devenv="cd ~/Documents/git-proj/ && $EDITOR"
alias rm="rm -v"
alias ln="ln -v"

# SSH Aliases
alias ssh-server="ssh administrator@dogesec.us"
alias ssh-server0="ssh administrator@server0"
alias ssh-server1="ssh administrator@server1"
alias ssh-frontpi="ssh pi@192.168.16.47"
alias ssh-middlepi="ssh pi@192.168.16.42"
alias ssh-backpi="ssh pi@192.168.16.44"
alias ssh-musicpi="ssh pi@192.168.16.48"
alias ssh-ccconrad="ssh ccconrad@37.60.247.78 -p 18765"
export LFS=/mnt/lfs
