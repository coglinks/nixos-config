{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  home.packages = with pkgs; [
    ## Multimedia
    kodi-wayland
    audacity
    gimp
    inkscape
    davinci-resolve
    darktable
    gnome-sound-recorder
    pdf4qt
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
    kicad
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
    zenity

    ## Level editor
    ldtk
    tiled
  ];

  services.flatpak = {
    enable = true;
    packages = [
    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };
}
