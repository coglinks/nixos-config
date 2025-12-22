{ username, ... }:
{
  home-manager.users.${username}.imports = [
    ./waybar.nix
    ./settings.nix
    ./style.nix
  ];
}
