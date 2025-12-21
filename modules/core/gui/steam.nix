{ pkgs, pkgs-unstable, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs-unstable.steam;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;

      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    gamemode.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      playonlinux
      steam-run
    ];
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
