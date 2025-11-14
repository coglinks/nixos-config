{ ... }:
{
  imports = [
<<<<<<< HEAD
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
||||||| 7b9b95fa
    ./aseprite/aseprite.nix           # pixel art editor
    ./audacious.nix                   # music player
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor 
    ./cava.nix                        # audio visualizer
    ./discord.nix                     # discord
    ./fastfetch.nix                   # fetch tool
    ./flow.nix                        # terminal text editor
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./ghostty.nix                     # terminal
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./lazygit.nix
    ./micro.nix                       # nano replacement
    ./nemo.nix                        # file manager
    ./nix-search/nix-search.nix       # TUI to search nixpkgs
    ./nvim.nix                        # neovim editor
    ./obsidian.nix
=======
    ./aseprite/aseprite.nix           # pixel art editor
    ./audacious/audacious.nix         # music player
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor 
    ./cava.nix                        # audio visualizer
    ./discord.nix                     # discord
    ./fastfetch/fastfetch.nix         # fetch tool
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./ghostty/ghostty.nix             # terminal
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./lazygit.nix
    ./micro.nix                       # nano replacement
    ./nemo.nix                        # file manager
    ./nix-search/nix-search.nix       # TUI to search nixpkgs
    ./nvim.nix                        # neovim editor
    ./obsidian.nix
>>>>>>> refs/remotes/foundation/main
    ./p10k/p10k.nix
<<<<<<< HEAD
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
||||||| 7b9b95fa
    ./packages                        # other packages
    ./retroarch.nix  
    ./rofi.nix                        # launcher
    ./scripts/scripts.nix             # personal scripts
    ./ssh.nix                         # ssh config
    ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    # ./viewnior.nix                    # image viewer
    ./vscodium                        # vscode fork
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
=======
    ./packages                        # other packages
    ./retroarch.nix  
    ./rofi/rofi.nix                   # launcher
    ./scripts/scripts.nix             # personal scripts
    ./ssh.nix                         # ssh config
    ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./vicinae.nix                     # launcher
    ./vscodium                        # vscode fork
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
>>>>>>> refs/remotes/foundation/main
  ];
}
