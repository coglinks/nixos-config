{ pkgs, ... }:

{
  services.logind.settings.Login.HandleLidSwitch = "ignore";
  services.displayManager = {
    sddm = {
      enable = false;
      package = pkgs.kdePackages.sddm;
      theme = "${import ./sddm.nix { inherit pkgs; }}";
      extraPackages = [ pkgs.sddm-astronaut ];
    };
  };

  environment.systemPackages = with pkgs; [ sddm-astronaut ];
  # backup DE
  services.desktopManager.gnome.enable = true;

}
