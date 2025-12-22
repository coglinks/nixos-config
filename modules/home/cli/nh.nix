{ pkgs, username, ... }:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5 --max-jobs 3 --cores 4";
    };
    flake = "/home/${username}/nixos-config";
  };

  home.packages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
