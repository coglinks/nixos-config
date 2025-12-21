{
  options,
  inputs,
  pkgs,
  pkgs-32,
  ...
}:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.vim = {
    enable = true;
  };
  programs.yazi = {
    enable = true;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs-32.glibc
      pkgs.glib # libglib-2.0.so.0, libgthread-2.0.so.0
    ];
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    pinentry-gnome3
    borgbackup
    refind
    _7zz-rar
    fd
    ueberzugpp
    nushell
    bitwarden-cli
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  ];
}
