# dotfiles

A collection of configuration files (shells, VCS and so on) that I use
on all my *nix machines.

## Usage

Grab the repo, then run make_links.py.

    $ git clone git://github.com/Wilfred/dotfiles.git
    $ cd dotfiles
    $ ./make_links.py
    /home/wilfred/.gitconfig: linked
    /home/wilfred/.zshrc: linked
    
If you have old configuration you want to wipe, pass `--force` to make_links:

    $ ./make_links.py --force

make_links will copy any file whose name is `.FOO` or `.FOO/BAR`,
except git metadata.
