{ username, ... }:

{
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/files/secrets.yaml;
    defaultSopsFormat = "yaml";
  };

}
