# __        __
# \ \      /  \        Vinicius Abreu
#  \ \    / /\ \             
#   \ \  / /  \ \      . https://vinic.io/         
#    \ \/ /    \ \     . https://github.com/vsabreu
#     \__/      \_\
#
# My zshrc config file. Nothing special to see here.
# __________________________________________________


### EXPORT
export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### OH MY ZSH ###

# Path to your oh-my-zsh installation.
ZSH_THEME="agnoster"
ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
# Defning the plugins needs to happen before sourcing oh-my-zsh.
plugins=(git 
         history)

# Sourcing oh-my-zsh
# Your plugins will not work without this source.
source $ZSH/oh-my-zsh.sh

### ALIASES ### 

# root privileges
alias doas="doas --"

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim="nvim"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

export XENVIRONMENT="${HOME}/.Xresources"

alias dotfiles='/usr/bin/git --git-dir=/home/vsa/.dotfiles/ --work-tree=/home/vsa'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!! 
export SDKMAN_DIR="/home/vsa/.sdkman"                            
[[ -s "/home/vsa/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vsa/.sdkman/bin/sdkman-init.sh"
