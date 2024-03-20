{ config, pkgs, ... }:
{
  imports = [
    ./shells/fish.nix
    ./programs/programs.nix
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
