{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      brgenml1lpr
      brgenml1cupswrapper
    ];
  };
}
