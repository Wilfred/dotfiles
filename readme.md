# Dot files

A collection of configuration files (shells, VCS and so on) that I use
on all my *nix machines.

## Usage

You'll want to install zsh and oh-my-zsh first.

Grab the repo, then run make_links.py.

    $ git clone git://github.com/Wilfred/dotfiles.git
    $ cd dotfiles
    $ ./make_links.py
    Linking /home/wilfred/dotfiles/.gitconfig to /home/wilfred/.gitconfig
    Linking /home/wilfred/dotfiles/.zshrc to /home/wilfred/.zshrc
    
If you have old configuration you want to wipe, pass `--force` to make_links:

    $ ./make_links.py --force
