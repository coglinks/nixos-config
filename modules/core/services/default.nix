{ ... }:

{
  imports = [
    ./davfs2.nix
    ./avahi.nix
    ./nginx.nix
    ./virtualization.nix
    ./docker.nix
    ./gitolite.nix
    ./gotenberg.nix
    ./nextcloud.nix
    ./taskchampion.nix
  ];
}
