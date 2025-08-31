# Start a session with these binaries on path with:
#
# $ nix-shell --run zsh

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    # Fuzzy finding, essential for ctrl-r convenience.
    fzf
    # Minimal editor
    nano
    # Like nano but with Emacs keybindings.
    zile
    # Manipulate JSON.
    jq
    # Navigate large JSON files.
    jless
    # Count lines of code.
    tokei
    # Readable overview of mounts, including usage and filesytem (a
    # nicer `df -h`).
    duf
    # Remembers previously visted directories and lets you switch
    # between them.
    zoxide
    # Fast text search.
    ripgrep
  ];
}
