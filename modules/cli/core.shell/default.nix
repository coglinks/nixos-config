{ username, ... }:
{
  imports = [
    ./bash.nix
    ./nushell.nix
  ];

  home-manager.users.${username}.imports = [
    ./starship.nix
  ];
}
