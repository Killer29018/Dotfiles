{ config, pkgs, ... }:
{
  imports = [
    ./alacritty/alacritty.nix
    ./nvim/nvim.nix
    ./tmux.nix
    ./git.nix
    ./direnv.nix
  ];
}
