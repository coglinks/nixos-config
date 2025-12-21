{
  inputs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.taskchampion-sync-server {
    services.taskchampion-sync-server = {
      openFirewall = true;
      host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
      allowClientIds = [
        (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/client-info/taskwarrior"))
      ];
    };
  };
}
