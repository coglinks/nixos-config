{ pkgs, ... }:
{
<<<<<<< HEAD
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
||||||| 7b9b95fa
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
=======
  programs = {
    dconf.enable = true;
    zsh.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      # pinentryFlavor = "";
    };

    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [ ];
>>>>>>> refs/remotes/foundation/main
  };
<<<<<<< HEAD
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
    refind
    _7zz-rar
    fd
    ueberzugpp
    bitwarden-cli
  ];
||||||| 7b9b95fa
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
=======
>>>>>>> refs/remotes/foundation/main
}
