{ inputs, lib, ... }:

{
  services.taskchampion-sync-server = {
    enable = true;
    openFirewall = true;
    host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
    allowClientIds = [
      (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/client-info/taskwarrior"))
    ];
  };
}
