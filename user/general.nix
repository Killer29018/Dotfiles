{ config, pkgs, ... }:
{
  imports = [
    ./shells/fish.nix
    ./programs/alacritty/alacritty.nix
    ./programs/nvim/nvim.nix
    ./programs/tmux/tmux.nix
    ./programs/git.nix
  ];

  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    hello
    clang
    neofetch
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
