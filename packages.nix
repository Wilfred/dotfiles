# Installs the following programs with nix, so I can grab all the
# tools I regularly use in a single invocation. Handy when starting a
# new machine.
#
# This deliberately has zero actions on shell startup to ensure
# terminals start promptly. You need to explicitly run the following
# to update the nix binaries:
#
# $ nix-env -f ./packages.nix -i --remove-all
let
  # Pinned from nixpkgs-unstable; update the revision and hash together.
  revision = "5adc50831c259f87faeb09ddf930d43597197473";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${revision}.tar.gz";
    sha256 = "0n88mfr09bfb9bcgq4yysyvw9vzy8kkh2iyxa1dgldd33qn0mzs3";
  };
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
pkgs.buildEnv {
  name = "dotfiles-packages";
  paths = [
    pkgs.actionlint
    pkgs.bat
    pkgs.duf
    pkgs.fd
    pkgs.fzf
    pkgs.htop
    pkgs.jless
    pkgs.jq
    pkgs.nano
    pkgs.ncdu
    pkgs.nodejs_24
    pkgs.ripgrep
    pkgs.rustup
    pkgs.shellcheck
    pkgs.tldr
    pkgs.tokei
    pkgs.typos
    pkgs.zellij
    pkgs.zile
    pkgs.zoxide
  ];
}
