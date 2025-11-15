{ pkgs, inputs, ... }:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Asia/Qatar";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
