PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Ensure the terminal doesn't wrap around if we type long lines and
# the window was narrow when we started bash.
#
shopt -s checkwinsize
