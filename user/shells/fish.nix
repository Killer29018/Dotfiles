{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      ll = "ls -al";
      gs = "git status";
      gl = "git log --oneline";
      ga = "git add";
      gc = "git commit";
    };
  };
}
