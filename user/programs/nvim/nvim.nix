{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars

      lazy-nvim
    ];
  };

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
