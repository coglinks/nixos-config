{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    # hostName = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
    hostName = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
    config = {
      adminpassFile = "${inputs.secrets}/passwords/nextcloud/user";
      # dbname = "nextcloud";
      # dbuser = "nc_user";
      # dbhost = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
      # dbpassFile = "${inputs.secrets}/passwords/nextcloud/db";
      dbtype = "sqlite";
    };
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        news
        contacts
        calendar
        memories
        tasks
        ;
    };
    extraAppsEnable = true;
  };

  systemd.tmpfiles.rules = [
    "f /var/lib/nextcloud/config/CAN_INSTALL 0644 nextcloud nextcloud"
  ];

  environment.systemPackages = with pkgs; [
    nextcloud-client
  ];
}
