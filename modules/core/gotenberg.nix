{ pkgs, ... }:

{
  services.gotenberg = {
    enable = true;
    extraFontPackages = with pkgs; [
      corefonts
      vista-fonts
    ];
  };
}
