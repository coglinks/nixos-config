{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      polars
      gstat
      desktop_notifications
      formats
      query
    ];
    extraConfig = ''
      source ~/.config/nushell/config-extra.nu
    '';
  };
}
