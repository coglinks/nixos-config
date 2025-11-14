{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## misc
    conda
    chezmoi

    ## Better core utils
    duf # disk information
    eza # ls replacement
    fd # find replacement
    gping # ping with a graph
    gtrash # rm replacement, put deleted files in system trash
    hexyl # hex viewer
    man-pages # extra man pages
    ncdu # disk space
    ripgrep # grep replacement
    tldr

    ## Tools / useful cli
    aoc-cli # Advent of Code command-line tool
    asciinema
    asciinema-agg
    binsider
<<<<<<< HEAD
    devenv
    bitwise # cli tool for bit / hex manipulation
    broot # tree files view
    caligula # User-friendly, lightweight TUI for disk imaging
    hyperfine # benchmarking tool
    libqalculate
    pastel # cli to manipulate colors
    gita # Git multi repo helper
    swappy # snapshot editing tool
    tdf # cli pdf viewer
    tokei # project line counter
    translate-shell # cli translator
||||||| 7b9b95fa
    bitwise                           # cli tool for bit / hex manipulation
    broot                             # tree files view
    caligula                          # User-friendly, lightweight TUI for disk imaging
    hyperfine                         # benchmarking tool
    pastel                            # cli to manipulate colors
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    tokei                             # project line counter
    translate-shell                   # cli translator
=======
    bitwise                           # cli tool for bit / hex manipulation
    broot                             # tree files view
    caligula                          # User-friendly, lightweight TUI for disk imaging
    hyperfine                         # benchmarking tool
    pastel                            # cli to manipulate colors
    scooter                           # Interactive find and replace in the terminal
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    tokei                             # project line counter
    translate-shell                   # cli translator
>>>>>>> refs/remotes/foundation/main
    woomer
    yt-dlp-light

    ## TUI
    epy # ebook reader
    gtt # google translate TUI
    programmer-calculator
<<<<<<< HEAD
    toipe # typing test in the terminal
    tomato-c # TUI pomodoro timer
    ttyper # cli typing test
||||||| 7b9b95fa
    toipe                             # typing test in the terminal
    tomato-c                          # TUI pomodoro timer
    ttyper                            # cli typing test
=======
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
>>>>>>> refs/remotes/foundation/main

    ## Monitoring / fetch
    htop
<<<<<<< HEAD
    neofetch
    nitch # systhem fetch util
    onefetch # fetch utility for git repo
    wavemon # monitoring for wireless network devices
||||||| 7b9b95fa
    neofetch
    nitch                             # systhem fetch util
    onefetch                          # fetch utility for git repo
    wavemon                           # monitoring for wireless network devices
=======
    onefetch                          # fetch utility for git repo
    wavemon                           # monitoring for wireless network devices
>>>>>>> refs/remotes/foundation/main

    ## Fun / screensaver
    asciiquarium-transparent
    cbonsai
    cmatrix
    countryfetch
    cowsay
    figlet
    fortune
    lavat
    lolcat
    pipes
    sl
    tty-clock

    ## Multimedia
    imv
    lowfi
    mpv

    ## Utilities
    entr # perform action when file change
    ffmpeg
    file # Show file information
    jq # JSON processor
    killall
    libnotify
    mimeo
    openssl
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    poweralertd
    udiskie                           # Automounter for removable media
    unzip
    wget
    nil
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils

    winetricks
    wineWowPackages.waylandFull

    # LaTeX
    texliveFull
    pandoc
  ];
}
