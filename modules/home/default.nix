{ ... }:
{
  imports = [
    ./audacious.nix # music player
    ./hledger.nix
    ./sops.nix
    ./activitywatch.nix
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./taskwarrior.nix
    ./cava.nix # audio visualizer
    ./discord.nix # discord
    ./fastfetch.nix # fetch tool
    ./firefox.nix
    ./flow.nix # terminal text editor
    ./thunderbird.nix
    ./fzf.nix # fuzzy finder
    ./git # version control
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./kitty.nix # terminal
    ./nemo.nix # file manager
    ./nvim.nix
    ./p10k/p10k.nix
    ./packages # other packages
    ./retroarch.nix
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./superfile/superfile.nix # terminal file manager
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./tmux.nix
    ./yazi
    # ./viewnior.nix                    # image viewer
    ./waybar # status bar
    ./waypaper.nix # GUI wallpaper picker
    ./xdg-mimes.nix # xdg config
    ./zathura.nix
    ./zsh # shell
  ];
}
