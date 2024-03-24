{ config, pkgs, nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModules.default
    ./shells/fish.nix
    ./programs/programs.nix
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
  ];

  colorscheme = nix-colors.colorSchemes.catppuccin-macchiato;

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

    texlive.combined.scheme-tetex

    nix-direnv

    discord

    wl-clipboard

    xournalpp
    swww
    wofi
    brightnessctl
    pavucontrol

    waybar
    libwebp
    openssl
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
