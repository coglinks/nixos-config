{ ... }:

{
  services.taskchampion-sync-server = {
    enable = true;
    openFirewall = true;
  };

  imports = [
    ./taskchampion-crypt.nix
    /*
      services.taskchampion-sync-server = {
        host = "<ip addr>";
        allowClientIds = [
          "<client uuid>"
        ];
      };
    */
  ];
}
