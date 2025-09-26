{ ... }:

{
  services.nextcloud = {
    enable = false;
    hostName = "nextcloud.local";
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
    };
  };
}
