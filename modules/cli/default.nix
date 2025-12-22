{ username, ... }:

{
  imports = [
    ./core.btop.nix
    ./core.shell
  ];

  home-manager.users.${username}.imports = [
    ./git
    ./activitywatch.nix
    # ./scripts
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
