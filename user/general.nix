{ config, pkgs, ... }:
{
  imports = [
    ./shells/fish.nix
    ./programs/programs.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    firefox

    hello
    neofetch

    nix-direnv

    discord

    xournalpp
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
