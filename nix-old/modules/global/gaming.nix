{ nix-flatpak, pkgs, pkgs-stable, ... }:

{
  programs.gamemode = {
    enable = true;
  };
  programs.steam = {
    enable = true;
    package = pkgs-stable.steam;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs-stable; [
    mangohud
    protonup
    lumafly
    lutris
    heroic
    bottles
    # support both 32-bit and 64-bit applications
    wineWowPackages.stable
    winetricks
  ];

  services.flatpak.packages = [
    "com.github.Matoking.protontricks"
    "io.itch.itch"
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
