{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
<<<<<<< HEAD
    enable = true;
    packages = [
    ];
||||||| 7b9b95fa
    enable = false;
    packages = [
      "com.github.tchx84.Flatseal"
      "io.github.everestapi.Olympus"
    ];
=======
    enable = false;
    packages = [ "com.github.tchx84.Flatseal" ];
>>>>>>> refs/remotes/foundation/main
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };
}
