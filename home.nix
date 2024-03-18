{ config, pkgs, ... }:
{
  imports = [
    ./user/shells/fish.nix
    ./user/programs/alacritty/alacritty.nix
    ./user/programs/nvim/nvim.nix
    ./user/programs/tmux/tmux.nix
    ./user/programs/git.nix
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
