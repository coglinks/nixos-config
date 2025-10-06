{ pkgs, config, ... }:

{
  sops = {
    secrets."taskwarrior/lenovo-loq/client_id" = { };
    secrets."taskwarrior/lenovo-loq/encryption_secret" = { };
    secrets."taskwarrior/lenovo-loq/server-url" = { };

    templates."taskwarrior-sync-conf" = {
      content = ''
        sync.server.client_id=${config.sops.placeholder."taskwarrior/lenovo-loq/client_id"}
        sync.encryption_secret=${config.sops.placeholder."taskwarrior/lenovo-loq/encryption_secret"}
        sync.server.url=${config.sops.placeholder."taskwarrior/lenovo-loq/server-url"}
      '';
    };
  };
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    extraConfig = ''
      include ${config.sops.templates."taskwarrior-sync-conf".path}
    '';
  };
  services.taskwarrior-sync = {
    enable = true;
  };

  home.packages = with pkgs; [
    timewarrior
    taskwarrior-tui
  ];
}
