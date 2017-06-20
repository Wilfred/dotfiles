PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Ensure the terminal doesn't wrap around if we type long lines and
# the window was narrow when we started bash.
#
shopt -s checkwinsize

# Pressing up or down searches based on the text input so far.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias ..='cd ..'
alias gst='git status'
# cd to the root of a git directory.
alias gcd='if [ "`git rev-parse --show-cdup`" != "" ]; then cd `git rev-parse --show-cdup`; fi'

# Docker aliases
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'


