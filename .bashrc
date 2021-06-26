# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
export XILINXD_LICENSE_FILE=2100@freyja.us.es
alias yit='cd && cp emacs-and-org-init.org git/dotfiles/emacs-and-org-init.org && cd ~/git/dotfiles/ && git add emacs-and-org-init.org && git commit'
alias c='xclip -selection clipboard'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias al='alsamixer'
alias gkh='~/.local/share/Steam/steamapps/common/Golden\ Krone\ Hotel/gkh'
alias apagar='sudo shutdown now'
#alias matlab='bash /home/MATLAB/R2017a/bin/matlab'
alias actualizar='sudo apt update && sudo apt upgrade'
#alias matlab='bash /home/MATLAB/R2017a/bin/matlab'
alias disgaea='cd .wine/drive_c/Program\ Files/Disgaea\ 2\ PC/ && wine disgaea2.exe'
#alias matlabm='matlab& && disown'
alias starbound='bash /media/Starbound.Beta.Build.27.04.2015/linux64/starbound'
alias Música='cd /home/carlos/Música/ && ./script.sh'
alias ventilador='watch -tn1 "lscpu | grep MHz; printf '\n\n'; sensors"'
alias monitor='xrandr --output HDMI-1 --auto --above LVDS-1'
alias desconectar='xrandr --output VGA1 --auto --right-of LVDS1 --off'
alias peli='killall xscreensaver'
alias normal='xscreensaver&'
alias untar='tar -zxvf '
alias miip='curl ipinfo.io/ip'
alias etsi='cd ~/Documentos/ETSI2020'
alias infor='etsi && cd Informática'
alias em='emacsclient -nw'
#alias Monster='mpv /media/Vídeos/Monster'
alias unnethack='telnet guis.es'
alias radio3='mpv https://hlsliveamdgl0-lh.akamaihd.net/i/rnerne3_1@793568/master.m3u8'
alias enterthegungeon='wine Juegos/wine/Enter.the.Gungeon.v2.1.9/EtG.exe'
alias sr='~/buscar.sh'
synclient TapButton1=1 #Pongo el toque del touchpad como cli
export PATH="$HOME/bin:$PATH" #Añado ~/bin para poder ejecutar mis programas facilmente
alias e='emacsclient -t'
alias E="SUDO_EDITOR=\"emacsclient -t\" sudo -e"
alias qnx='qemu-system-x86_64 /home/carlos/Documentos/ETSI2020/Informática/qnx.6.3.2/qnx6.3.2.vmdk'
alias dunnet='emacs -batch -l dunnet'
alias ise='/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/ise'
alias bk='~/Descargas/blockkeeper-x86_64.AppImage '

#alias zed 'ssh root@192.168.0.200' no va no se por qué
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#Desactivar ^S
stty -ixon
