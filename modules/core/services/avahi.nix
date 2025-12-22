{ ... }:

{
  services.avahi = {
    enable = true;
    openFirewall = false;
    nssmdns4 = false;
    publish = {
      enable = false;
      addresses = false;
      workstation = false;
      userServices = false;
      hinfo = false;
    };
  };
}
