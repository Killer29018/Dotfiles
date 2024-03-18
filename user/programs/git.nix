{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Aaron Danton";
    userEmail = "aarondanton04@hotmail.com";
  };
}
