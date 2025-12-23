{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      pciutils
      nushell
    ];
    pathsToLink = [
      "/share/bash-completion"
    ];
  };

  programs.bash = {
    enable = true;
    completion.enable = true;
  };
}
