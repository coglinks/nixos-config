{ pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.yazi = {
    enable = true;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
    refind
    _7zz-rar
    fd
    ueberzugpp
  ];
}
