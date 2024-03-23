{ config, pkgs, ... }:
let
  # stable = import<nixos-23.11> {};
in {
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "aaron-nixos";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  environment.shells = with pkgs; [ fish ];
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  services = {
    desktopManager.plasma6.enable = true;

    xserver = {
      displayManager = {
        defaultSession = "plasma";
      };

      enable = true;
      displayManager.sddm.wayland.enable = true;

      xkb = {
        variant = "";
        layout = "gb";
      };

      resolutions = [{ x = 1366; y=768; }];
      virtualScreen = { x=1366; y=768; };
      # autorun = true;
    };

    printing = {
      enable = true;
    };

    pipewire = {
      enable =true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  hardware = {
    opengl.enable = true;
  };

  users.users = {
    aaron = {
      description = "Aaron Danton";
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      useDefaultShell = true;
      packages = with pkgs; [
      ];
    };

    root = {
      extraGroups = [
        "wheel"
      ];
    };
  };

  # nixpkgs.overlays = [
  #   (self: super: {
      # waybar = super.waybar.overrideAttrs (oldAttrs: {
      #   src = super.fetchFromGitHub {
      #     owner = "Alexays";
      #     repo = "waybar";
      #     rev ="dblplwgffhq7cs86mrkibqkh3pzg9wj2";
      #     hash = "15mhqi7gqkam9xzq4xx1319sjyr5qqxfmbja6rflpx5wq05j9gh6";
      #   };
  #     swww_0_9_1 = super.swww.overrideAttrs ( oldAttrs: {
  #       src = super.fetchFromGitHub {
  #         owner = "LGFae";
  #         repo = "swww";
  #         rev = "dcf0d4e481b13c19f2490d730cb45c03d4e8b77b";
  #         hash = "sha256-HfK9AOTsTO0JnrD6e6g/LtwukOjDhf9ZeC6/TmNZqDc=";
  #       };
  #     });
  #   })
  # ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment = {
    sessionVariables = {
      MOZ_USE_XINPUT2 = "1";
      NIXOS_OZONE_WL = "1";
    };

    systemPackages =
    with pkgs; [
      firefox

      neovim
      git
      tmux
      alacritty
      fish

      unzip

      python3
      cargo
      rustc
      cmake

      kdePackages.plasma-browser-integration
      # kdeplasma-addons

      gparted
      steam
      spotify
      slack

      ## HYPRLAND
      (waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        })
      )
      swww
    ];
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
  };

  programs.ssh.startAgent = true;

  programs.firefox = {
    enable = true;
    preferences = {
      " widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  programs.steam.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # For screen share and others
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
