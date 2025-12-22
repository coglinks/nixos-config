{ username, ... }:
{
  imports = [
    ./bash.nix
    ./nushell.nix
  ];

  home-manager.users.${username}.imports = [
    ./home.starship.nix
  ];
}
