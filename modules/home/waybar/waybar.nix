{ inputs, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    # package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar;
  };
  home.packages = with pkgs; [ networkmanagerapplet ];
}
