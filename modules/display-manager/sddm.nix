{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.displayManager.sddm.enable {
    services.displayManager.sddm = {
      package = pkgs.kdePackages.sddm;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
      extraPackages = [ pkgs.sddm-astronaut ];
    };

    environment.systemPackages = with pkgs; [ sddm-astronaut ];
  };
}
