# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

alias open="xdg-open"
alias ack-less="ack --page=\"less -R\""
alias apt-install="sudo apt-get install"
apt-search () { apt-cache search $* | less }

CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

PATH=$PATH:~/bin:~/.gem/ruby/2.0.0/bin:~/.cabal/bin:~/.cask/bin
PATH=$PATH:/usr/local/heroku/bin

export EDITOR=zile

export MYSQL_PS1="\u@\h:mysql> "
alias mysql-color="rlwrap --always-readline --prompt-colour=GREEN mysql"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
export ZSH_CUSTOM=$HOME/dotfiles/zsh-plugins
plugins=(git history-substring-search python autojump fabric)

# theme in ~/.oh-my-zsh/themes/
ZSH_THEME="tjkirch"

source $ZSH/oh-my-zsh.sh

# don't display 'fail <exit-code>' since it interacts badly with
# virtualenv's appending of the environment name
# (modified from tjkirch theme)
export PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)
%_$(prompt_char) '


# disable autocorrect
unsetopt correct
unsetopt correctall

# less colours -- since man uses less as a pager, this gives us
# coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# share history between terminals, from http://askubuntu.com/q/23630
setopt inc_append_history
setopt share_history
