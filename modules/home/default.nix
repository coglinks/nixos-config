{ ... }:
{
  imports = [
    ./audacious.nix # music player
    ./sops.nix
    ./activitywatch.nix
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./cava.nix # audio visualizer
    ./discord.nix # discord
    ./fastfetch.nix # fetch tool
    ./firefox.nix
    ./flow.nix # terminal text editor
    ./thunderbird.nix
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./kitty.nix # terminal
    ./lazygit.nix
    ./nemo.nix # file manager
    ./nvim.nix
    ./nix-search/nix-search.nix # TUI to search nixpkgs
    ./p10k/p10k.nix
    ./packages # other packages
    ./retroarch.nix
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
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
