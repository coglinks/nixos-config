{ username, ... }:

{
  imports = [
    ./core.btop.nix
    ./core.shell
    ./core.openssh.nix
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
    ./taskwarrior.nix
    ./tmux.nix
    ./zoxide.nix
  ];
}
