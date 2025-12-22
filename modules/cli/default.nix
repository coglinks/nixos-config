{ username, ... }:

{
  imports = [
    ./core.btop.nix
    ./core.activitywatch.nix
  ];

  home-manager.users.${username}.imports = [
    ./git
    ./scripts
    ./shells
    ./superfile
    ./yazi
    ./bat.nix
    ./dev.nix
    ./fastfetch.nix
    ./fzf.nix
    ./hledger.nix
    ./misc.nix
    ./nh.nix
    ./nvim.nix
    ./openssh.nix
    ./taskwarrior.nix
    ./tmux.nix
    ./zoxide.nix
  ];
}
