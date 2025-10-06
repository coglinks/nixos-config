{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    gimp
    inkscape
    gthumb
    feh
    blender
    obs-studio
    pavucontrol
    soundwireserver
    video-trimmer
    vlc
    xournalpp

    ## Office
    rstudio
    libreoffice
    gnome-calculator
    logisim-evolution
    ciscoPacketTracer8 # Go to https://www.netacad.com/resources/lab-downloads?courseLang=en-US to download CiscoPacketTracer822_amd64_signed.deb (If the file name is different, change it to as required by nix). Reason is cuz of:
    /*
      Unfortunately, we cannot download file CiscoPacketTracer822_amd64_signed.deb automatically.
      > Please go to https://www.netacad.com to download it yourself, and add it to the Nix store
      > using either
      >   nix-store --add-fixed sha256 CiscoPacketTracer822_amd64_signed.deb
      > or
      >   nix-prefetch-url --type sha256 file:///path/to/CiscoPacketTracer822_amd64_signed.de
    */

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity

    ## Level editor
    ldtk
    tiled
  ];
}
