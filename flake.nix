{
  description = "flake";

  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        devShells.x86_64-linux.default = ( import ./shell.nix { inherit pkgs; });

        desktop_vm = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ./configurations/desktop_vm_config.nix ./hardware_config/desktop_vm.nix ];
        };
        laptop = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ./configurations/laptop_config.nix ./hardware_config/laptop.nix ];
        };
      };
      homeConfigurations = {
        desktop_vm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nix-colors; };
          modules = [ ./user/general.nix ./user/desktop_vm.nix ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nix-colors; };
          modules = [ ./user/general.nix ./user/laptop.nix ];
        };
      };
    };
  }
