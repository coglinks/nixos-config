{ ... }:
{
  imports = [
    ./sops.nix
    ./activitywatch.nix
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./taskwarrior.nix
    ./fastfetch.nix # fetch tool
    ./flow.nix # terminal text editor
    ./fzf.nix # fuzzy finder
    ./git # version control
    ./nvim.nix
    ./p10k/p10k.nix
    ./packages # other packages
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
    ./tmux.nix
    ./yazi
    # ./viewnior.nix                    # image viewer
    ./xdg-mimes.nix # xdg config
    ./zsh # shell
  ];
}
