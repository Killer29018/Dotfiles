{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/tmux" = {
    source = ./tmux;
    recursive = true;
  };
}
