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

make_links will symlink any file whose name is `dot_FOO` or
`dot_FOO/BAR` to `~/.FOO` or `~/.FOO/BAR` respectively.

## Nix packages

Edit `packages.nix`, then apply:

    $ nix-env -f ./packages.nix -i
