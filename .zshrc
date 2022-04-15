alias ls='ls -GF --color=auto'

# http://stackoverflow.com/a/2534676
autoload -U colors && colors
PS1="%{$fg[yellow]%}%~ "$'\n'"$ %{$reset_color%}%"

# tab completion
autoload -Uz compinit && compinit

# Store execution time taken in history, visible with `history -D`.
setopt inc_append_history_time

# Report the time taken for commands that take more than 10 seconds to terminate.
REPORTTIME=10

# Ensure that Alt-Backspace only deletes up to the last slash,
# not the whole path.
# http://stackoverflow.com/a/1438523/509706
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/67
autoload -U select-word-style
select-word-style bash

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source ~/.zsh-autosuggestions.zsh

source ~/.zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# allow 'foo' instead of 'cd foo'.
setopt auto_cd

## History
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

# allow bash-style # comments
setopt interactivecomments

export PATH=~/bin:$PATH
export PATH=$PATH:~/.cabal/bin:~/.cask/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH="$PATH":~/.gem/ruby/2.6.0/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/wilfred/.evm/bin:$PATH"

# Ensure 'npm install -g' works without sudo, based on
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export EDITOR=zile

export MYSQL_PS1="\u@\h:mysql> "
alias mysql-color="rlwrap --always-readline --prompt-colour=GREEN mysql"

alias docker='sudo docker'

alias sst='svn status'
alias gst='git status'

# quieten gdb's verbose startup
alias gdb="gdb -q"

# quick and dirty compile alias
alias compile='gcc -Wall -Wextra -g'

alias open="xdg-open"

alias serve='python2 -m SimpleHTTPServer'

alias apt-install="sudo apt-get install"
apt-search () { apt-cache search $* | less }


# less colours -- since man uses less as a pager, this gives us
# coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Support ANSI color sequences, truncate lines (don't wrap), and use
# smart case search (rather than case sensitive).
# https://stackoverflow.com/a/26069/509706
export LESS=-RSI

# share history between terminals, from http://askubuntu.com/q/23630
setopt inc_append_history
setopt share_history

if hash zoxide 2>/dev/null; then
    eval "$(zoxide init zsh)"
    alias zz=zi
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.envs
    export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
    source /usr/bin/virtualenvwrapper_lazy.sh
fi

# Don't use cowsay with ansible
export ANSIBLE_NOCOWS=1

# all the interesting windows apps I use are 32-bit
export WINEARCH=win32

# Work around invisible null on dark themes.
# https://github.com/stedolan/jq/issues/1972
export JQ_COLORS='0;37:0;39:0;39:0;39:0;32:1;39:1;39'

export NINJA_STATUS="[done:%f doing:%r left:%u elapsed:%e] "

# Expand 'cd -' to previously visited directories.
# http://unix.stackexchange.com/a/157773/61642
setopt AUTO_PUSHD
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'
