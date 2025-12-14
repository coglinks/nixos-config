{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## misc
    conda
    pdftk
    starship
    quarto
    chezmoi
    python313Packages.conda

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
    woomer
    yt-dlp-light

    ## TUI
    epy # ebook reader
    gtt # google translate TUI
    programmer-calculator
    toipe # typing test in the terminal
    tomato-c # TUI pomodoro timer
    ttyper # cli typing test

    ## Monitoring / fetch
    htop
    neofetch
    nitch # systhem fetch util
    onefetch # fetch utility for git repo
    wavemon # monitoring for wireless network devices

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
    poppler-utils
    ani-cli
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
