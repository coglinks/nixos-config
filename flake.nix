{
  description = "coglinks' nixos configuration";

  inputs = {
    secrets = {
      url = "path:/st/remotes/secrets";
      flake = false;
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    custom-nixpkgs = {
      url = "github:coglinks/nixpkgs/inc";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
    };

    };

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs = {
        hyprland = {
          follows = "hyprland";
        };
      };
    };

    waybar.url = "github:Alexays/Waybar";

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    adw-bluetooth = {
      url = "github:ezratweaver/adwaita-bluetooth";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi.url = "github:sxyazi/yazi/nightly";
  };

  outputs =
    {
      nixpkgs,
      custom-nixpkgs,
      self,
      nix-on-droid,
      yazi,
      ...
    }@inputs:
    let
      username = "incogshift";
      system = "x86_64-linux";
      pkgs-custom = import custom-nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.sops-nix.nixosModules.sops
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.default
            ./hosts/laptop
            ./overlays
          ];
          specialArgs = {
            host = "laptop";
            inherit
              self
              inputs
              pkgs-custom
              username
              system
              yazi
              ;
          };
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.sops-nix.nixosModules.sops
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.default
            ./hosts/vm
            ./overlays
          ];
          specialArgs = {
            host = "vm";
            inherit
              self
              inputs
              pkgs-custom
              username
              system
              ;
          };
        };
      };
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };

        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/nix-on-droid
        ];

        specialArgs = {
          host = "vm";
          inherit
            self
            inputs
            pkgs-custom
            username
            system
            ;
        };

        extraSpecialArgs = {
          username = "nix-on-droid";
        };
      };

    };
}
