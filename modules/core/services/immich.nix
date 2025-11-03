{ inputs, lib, ... }:

{
  services.immich = {
    enable = true;
    openFirewall = true;
    host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
  };
  users.users.immich.extraGroups = [ "shared" ];
}
