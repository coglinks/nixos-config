{ pkgs, username, ... }:

{
  virtualisation.docker = {
    enable = false;
    daemon.settings = {
      data-root = "home/${username}/dockerData-root";
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    lazydocker
  ];
}
