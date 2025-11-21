{ pkgs, ... }:

{
  programs.nushell = {
    enable= true;
    plugins = with pkgs.nushellPlugins; [
  polars
  gstat
  formats
  query
  ];
    extraConfig = ''
      source ~/.config/nushell/config-extra.nu
    '';
  };
}
