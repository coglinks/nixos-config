{ username, ... }:

{
  imports = [
    ./variables.nix
    ./niri.nix
    ./xdg.nix
    ./xserver.nix
    ./hyprland/hyprland.nix
  ];

  home-manager.users.${username} = {
    imports = [
      ./hypridle.nix
      ./hyprlock.nix
    ];
  };
}
