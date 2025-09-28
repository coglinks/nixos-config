{ ... }:

{
  services.taskchampion-sync-server = {
    enable = true;
  };

  imports = [
    ./client-ids.nix
  ];
}
