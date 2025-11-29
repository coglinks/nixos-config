{
  options,
  inputs,
  pkgs,
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
    # pinentryFlavor = "";
  };
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib # libglib-2.0.so.0, libgthread-2.0.so.0
    ];
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    borgbackup
    refind
    _7zz-rar
    fd
    ueberzugpp
    bitwarden-cli
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  ];
}
