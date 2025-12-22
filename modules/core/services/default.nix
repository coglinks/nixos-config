{ ... }:

{
  imports = [
    ./davfs2.nix
    ./avahi.nix
    ./virtualization.nix
    ./docker.nix
    ./gitolite.nix
    ./gotenberg.nix
    ./nextcloud.nix
    ./taskchampion.nix
  ];
}
