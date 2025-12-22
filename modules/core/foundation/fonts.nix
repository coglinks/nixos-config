{ pkgs, ... }:

{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
  };
  environment.systemPackages = with pkgs; [
    corefonts
    vista-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-color-emoji
    fantasque-sans-mono
    maple-mono.truetype-autohint
  ];

}
