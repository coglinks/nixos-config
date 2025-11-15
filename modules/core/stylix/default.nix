{
  inputs,
  pkgs,
  username,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    # base16Scheme = ./assets/dark-palette.yaml;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
    fonts = {
      monospace = {
        package = pkgs.maple-mono.truetype-autohint;
        name = "MapleMono";
      };

      sansSerif = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };

      serif = {
        name = "IosevkaTermSlab Nerd Font";
        package = pkgs.nerd-fonts.iosevka-term-slab;
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  # specialisation.light.configuration = {
  #   stylix = {
  #     base16Scheme = lib.mkForce ./assets/light-pallete.yaml;
  #   };
  # };

  home-manager.users.${username} = {
    stylix = {
      enable = true;
      targets = {
        firefox.profileNames = [ "incogshift" ];
        waybar.enable = false;
        rofi.enable = false;
        hyprlock.enable = false;
      };
    };
  };
}

# Function to convert the colours in an image based on my color scheme

/*
  convert -size 16x1 \
    xc:"base00" xc:"base01" xc:"base02" xc:"base03" \
    xc:"base04" xc:"base05" xc:"base06" xc:"base07" \
    xc:"base08" xc:"base09" xc:"base0A" xc:"base0B" \
    xc:"base0C" xc:"base0D" xc:"base0E" xc:"base0F" \
    +append palette.png

  magick input.png +dither -remap palette.png output.png
*/
