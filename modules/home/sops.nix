{ username, config, ... }:

{
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/files/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets."taskwarrior/lenovo-loq/client_id" = { };
    secrets."taskwarrior/lenovo-loq/encryption_secret" = { };

    templates."taskwarrior-sync-conf" = {
      content = ''
        sync.server.client_id=${config.sops.placeholder."taskwarrior/lenovo-loq/client_id"}
        sync.encryption_secret=${config.sops.placeholder."taskwarrior/lenovo-loq/encryption_secret"}
        sync.server.url=http://127.0.0.1:10222
      '';
    };
  };

}
