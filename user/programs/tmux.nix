{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";

    escapeTime = 0;
    historyLimit = 100000;
    clock24 = true;
    mouse = true;
    baseIndex = 1;
    prefix = "C-Space";
    keyMode = "vi";
    aggressiveResize = true;

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      set-option -sa terminal-override ",xterm*:Tc"

      set-option -g renumber-windows on
      set-option -g automatic-rename on

      bind -n M-H previous-window
      bind -n M-L next-window

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind 'v' split-window -v -c "#{pane_current_path}"
      bind 'h' split-window -h -c "#{pane_current_path}"
    '';
  };

  # home.file."${config.xdg.configHome}/tmux" = {
  #   source = ./tmux;
  #   recursive = true;
  # };
}
