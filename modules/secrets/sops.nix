{
  pkgs,
  inputs,
  config,
  username,
  ...
}:

{
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ./files/secrets.yaml;
    defaultSopsFormat = "yaml";
  };

  # systemd.services."${username}" = {
  #   script = ''
  #     echo "
  #     Hey bro! I'm a service, and imma send this secure password:
  #     $(cat ${config.sops.secrets."myservice/my_subdir/my_secret".path})
  #     located in:
  #     ${config.sops.secrets."myservice/my_subdir/my_secret".path}
  #     to database and hack the mainframe
  #     " > /var/lib/incogshift/testfile
  #   '';
  #   serviceConfig = {
  #     User = "${username}";
  #     WorkingDirectory = "/var/lib/${username}";
  #   };
  # };
}
