{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        # "~/.config/alacritty/catppuccin-latte.toml"
        # "~/.config/alacritty/catppuccin-frappe.toml"
        "~/.config/alacritty/catppuccin-macchiato.toml"
        # "~/.config/alacritty/catppuccin-mocha.toml"
      ];

      live_config_reload = true;

      window = {
        opacity = 0.95;
        blur = false;
        dynamic_title = true;
        dynamic_padding = false;
      };

      font = {
        normal = {
          family = "CaskaydiaCoveNerdFont";
          style = "Regular";
        };
        size = 11;
      };

      colors = {
        cursor = {
          text = "#1b1e28";
          cursor = "#ffffff";
        };
      };

      terminal = {
        osc52 = "CopyPaste";
      };

      env = {
        TERM = "xterm-256color";
      };
    };
  };

  home.file."${config.xdg.configHome}/alacritty" = {
    source = ./alacritty;
    recursive = true;
  };
}
